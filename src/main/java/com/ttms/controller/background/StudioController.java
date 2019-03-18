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
import com.ttms.entity.SeatType;
import com.ttms.entity.Studio;
import com.ttms.service.SeatService;
import com.ttms.service.StudioService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 后台演出厅Controller模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/studio")
public class StudioController 
{
	@Resource
	private StudioService studioService;
	
	@Resource
	private SeatService seatService;
	
	/**
	 * 演出厅列表
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
		List<Studio> studioList = studioService.find(map);
		Long total = studioService.count(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(studioList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或修改演出厅
	 * @param link
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Studio studio,HttpServletResponse response) throws Exception
	{
		int resultTotal = 0;
		
		if(studio.getId() == null)
		{
			//添加操作
			resultTotal = studioService.add(studio);//添加演出厅
			int result = studioService.getMaxId().intValue();
			studio.setId(result);
			SeatType seatType = new SeatType();
			seatType.setId(1);
			for(int i=1;i<=studio.getLength();i++)
			{
				for(int j=1;j<=studio.getWidth();j++)
				{
					Seat seat = new Seat();
					seat.setRow(i);
					seat.setCol(j);
					seat.setSeatType(seatType);
					seat.setStudio(studio);
					seatService.add(seat);
				}
			}
		}
		else
		{
			resultTotal = studioService.update(studio);
		}
		
		JSONObject result = new JSONObject();
		if(resultTotal > 0)
		{
			result.put("success", true);
		}
		else if(resultTotal>0 && studio.getId() != null)
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
	 * 添加或删除友情链接
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
			System.out.println((Integer.parseInt(strIds[i])));
			seatService.deleteAllInStudio(Integer.parseInt(strIds[i]));//批量删除座位
			studioService.delete(Integer.parseInt(strIds[i]));
			
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	/**
	 * 获取当前所有演出厅
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
		List<Studio> studioList=studioService.find(null);
		JSONArray rows=JSONArray.fromObject(studioList);
		jsonArray.addAll(rows);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
}
