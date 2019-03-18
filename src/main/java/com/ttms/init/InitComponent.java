package com.ttms.init;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.ttms.entity.Film;
import com.ttms.entity.FilmType;
import com.ttms.entity.Information;
import com.ttms.entity.Link;
import com.ttms.service.FilmService;
import com.ttms.service.FilmTypeService;
import com.ttms.service.InformationService;
import com.ttms.service.LinkService;

/**
 * 初始化类
 * @author Administrator
 *
 */
@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware
{
	
	private static ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException 
	{
		this.applicationContext = applicationContext;
	}

	public void contextInitialized(ServletContextEvent sce) 
	{
		ServletContext application = sce.getServletContext();
		// 关于资讯的处理
		InformationService informationService = (InformationService)applicationContext.getBean("informationService");
		//这个动作比所有的servlet都要遭
		List<Information> informationList = informationService.findNew();
		application.setAttribute("informationList", informationList);
		
		// 关于电影的处理
		FilmService filmService=(FilmService) applicationContext.getBean("filmService");
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
		
		// 关于电影类型
		FilmTypeService filmTypeService = (FilmTypeService) applicationContext.getBean("filmTypeService");
		List<FilmType> filmTypes = filmTypeService.find(null);
		application.setAttribute("filmTypes", filmTypes.subList(0, 5));
		
		// 友情链接处理
		LinkService linkService=(LinkService) applicationContext.getBean("linkService");
		List<Link> linkList=linkService.find(null);
		application.setAttribute("linkList", linkList);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
	
}
