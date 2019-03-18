package com.ttms.controller.background;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ttms.entity.Film;
import com.ttms.entity.Information;
import com.ttms.entity.Link;
import com.ttms.service.FilmService;
import com.ttms.service.InformationService;
import com.ttms.service.LinkService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/background/system")
public class SystemController 
{
	@Resource
	private InformationService informationService;
	
	@Resource
	private FilmService filmService;
	
	@Resource
	private LinkService linkService;
	
	@RequestMapping("/refreshSystem")
	public String refreshSystem(HttpServletRequest request,HttpServletResponse response)throws Exception
	{
		//ServlteContext 是一个全局的存储信息的空间 ，服务器开始就存在，服务器关闭才释放。
		ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
		
		// 更新轮播图数据
		List<Information> informationList = informationService.findNew();
		application.setAttribute("informationList", informationList);
		
		// 关于电影的处理
		Integer hotFilmNum=filmService.getHotNum();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("count", 8);
		List<Film> hotFilmList=filmService.getFilmByHot(map);
		map.put("count", 10);
		List<Film> boxFilmList=filmService.getFilmByBox(map);
		map.put("count", 7);
		List<Film> clickHitFilm=filmService.getFilmByClickHit(map);
		map.put("count", 10);
		List<Film> scoreFilm=filmService.getFilmByScore(map);
		
		// 修改一些名字过长的电影
		for(Film film:hotFilmList)
		{
			if(film.getName().length()>7)
			{
				film.setName(film.getName().substring(0, 5)+"...");
			}	
		}
		for(Film film:clickHitFilm)
		{
			if(film.getName().length()>7)
			{
				film.setName(film.getName().substring(0, 5)+"...");
			}	
		}
		for(Film film:boxFilmList)
		{
			if(film.getName().length()>10)
			{
				film.setName(film.getName().substring(0, 10)+"...");
			}	
		}
		for(Film film:scoreFilm)
		{
			if(film.getName().length()>10)
			{
				film.setName(film.getName().substring(0, 10)+"...");
			}	
		}
		application.setAttribute("hotFilmList", hotFilmList);
		application.setAttribute("hotFilmNum", hotFilmNum);
		application.setAttribute("boxFilmList",boxFilmList );
		application.setAttribute("clickHitFilm",clickHitFilm );
		application.setAttribute("scoreFilm",scoreFilm );
		
		// 友情链接处理
		List<Link> linkList=linkService.find(null);
		application.setAttribute("linkList", linkList);
		
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
