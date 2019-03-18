package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Employee;

/**
 * 雇员Service层
 * @author Administrator
 *
 */
public interface EmployeeService 
{
	/**
	 * 查询雇员
	 * @param map
	 * @return
	 */
	public List<Employee> find(Map map);

}
