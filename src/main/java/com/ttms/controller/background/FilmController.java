package com.ttms.controller.background;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ttms.entity.Employee;
import com.ttms.entity.Film;
import com.ttms.entity.FilmType;
import com.ttms.entity.PageBean;
import com.ttms.service.FilmService;
import com.ttms.service.InformationService;
import com.ttms.util.DateJsonValueProcessor;
import com.ttms.util.ResponseUtil;
import com.ttms.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 电影Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/film")
public class FilmController 
{
	@Resource
	private FilmService filmService;
	
	@Resource
	private InformationService informationService;
	
	//绑定方法，将字符串转换为日期对象
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	/**
	 * 电影列表
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
		Long total = filmService.count(map);
		List<Film> filmList = filmService.find(map);
		
		for(Film temp:filmList)
		{
			// 过滤掉电影类型中的电影属性
			List<FilmType> filmTypes = temp.getFilmTypes();
			for(FilmType type:filmTypes)
			{
				type.setFilms(null);
			}
			temp.setFilmTypes(filmTypes);
			
			// 过滤掉导演类型中的电影属性
			Employee employee = temp.getEmployee();
			employee.setFilms(null);
			temp.setEmployee(employee);
		}
		
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.setExcludes(new String[] {"employees","pictures"});
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(filmList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或修改电影
	 * @param film
	 * @param coverImage
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Film film,
			@RequestParam(value="coverImage",required=false)MultipartFile coverImage,
			@RequestParam(value="filmTypeIds",required=false)String filmTypeIds,
			HttpServletRequest request,HttpServletResponse response
			) throws Exception
	{
		String cover = null;
		if(!coverImage.isEmpty())
		{
			String path = request.getSession().getServletContext().getRealPath("/");
			String fileName = coverImage.getOriginalFilename();
			cover = "static\\image\\movie\\" + UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
			File newFile = new File(path + cover);
			coverImage.transferTo(newFile);
		}
		if(StringUtil.isNotEmpty(cover))
		{
			film.setCover(cover);
		}
		int resultTotal = 0;
		if(film.getId() == null)
		{
			resultTotal = filmService.add(film);
			int maxId = filmService.getMaxId();
			String ids[] = filmTypeIds.split(",");
			Map<String,Object> map = new HashMap<String,Object>();
			if(StringUtil.isNotEmpty(cover))
			{
				map.put("filmId", maxId);
				map.put("url", cover);
				filmService.addPictures(map);
			}
			for(String temp:ids)
			{
				map = new HashMap<String,Object>();
				map.put("filmId", maxId);
				map.put("filmTypeId", Integer.parseInt(temp));
				filmService.addMiddleTable(map);
			}
		}
		else
		{
			filmService.deleteByFilmId(film.getId());
			resultTotal = filmService.update(film);
			String ids[] = filmTypeIds.split(",");
			Map<String,Object> map = new HashMap<String,Object>();
			for(String temp:ids)
			{
				map = new HashMap<String,Object>();
				map.put("filmId", film.getId());
				map.put("filmTypeId", Integer.parseInt(temp));
				filmService.addMiddleTable(map);
			}
		}
		JSONObject result = new JSONObject();
		if(resultTotal > 0)
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
	 * 删除电影
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
			int filmId = Integer.parseInt(strIds[i]);
			// 删除电影
			filmService.delete(filmId);
			// 删除相关类型
			filmService.deleteByFilmId(filmId);
			// 删除相关图片
			filmService.deletePictures(filmId);
			// 删除相关资讯
			informationService.deleteByFilmId(filmId);
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 获取当前所有电影
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/combList")
	public String combList(HttpServletResponse response) throws Exception
	{
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", "");
		jsonObject.put("name", "请选择....");
		jsonArray.add(jsonObject);
		List<Film> filmList = filmService.find(null);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.setExcludes(new String[] {"employee","filmTypes","employees","pictures"});
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray rows = JSONArray.fromObject(filmList,jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(response, jsonArray);
		return null;
	}

}
