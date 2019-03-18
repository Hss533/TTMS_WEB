package com.ttms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ttms.entity.Film;
import com.ttms.entity.FilmType;
import com.ttms.entity.Information;
import com.ttms.service.FilmService;
import com.ttms.service.FilmTypeService;
import com.ttms.service.InformationService;

/**
 * 电影前台Controler层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/film")
public class FilmReController 
{
	@Resource
	private FilmService filmService;
	
	@Resource
	private FilmTypeService filmTypeService;
	
	@Resource
	private InformationService informationService;
	
	/**
	 * 电影详情页
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView details(@PathVariable("id")Integer id,HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 每次点击电影，电影访问次数+1
		Film film=filmService.findById(id);
		film.setClickHit(film.getClickHit()+1);
		filmService.update(film);
		
		List<Film> filmAbout=new ArrayList<Film>();
		for(FilmType filmType:film.getFilmTypes())
		{
			List<Film> filmList=filmService.findByFilmTypeId(filmType.getId());
			for(Film f:filmList)
			{
				filmAbout.add(f);
			}
		}
		List<Information> informationList=informationService.findByFilmId(film.getId());
		mav.addObject("filmAbout",filmAbout );
		mav.addObject("informationList", informationList);
		mav.addObject("film",film);
		mav.addObject("pageTitle",film.getName()+"--猫爪电影");
		mav.addObject("mainPage","foreground/film/show");
		mav.setViewName("index");
		return mav;
	}

	/**
	 * 电影列表页
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/show/hotFilms")
	public ModelAndView listHotFilms(
			@RequestParam(value="catId",required = false)Integer catId,
			@RequestParam(value="typeId",required = false)Integer typeId,
			@RequestParam(value="sortId",required = false)Integer sortId ,
			HttpServletRequest request
	) throws Exception
	{
		Map<String,Object> map=new HashMap<String,Object>();
		List<FilmType> filmTypeList=filmTypeService.find(null);
		if(catId == null)
		{
			map.put("catId", 1);
		}
		else
		{
			map.put("catId", catId);
		}
		map.put("typeId", typeId);
		if(sortId == null) 
		{
			map.put("sortId", 1);
		}
		else
		{
			map.put("sortId", sortId);
		}
		List<Film> filmList = filmService.find(map);
		for(Film film:filmList)
		{
			if(film.getName().length()>9)
			{
				film.setName(film.getName().substring(0, 7)+"...");
			}	
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("filmTypeList",filmTypeList);
		mav.addObject("filmList", filmList);
		mav.addObject("pageTitle","热门电影--猫爪电影");
		mav.addObject("mainPage","foreground/film/hotFilms");
		mav.setViewName("index");
		return mav;
	}
	
	/**
	 * 电影榜单界面
	 * @param id
	 * @param pageNum
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/leaderboard/{id}")
	public ModelAndView Leaderboard(@PathVariable("id")Integer id,@RequestParam(value="pageNum",required=false)Integer pageNum) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		Map<String , Object> map = new HashMap<String, Object>();
		if(pageNum == null)
		{
			map.put("start", 0);
			map.put("size", 10);
		}
		else
		{
			map.put("start", 10*(pageNum-1));
			map.put("size", 10*pageNum);
		}
		map.put("sortId", id);
		List<Film> filmList = filmService.find(map);
		if(id == 1)
		{
			mav.addObject("pageTitle","TOP100榜--猫爪电影--一网打紧好电影");
		}
		else if(id == 2)
		{
			mav.addObject("pageTitle","热映口碑榜--猫爪电影--一网打紧好电影");
		}
		else if(id == 3)
		{
			mav.addObject("pageTitle","国内票房榜--猫爪电影--一网打紧好电影");
		}
		
		mav.addObject("filmList",filmList );
		mav.addObject("mainPage","foreground/film/list");
		mav.setViewName("index");
		return mav;
	}

}
