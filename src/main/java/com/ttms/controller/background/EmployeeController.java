package com.ttms.controller.background;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ttms.entity.Employee;
import com.ttms.service.EmployeeService;
import com.ttms.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 后台电影类型Controller模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/background/employee")
public class EmployeeController 
{
	@Resource
	private EmployeeService employeeService;
	
	/**
	 * 获取当前所有电影类型
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/combList")
	public String combList(HttpServletResponse response) throws Exception
	{
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", "");
		jsonObject.put("name", "请选择....");
		jsonArray.add(jsonObject);
		List<Employee> employeeList = employeeService.find(null);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.setExcludes(new String[] {"films"});
		JSONArray rows = JSONArray.fromObject(employeeList,jsonConfig);
		jsonArray.addAll(rows);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
}
