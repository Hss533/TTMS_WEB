package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Employee;

/**
 * 雇员Dao层接口
 * @author Administrator
 *
 */
public interface EmployeeDao 
{
	/**
	 * 获取雇员链表
	 * @param map
	 * @return
	 */
	public List<Employee> find(Map map);
	
	/**
	 * 根据id获取
	 * @param id
	 * @return
	 */
	public Employee findById(Integer id);
	
	/**
	 * 获取电影所有雇员
	 * @param id
	 * @return
	 */
	public List<Employee> findByFilmId(Integer id);

}
