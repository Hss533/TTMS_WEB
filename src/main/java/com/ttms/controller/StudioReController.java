package com.ttms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ttms.entity.Film;
import com.ttms.entity.Perform;
import com.ttms.service.FilmService;
import com.ttms.service.PerformService;

/**
 * 后台演出厅Controller模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/studio")
public class StudioReController 
{
	@Resource
	private FilmService filmService;
	@Resource
	private PerformService performServcie;
	
	/**
	 * 演出厅主页面
	 * @param filmId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/allFilms")
	public ModelAndView allFilms(@RequestParam(value="filmId",required=false)Integer filmId) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		// 查出所有的热映电影
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("catId",1);
		List<Film> filmList=filmService.find(map);
		// 获取所有的演出计划
		List<Perform> performList = performServcie.find(map);
		// 获取现在的时间，能买票的演出计划要大于电影的结束时间
		Date nowTime = new Date();
		for(Film f:filmList)
		{
			List<Perform> p = new ArrayList<Perform>();
			for(Perform pf:performList)
			{
				if(pf.getFilm()!=null)
				if(pf.getFilm().getId() == f.getId() && pf.getEndTime().after(nowTime))
				{
					p.add(pf);
				}
			}
			f.setPerforms(p);
		}
		
		mav.addObject("filmId",filmId);
		mav.addObject("filmList",filmList);
		mav.addObject("pageTitle", "影院--猫爪电影--一网打进好电影");
		mav.addObject("mainPage","foreground/studio/choose");
		mav.setViewName("index");
		return mav;
	}
	
}
