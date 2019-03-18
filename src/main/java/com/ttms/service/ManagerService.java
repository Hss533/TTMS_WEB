package com.ttms.service;

import com.ttms.entity.Manager;

/**
 * 管理员Service层接口
 * @author Administrator
 *
 */
public interface ManagerService 
{
	
	/**
	 * 管理员登录页面
	 * @param manager
	 * @return
	 */
	public Manager login(Manager manager);
	
	/**
	 * 修改
	 * @param manager
	 * @return
	 */
	public Integer update(Manager manager);

}
