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
import com.ttms.entity.SeatType;
import com.ttms.service.SeatTypeService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 后台座位状态Controller模块
 * 座位状态只能进行查看  不能进行删除和修改和添加
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/seattype")
public class SeatTypeController 
{
	@Resource
	private SeatTypeService seatTypeService;
	
	/**
	 * 座位状态
	 * @param page
	 * @param rows
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,HttpServletResponse response) throws Exception
	{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<SeatType> seatTypeList = seatTypeService.find(map);
		Long total = seatTypeService.count(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(seatTypeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 获取当前所有座位状态类型
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/combList")
	public String  combList(HttpServletResponse response) throws Exception
	{
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("id","");
		jsonArray.add(jsonObject);
		List<SeatType> seatTypeList=seatTypeService.find(null);
		JSONArray rows=JSONArray.fromObject(seatTypeList);
		jsonArray.addAll(rows);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
}
