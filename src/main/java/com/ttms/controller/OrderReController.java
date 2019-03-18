package com.ttms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ttms.dao.OrderDao;
import com.ttms.dao.SeatDao;
import com.ttms.entity.Film;
import com.ttms.entity.Order;
import com.ttms.entity.OrderDetials;
import com.ttms.entity.Perform;
import com.ttms.entity.Seat;
import com.ttms.entity.SeatType;
import com.ttms.entity.Ticket;
import com.ttms.entity.User;
import com.ttms.service.FilmService;
import com.ttms.service.OrderDetialsService;
import com.ttms.service.OrderService;
import com.ttms.service.PerformService;
import com.ttms.service.SeatService;
import com.ttms.service.TicketService;

import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 订单前台Controler层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/order")
public class OrderReController 
{
	
	@Resource
	private PerformService performService;
	
	@Resource
	private SeatService seatService;
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private OrderDetialsService orderDetialsService;
	
	@Resource
	private TicketService ticketService;
	
	@Resource
	private FilmService filmService;
	
	
	@RequestMapping("/details/{uuid}")
	public ModelAndView details(@PathVariable("uuid")String uuid,
			@RequestParam(value="ispay",required = false)String ispay) throws Exception
	{
		
		List<Ticket> ticket=ticketService.findByUuid(uuid);//获得座位
		OrderDetials orderDetials=orderDetialsService.findByUuid(uuid).get(0);//订单详情
		Perform perform=ticket.get(0).getPerform();//获得演出计划
		Date payDate=orderDetials.getOrderDateTime();
		Date date=new Date();
		if(((date.getTime()-payDate.getTime())/(1000*60)>15)&&(orderDetials.getState()==1))
		{
			orderDetials.setState(3);
			orderDetialsService.updateadd(orderDetials);
		}
		if("0".equals(ispay)/*计算一下时间  看看是不是时间超过了*/)
		{
			//订单作废了
			orderDetials.setState(0);
			orderDetialsService.updateadd(orderDetials);
		}
		if("1".equals(ispay))//这个表示从已支付页面过来的
		{
			orderDetials.setState(2);
			//设置为已支付
			orderDetialsService.updateadd(orderDetials);
			//电影票房进行添加
			Film film=perform.getFilm();
			film.setBox(Math.round(film.getBox()+(ticket.size()*perform.getPrice())));
			filmService.update(film);
		}
		
		ModelAndView mav = new ModelAndView();
		String totalPrice=(ticket.size())*(perform.getPrice())+"";
		mav.addObject("ticket",ticket);
		mav.addObject("orderDetials", orderDetials);
		mav.addObject("perform", perform);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("pageTitle","详情--皮皮祁电影--一网打进好电影");
		mav.addObject("mainPage","foreground/order/dingdanxiangqing");
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/buyTicket")
	public ModelAndView buyTicket(
			@RequestParam(value="filmId",required = false)Integer filmId,
			@RequestParam(value="performId",required = false)Integer performId)
					throws Exception
	{
		//根据订单获取场次中的座位信息
		Perform perform=performService.findById(performId);
		List<Ticket> ticketList=ticketService.findByPerformId(performId);
		List<Ticket> resultTicket=new ArrayList<Ticket>();
		List<OrderDetials> resultOrderDetials=new ArrayList<OrderDetials>();
		
		for(Ticket t:ticketList)
		{
			List<OrderDetials> orderDetialsList=orderDetialsService.findByUuid(t.getUuid());
			for(OrderDetials o:orderDetialsList)
			{
				
				if(o.getState()==1||o.getState()==2) 
				{
					//已支付或者是待支付
					resultOrderDetials.add(o);
				}
			}
		}
		for(Ticket t:ticketList)
		{
			for(OrderDetials o:resultOrderDetials)
			{
				if(t.getUuid().equals(o.getUuid()))
				{
					resultTicket.add(t);
				}
			}
		}
		List<String> soldSeat=new ArrayList<String>();
		for(Ticket t:resultTicket)
		{
			String aString=t.getSeat().getRow()+","+t.getSeat().getCol();
			soldSeat.add(aString);
		}
		//向perfrom中添加seat
		List<Seat> seatList=seatService.findSeatByStudioId(perform.getStudio().getId());
		perform.setSeat(seatList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("soldSeat", soldSeat);
		mav.addObject("perform", perform);
		mav.addObject("pageTitle","选座--猫爪电影--一网打进好电影");
		mav.addObject("mainPage","foreground/order/buyTicket");
		mav.setViewName("index");
		return mav;
	}
	
	//确认买票 还要确认一下选的票是否已经被人买了
	@RequestMapping("/qrmp")
	public String qrmp(@RequestParam(value="totalPrice",required = false)Integer totalPrice,
			@RequestParam(value="performId",required = false)Integer performId,
			@RequestParam(value="string",required = false)String[] string,
			HttpSession session,
			HttpServletResponse response) throws Exception
	{
		//所选的演出
		Perform perform=performService.findById(performId);
		//所选座位
		List<Seat> seatList=new ArrayList<Seat>();
		
		int result=0;
 		int orderDetialsResult=0;
 		int ticketResult=0;
 		OrderDetials orderDetials=null;
 		User  currentUser=(User) session.getAttribute("currentUser");
 		String uuid=UUID.randomUUID()+"";
 		
		/*得到选择的所有的座位id*/
		for(int i=0;i<string.length;i++)
		{
			int row=Integer.parseInt( string[i].split("排")[0]);
			int col=Integer.parseInt( string[i].split("排")[1].substring(0,string[i].split("排")[1].length()-1));
			Seat seat=new Seat(row,col,perform.getStudio());
			Map<String , Object> map=new HashMap<String, Object>();
			map.put("seat", seat);
			Seat resultSeat=seatService.findByPerform(map);
			if(resultSeat!=null)
			{
				
				int id=resultSeat.getId();
				Map<String, Integer> tempmap=new HashMap<String, Integer>();
				map.put("performId", performId);
				map.put("seatId", id);
				List<Ticket> ticket=ticketService.findByPerformIdAndSeatId(tempmap);
				System.out.println(id);
				System.out.println(performId);
				if(ticket.size()!=0)
				{
					System.out.println("asda");
					return null;
				}
			}
			
			seatList.add(resultSeat);
			
		}
		Order order=orderService.getOrderByUser(currentUser.getId());		
		if(order==null)
		{
			//第一次买票
			Order newOrder=new Order();
			newOrder.setUser(currentUser);
			newOrder.setNumber(1);
			newOrder.setAmount(totalPrice);
			result=orderService.addOrder(newOrder);	
		}
		else 
		{
			//第二次买票
			order.setNumber(order.getNumber()+1);
			order.setAmount(order.getAmount()+totalPrice);
			result=orderService.updateOrder(order);
		}
		Order resultOrder =orderService.getOrderByUser(currentUser.getId());
		if(result==1)
		{
			/*开始添加订单详情*/
			orderDetials=new OrderDetials();
			orderDetials.setOrderId(resultOrder.getId());
			orderDetials.setUuid(uuid);
			
			orderDetialsResult=orderDetialsService.add(orderDetials);
		}	
		/*开始添加票*/
		if(orderDetialsResult==1)
		{
			List<Ticket> ticketList=new ArrayList<Ticket>();
			for(Seat s:seatList)
			{
				Ticket ticket=new Ticket();
				ticket.setUuid(orderDetials.getUuid());
				ticket.setPerform(perform);
				ticket.setSeat(s);
				ticketResult+=ticketService.add(ticket);//添加票
				ticketList.add(ticket);
			}
		}
		
		
		
		JSONObject resultJson=new JSONObject();
		resultJson.put("performId", performId);
		resultJson.put("uuid", uuid);
		resultJson.put("totalPrice",totalPrice);
		ResponseUtil.write(response, resultJson);
		return null;
	}
	
	@RequestMapping("/payment")
	public ModelAndView payment(@RequestParam(value="uuid",required = false)String uuid, 
			@RequestParam(value="totalPrice",required = false)String totalPrice,
			@RequestParam(value="performId",required = false)String performId)throws Exception
	{
		
		int intPerformId=Integer.parseInt(performId);
		float floatTotalPrice=Float.parseFloat(totalPrice);
		Perform perform=performService.findById(intPerformId);
		List<Ticket> ticketLits=ticketService.findByUuid(uuid);
		OrderDetials orderDetials= orderDetialsService.findByUuid(uuid).get(0);
		int Year=(Integer)orderDetials.getOrderDateTime().getYear()+1900;
		int Month=(Integer)orderDetials.getOrderDateTime().getMonth()+1;
		List<Seat> seatList=new ArrayList<Seat>();
		for(int i=0;i<ticketLits.size();i++)
		{
			Seat seat=ticketLits.get(i).getSeat();
			seatList.add(seat);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("seatList", seatList);
		mav.addObject("perform",perform);
		mav.addObject("floatTotalPrice", floatTotalPrice);
		mav.addObject("uuid",uuid);
		mav.addObject("pageTitle","付款--猫爪电影--一网打进好电影");
		mav.addObject("mainPage","foreground/order/payment");
		System.out.println("胡莎莎要加油鸭！！！");
		mav.addObject("payDate",Year+"/"+Month+"/"+orderDetials.getOrderDateTime().getDate()+" "+orderDetials.getOrderDateTime().getHours()+":"+orderDetials.getOrderDateTime().getMinutes()+":"+orderDetials.getOrderDateTime().getSeconds() );
		mav.setViewName("index");
		return mav;
	}
}
