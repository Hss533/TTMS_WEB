package com.ttms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ttms.entity.Film;
import com.ttms.entity.Manager;
import com.ttms.service.FilmService;
import com.ttms.service.ManagerService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONObject;

/**
 * 管理员Controller层模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/manager2")
public class ManagerController 
{
	@Resource
	private ManagerService managerService;
	@Resource
	private FilmService filmService;
	/**
	 * 后台管理员登录页面
	 * @param manager
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(Manager manager,HttpServletRequest request,HttpSession session) throws Exception
	{
		Manager currentManager = managerService.login(manager);
		if(currentManager != null)
		{
			session.setAttribute("currentManager", currentManager);
			//session.setMaxInactiveInterval(60*2);
//			session.setMaxInactiveInterval();
			return "redirect:/background/main.jsp";
		}
		else
		{
			request.setAttribute("manager", manager);
			request.setAttribute("errorInfo", "账号或密码错误!");
			return "/background/login";
		}
	}
	
	/**
	 * 修改用户密码
	 * @param id
	 * @param newPassword
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(Integer id,String newPassword,HttpServletResponse response) throws Exception
	{
		Manager manager = new Manager();
		manager.setId(id);
		manager.setPassword(newPassword);
		int resultTotal = managerService.update(manager);
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
	 * 清除缓存,安全退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/background/login.jsp";
	}
	
	/**
	 * 搜索结果
	 * @param searchContent
	 * @param type
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/search")
	public ModelAndView details(@RequestParam(value="searchContent",required=false)String searchContent,@RequestParam(value="type",required=false)Integer type) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		if(type == null)
		{
			type = 1;
		}
		if(type == 1)
		{
			List<Film> filmList = filmService.findByName("%"+searchContent+"%");
			Integer count = filmService.findCountByName("%"+searchContent+"%");
			mav.addObject("filmList",filmList);
			mav.addObject("count",count);
		}
		mav.addObject("pageTitle","搜索结果_"+searchContent+"--猫眼电影--一网打进好电影");
		mav.addObject("mainPage","foreground/search/searchResult");
		mav.addObject("searchContent",searchContent);
		mav.addObject("type",type);
		mav.setViewName("index");
		return mav;
	}
	
}
