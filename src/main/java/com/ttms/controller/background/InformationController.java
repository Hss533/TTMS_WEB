package com.ttms.controller.background;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ttms.entity.Film;
import com.ttms.entity.Information;
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
 * 资讯Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/information")
public class InformationController 
{
	@Resource
	private InformationService informationService;
	
	@Resource
	private FilmService filmServcie;
	
	/**
	 * 资讯列表
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
		List<Information> informationList = informationService.find(map);
		// 过滤掉级联属性
		for(Information temp:informationList)
		{
			Film film = temp.getFilm();
			film.setEmployee(null);
			film.setEmployees(null);
			film.setFilmTypes(null);
			film.setPictures(null);
			temp.setFilm(film);
			
			//处理过长属性
			temp.setContent(temp.getContent().substring(0, 10));
		}
		Long total = informationService.count(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(informationList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/save")
	public String save(Information information,@RequestParam(value="coverImage",required=false)MultipartFile coverImage,HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String cover = null;
		if(!coverImage.isEmpty())
		{
			String path = request.getSession().getServletContext().getRealPath("/");
			String fileName = coverImage.getOriginalFilename();
			cover = "static\\image\\" + UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
			File newFile = new File(path + cover);
			coverImage.transferTo(newFile);
		}
		if(StringUtil.isNotEmpty(cover))
		{
			information.setCover(cover);
		}
		
		// 将资讯中的图片添加到电影图集中
		if(information.getId() == null)
		{
			String content = information.getContent();
			Document doc = Jsoup.parse(content);
			Elements elements = doc.getElementsByTag("img");
			HashMap<String,Object> map = new HashMap<String,Object>();
			for(Element e:elements)
			{
				map.put("filmId", information.getFilm().getId());
				String src = e.attr("src");
				int start = src.indexOf("/static");
				map.put("url",src.substring(start));
				filmServcie.addPictures(map);
			}
		}
		System.out.println(information.getContent());
		int resultTotal = 0;
		if(information.getId() == null)
		{
			resultTotal = informationService.add(information);
		}
		else
		{
			resultTotal = informationService.update(information);
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
	 * 根据Id获取资讯
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id",required=false)Integer id,HttpServletResponse response) throws Exception
	{
		Information information = informationService.findById(id);
		Film film = information.getFilm();
		film.setEmployee(null);
		film.setEmployees(null);
		film.setFilmTypes(null);
		film.setPictures(null);
		information.setFilm(film);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject result = JSONObject.fromObject(information,jsonConfig);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 删除资讯
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
			informationService.delete(Integer.parseInt(strIds[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

}
