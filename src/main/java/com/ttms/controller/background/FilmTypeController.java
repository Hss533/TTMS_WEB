package com.ttms.controller.background;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ttms.entity.Film;
import com.ttms.entity.FilmType;
import com.ttms.entity.PageBean;
import com.ttms.service.FilmTypeService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 后台电影类型Controller模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/filmType")
public class FilmTypeController 
{
	@Resource
	private FilmTypeService filmTypeService;
	
	/**
	 * 电影类型列表
	 * @param page
	 * @param rows
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response) throws Exception
	{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<FilmType> filmTypeList = filmTypeService.find(map);
		// 处理多对多级联属性
		for(FilmType filmType:filmTypeList)
		{
			List<Film> films = filmType.getFilms();
			for(Film film:films)
			{
				film.setFilmTypes(null);
				film.setEmployees(null);
				film.setPictures(null);
				film.setEmployee(null);
			}
			filmType.setFilms(films);
		}
		Long total = filmTypeService.count(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(filmTypeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或修改电影类型
	 * @param filmType
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(FilmType filmType,HttpServletResponse response) throws Exception
	{
		int resultTotal = 0;
		if(filmType.getId() == null)
		{
			resultTotal = filmTypeService.add(filmType);
		}
		else
		{
			resultTotal = filmTypeService.update(filmType);
		}
		JSONObject result = new JSONObject();
		if(resultTotal>0)
		{
			result.put("success", true);
		}
		else
		{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 删除电影类型
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response) throws Exception
	{
		String strIds[] = ids.split(",");
		for(int i=0;i<strIds.length;i++)
		{
			filmTypeService.delete(Integer.parseInt(strIds[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 获取当前所有电影类型
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/combList")
	public String combList(HttpServletResponse response) throws Exception
	{
		JSONArray jsonArray = new JSONArray();
		List<FilmType> filmTypeList = filmTypeService.find(null);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.setExcludes(new String[] {"films"});
		JSONArray rows = JSONArray.fromObject(filmTypeList,jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
}
