package com.ttms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.ManagerDao;
import com.ttms.entity.Manager;
import com.ttms.service.ManagerService;

/**
 * 管理员Service实现类
 * @author Administrator
 *
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService
{
	@Resource
	private ManagerDao managerDao;

	public Manager login(Manager manager) {
		// TODO Auto-generated method stub
		return managerDao.login(manager);
	}

	public Integer update(Manager manager) {
		// TODO Auto-generated method stub
		return managerDao.update(manager);
	}

}
