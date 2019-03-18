package com.ttms.controller.background;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ttms.entity.Film;
import com.ttms.entity.PageBean;
import com.ttms.entity.Perform;
import com.ttms.service.FilmService;
import com.ttms.service.PerformService;
import com.ttms.util.DateJsonValueProcessor;
import com.ttms.util.DateUtil;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 后台友情链接Controller模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/perform")
public class PerformController 
{
	@Resource
	private PerformService performService;
	@Resource
	private FilmService filmService;
	
	//绑定方法，将字符串转换为日期对象
	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response) throws Exception
	{
		
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Perform> performList =performService.find(map);
		// 过滤掉film属性
		for(Perform temp:performList)
		{
			Film film = temp.getFilm();
			film.setEmployee(null);
			film.setEmployees(null);
			film.setFilmTypes(null);
			film.setPictures(null);
			temp.setFilm(film);
		}
		Long total = performService.count(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(performList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或修改演出计划
	 * @param link
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Perform perform,HttpServletResponse response) throws Exception
	{
		int resultTotal = 0;
		Film film=filmService.findById(perform.getFilm().getId());
		Date stratTime = perform.getStartTime();
		JSONObject result = new JSONObject();
		// 判断演出计划时间是否低于现在时间
		if(!stratTime.after(new Date()))
		{
			result.put("success", false);
			result.put("errorInfo", "该演出计划时间低于现在时间");
			ResponseUtil.write(response, result);
			return null;
		}
		// 获取该演出计划上一场演出计划
		Perform leftPerform = performService.getLeft(stratTime);
		// 获取该演出计划下一场演出计划
		Perform rightPerform = performService.getRight(stratTime);
		// 计算结束时间
		Integer filmLong = film.getDuration();
		Date endTime = DateUtil.getEndTime(stratTime, filmLong);
		if(leftPerform != null && leftPerform.getEndTime().after(stratTime))
		{
			result.put("success", false);
			result.put("errorInfo", "上一场演出计划还未结束");
			ResponseUtil.write(response, result);
			return null;
		}
		if(rightPerform != null && rightPerform.getStartTime().before(endTime))
		{
			result.put("success", false);
			result.put("errorInfo", "下一场演出计划还未开始");
			ResponseUtil.write(response, result);
			return null;
		}
		if(perform.getId() == null)
		{
			perform.setEndTime(endTime);
			resultTotal = performService.add(perform);
		}
		else
		{
			perform.setEndTime(endTime);	  
			resultTotal = performService.update(perform);
		}
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
	 * 删除用户
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
			performService.delete(Integer.parseInt(strIds[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
