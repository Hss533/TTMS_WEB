package com.ttms.controller.background;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ttms.entity.Employee;
import com.ttms.entity.Film;
import com.ttms.entity.FilmType;
import com.ttms.entity.Link;
import com.ttms.entity.Order;
import com.ttms.entity.OrderDetials;
import com.ttms.entity.PageBean;
import com.ttms.entity.Ticket;
import com.ttms.service.OrderDetialsService;
import com.ttms.service.OrderService;
import com.ttms.service.TicketService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 订单管理
 * @author hu
 *
 */
@Controller
@RequestMapping("/background/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	@Resource
	private OrderDetialsService orderDetialsService;
	
	@Resource
	private TicketService ticketService;
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response) throws Exception
	{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<OrderDetials> orderDetialsList = orderDetialsService.findAll(null);
		for(OrderDetials orderDetials:orderDetialsList)
		{
			//将order填入
			Order order=orderService.getOrderByOrderId(orderDetials.getOrderId());
			order.setOrderDetials(null);
			//将票填入
			List<Ticket> tickets=ticketService.findByUuid(orderDetials.getUuid());
			
			for(Ticket t:tickets)
			{
				Film film=t.getPerform().getFilm();
				film.setEmployees(null);
				film.setFilmTypes(null);
				film.setEmployee(null);
				film.setPictures(null);
				t.getPerform().setFilm(film);
			}
			orderDetials.setTickets(tickets);
			orderDetials.setOrder(order);
		}
		int  total=orderDetialsList.size();
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(orderDetialsList);
		System.out.println(orderDetialsList.toString());
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
}
