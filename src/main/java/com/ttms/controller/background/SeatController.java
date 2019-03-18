package com.ttms.controller.background;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ttms.entity.PageBean;
import com.ttms.entity.Seat;
import com.ttms.service.SeatService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 座位后台Controller模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/seat")
public class SeatController 
{
	@Resource
	private SeatService seatService;
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response) throws Exception
	{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Seat> seatList =seatService.find(map);
		Long total = seatService.count(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(seatList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或修改座位信息
	 * @param link
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Seat seat,HttpServletResponse response) throws Exception
	{
		int resultTotal = 0;
		if(seat.getId() == null)
		{
			resultTotal = seatService.add(seat);
		}
		else
		{
			resultTotal = seatService.update(seat);
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
	 * 删除用户
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
			seatService.delete(Integer.parseInt(strIds[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
