package com.ttms.controller;

import java.awt.Image;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.tools.classfile.Annotation.element_value;
import com.sun.tools.javac.code.Type.ForAll;
import com.ttms.entity.Information;
import com.ttms.entity.Order;
import com.ttms.entity.OrderDetials;
import com.ttms.entity.Power;
import com.ttms.entity.Seat;
import com.ttms.entity.Ticket;
import com.ttms.entity.User;
import com.ttms.service.InformationService;
import com.ttms.service.OrderDetialsService;
import com.ttms.service.OrderService;
import com.ttms.service.TicketService;
import com.ttms.service.UserService;
import com.ttms.util.ResponseUtil;
import com.ttms.util.StringUtil;

import net.sf.json.JSONObject;

/**
 * 用户Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserReController 
{
	@Resource
	private UserService userService;
	
	@Resource
	private InformationService informationService;
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private OrderDetialsService orderDetialsService;
	
	@Resource
	private TicketService ticketService;
	/**
	 * 用户登录页面
	 * @param user
	 * @param remember
	 * @param session
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public ModelAndView login(User user,
			@RequestParam(value="remember",required=false)String remember,
			@RequestParam(value="lastUrl",required=false)String lastUrl,
			HttpSession session,
			HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		User currentUser = userService.login(user);
		if(currentUser != null)
		{
			session.setAttribute("currentUser", currentUser);
			if("remember-me".equals(remember))
			{
				//设置cookie
				rememberMe(user.getAccount(),user.getPassword(),response);
			}
			if(lastUrl != null)
			{
				mav.setViewName("redirect:/"+lastUrl);
			}
			else
			{
				mav.setViewName("redirect:/index.jsp");
			}
			return mav;
		}
		else
		{
			mav.addObject("user",user);
			mav.addObject("errorInfo","账号或密码错误!");
			mav.setViewName("login");
			return mav;
		}
	}
	
	/**
	 * 记住我
	 * @param account
	 * @param password
	 * @param response
	 */
	private void rememberMe(String account,String password,HttpServletResponse response) 
	{
		//如果需要获取cookie的话，是使用request.getCookie()
		Cookie user = new Cookie("user", account+"-"+password);
		user.setMaxAge(1*60*60*24*7);
		user.setPath("/");
		response.addCookie(user);
	}
	
	/**
	 * 判断账号是否重复
	 * @param account
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/accountCheck")
	public String accountCheck(@RequestParam(value="account",required=false)String account,HttpServletResponse response) throws Exception
	{
		Integer resultTotal = userService.checkAccount(account);
		JSONObject result = new JSONObject();
		if(resultTotal > 0)
		{
			result.put("result", "no");
		}
		else
		{
			result.put("result", "yes");
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @param imageCode
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/registered")
	public ModelAndView registered(HttpServletRequest request,User user,@RequestParam(value="yanzhengma",required=false)String yanzhengma,HttpSession session)throws Exception
	{

		ModelAndView mav = new ModelAndView();
		
		int flag=1;//用来判断是否重复
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("account", user.getAccount());
		List<User> findUser=userService.find(map);
		
		if(findUser.size()==0)//没有重复的出现
		{
			String sRand = (String)session.getAttribute("sRand");
			if(yanzhengma.equals(sRand))
			{
				// 新注册用户默认是普通会员
				Power power = new Power();
				power.setId(1);;
				user.setPower(power);
				user.setUserImage("./static/image/user/404.png");;			
				int resultTotal = userService.add(user);
				if(resultTotal > 0)
				{
					mav.addObject("success",true);
				}
				if(resultTotal<=0)
				{
					
					mav.addObject(user);
					mav.addObject("success",false);
					mav.addObject("errorResult","添加失败");
				}
			}
			else
			{
				mav.addObject(user);
				mav.addObject("success",false);
				mav.addObject("errorResult","验证码错误");
			}
			
			}
		else 
		{
			mav.addObject(user);
			mav.addObject("success",false);
			mav.addObject("errorResult","用户名已被注册");	
		}
		mav.setViewName("registered");	
		return mav;
	}
	
	/**
	 * 用户退出
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/logout")
	private String initSession(HttpServletRequest request)
	{
		Enumeration em = request.getSession().getAttributeNames();
		while(em.hasMoreElements())
		{
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		
	
		return "redirect:/index.jsp";
	}
	
	/**
	 * 点赞
	 * @param type
	 * @param userId
	 * @param informationId
	 */
	@RequestMapping("/fabulous")
	public void fabulous(@RequestParam(value="type")Integer type,
			@RequestParam(value="userId")Integer userId,
			@RequestParam(value="informationId")Integer informationId)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("informationId", informationId);
		Information information = informationService.findById(informationId);
		// 点赞
		if(type == 1)
		{
			userService.dianzan(map);
			information.setPraiseHit(information.getPraiseHit() + 1);
			informationService.update(information);
		}
		// 取消点赞
		else
		{
			userService.quxiaozan(map);
			information.setPraiseHit(information.getPraiseHit() - 1);
			informationService.update(information);
		}
	}
	
	/**
	 * 显示用户信息
	 * @param session
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/show/{id}")
	public ModelAndView userMessage(@PathVariable("id")Integer id,HttpSession session,HttpServletResponse response) throws Exception
	{
		
		User  currentUser=(User) session.getAttribute("currentUser");
		ModelAndView mav = new ModelAndView();
		if(currentUser==null)
		{
			//当前没有用户登录
			mav.setViewName("login");
		}
		else 
		{	
			Order order=orderService.getOrderByUser(currentUser.getId());
			List<OrderDetials> orderDetialsList=null;
			if(order!=null)
			{
				orderDetialsList=orderDetialsService.find(order.getId());
				for(OrderDetials o:orderDetialsList)
				{
					Date date=new Date();
					if(((date.getTime()-o.getOrderDateTime().getTime())/(1000*60)>15)&&(o.getState()==1))
					{
						o.setState(3);
						orderDetialsService.updatedel(o);
					}
					String uuid=o.getUuid();
					List<Ticket> ticket=ticketService.findByUuid(uuid);
					o.setTickets(ticket);
				}
			}
			mav.addObject("orderDetialsList",orderDetialsList);
			mav.addObject("mainPage","foreground/user/userMessage");
			mav.addObject("id",id);
			mav.setViewName("index");
			
		}
		return mav;
	}
	
	/**
	  用户修改资料
	 * @param user
	 * @param response
	 * @param request
	 * @param session
	 * @param shengri
	 * @param fileImage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyUser")//这个默认是什么?method = RequestMethod.POST
	//如果上传多个文件的话 参数应该是MultipartFile[] files  
	public String userMessage(User user,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(value="shengri",required=false)String shengri,
			@RequestParam(value="fileImage",required=false)MultipartFile fileImage
			)throws Exception
	{
		//做为返回值
		JSONObject result = new JSONObject();
		String userImage=null;
		User currentUser = (User)session.getAttribute("currentUser");
		//图片文件
		if(fileImage!=null)
		{
			String path = request.getSession().getServletContext().getRealPath("/");
			String fileName = fileImage.getOriginalFilename();
			
			//给每个用户设置一个存放头像的目录,创建新的文件不好创建，作罢！！！
			userImage = "static\\image\\user\\" + UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
			File newFile = new File(path + userImage);
			
			fileImage.transferTo(newFile);
		}
		//头像信息
		if(StringUtil.isNotEmpty(userImage))
		{
			//如果进行了头像修改操作
			currentUser.setUserImage(userImage);
			result.put("userImage", userImage);
			userService.update(currentUser);
			session.setAttribute("currentUser", currentUser);
			result.put("success", true);
			ResponseUtil.write(response, result);
		}
		else 
		{
			//如果没有进行头像修改操作，只是进行了信息修改操作
			user.setUserImage(currentUser.getUserImage());
			result.put("userImage", currentUser.getUserImage());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if(!StringUtil.isEmpty(shengri))
			{
				Date birthday = sdf.parse(shengri);
				user.setBirthday(birthday);
			}
			user.setId(currentUser.getId());
			userService.update(user);
			session.setAttribute("currentUser", user);
			result.put("success", true);
			ResponseUtil.write(response, result);		
		}	
		return null;
	}
	
	
	
}
