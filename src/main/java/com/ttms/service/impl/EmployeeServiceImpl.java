package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.EmployeeDao;
import com.ttms.entity.Employee;
import com.ttms.service.EmployeeService;

/**
 * 雇员Service实现层
 * @author Administrator
 *
 */
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService
{
	@Resource
	private EmployeeDao employeeDao;
	
	/**
	 * 查询
	 */
	public List<Employee> find(Map map) {
		// TODO Auto-generated method stub
		return employeeDao.find(map);
	}
	
}
