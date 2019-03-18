package com.ttms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ttms.entity.Information;
import com.ttms.entity.Picture;
import com.ttms.entity.User;
import com.ttms.service.InformationService;
import com.ttms.service.PictureService;
import com.ttms.service.UserService;
import com.ttms.util.GuolvWenZi;

/**
 * 资讯Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/information")
public class InformationReController 
{
	@Resource
	private InformationService informationService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private PictureService pictureService;
	
	/**
	 * 资讯详情页面
	 * @param id
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/details/{id}")
	public ModelAndView details(@PathVariable("id")Integer id,HttpSession session,HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		Information information = informationService.findById(id);
		
		// 判断当前用户有没有为这条资讯点赞
		User user = (User)session.getAttribute("currentUser");
		if(user != null)
		{
			List<String> informations = userService.getZan(user.getId());
			if(informations.contains(id+""))
			{
				mav.addObject("jundge", "true");
			}
			else
			{
				mav.addObject("jundge", "false");
			}
		}
		else
		{
			mav.addObject("jundge", "false");
		}
		// 修改访问次数
		information.setClickHit(information.getClickHit()+1);
		informationService.update(information);
		//省略过长的名称
		if(information.getFilm().getName().length()>7)
		{
			information.getFilm().setName(information.getFilm().getName().substring(0, 5)+"...");
		}
		mav.addObject("information", information);
		mav.addObject("pageTitle", information.getTitle());
		mav.addObject("mainPage","foreground/information/show");
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/hot")
	public ModelAndView hot(@RequestParam(value="showType",required=false)Integer showType) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(showType==null)
		{
			showType=1;
		}
		
		if(showType == 1)
		{
			// 获取最新的六条资讯
			map.put("order",1);
			map.put("start", 0);
			map.put("size", 6);
			List<Information> zuixinzixunList=informationService.find(map);
			
			// 获取最热的10条资讯
			map.put("order",2);
			map.put("start", 0);
			map.put("size", 10);
			List<Information> remenzixunList=informationService.find(map);
			
			// 获取最新的图集
			List<Picture> pictureList = new ArrayList<Picture>();
			for(Information in:zuixinzixunList)
			{
				Integer filmId = in.getFilm().getId();
				pictureList = pictureService.findByFilmId(filmId);
				in.setPictureNum(pictureList.size());
				in.setPictures(pictureList);
			}
			
			mav.addObject("zuixinzixunList", zuixinzixunList);
			mav.addObject("remenzixunList", remenzixunList);
		}
		else if(showType == 2)
		{
			map = new HashMap<String,Object>();
			map.put("order",1);
			List<Information> xinwenzixunList = informationService.find(map);
			List<Picture> pictureList1=new ArrayList<Picture>();
			for(Information in:xinwenzixunList)
			{
				String  string=GuolvWenZi.delHTMLTag(GuolvWenZi.delSpace(in.getContent()));
				in.setContent(string);
			}
			mav.addObject("xinwenzixunList", xinwenzixunList);
			mav.addObject("xinwenzixunList", xinwenzixunList);
		}
		else
		{
			map = new HashMap<String,Object>();
			map.put("order",1);
			List<Information> xinwenzixunList = informationService.find(map);
			List<Picture> pictureList1=new ArrayList<Picture>();
			for(Information in:xinwenzixunList)
			{
				Integer filmId=in.getFilm().getId();
				pictureList1=pictureService.findByFilmId(filmId);
				in.setPictureNum(pictureList1.size());
				in.setPictures(pictureList1);
				//过滤HTML
				String  string=GuolvWenZi.delHTMLTag(GuolvWenZi.delSpace(in.getContent()));
				in.setContent(string);
			}
			mav.addObject("xinwenzixunList", xinwenzixunList);
		}
		mav.addObject("showType",showType);
		mav.addObject("mainPage","foreground/information/hotSpot");
		mav.setViewName("index");
		return mav;
	}

}
