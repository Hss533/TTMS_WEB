package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.UserDao;
import com.ttms.entity.Link;
import com.ttms.entity.User;
import com.ttms.service.UserService;

/**
 * 用户Service实现类
 * @author Administrator
 *
 */
@Service("userService")
public class UserServiceImpl  implements UserService
{

	@Resource
	private UserDao userDao;

	public List<User> find(Map map) {
		// TODO Auto-generated method stub
		return userDao.find(map);
	}

	public Long count(Map map) {
		// TODO Auto-generated method stub
		return userDao.count(map);
	}

	public int add(User user) {
		// TODO Auto-generated method stub
		return userDao.add(user);
	}

	public int update(User user) {
		// TODO Auto-generated method stub
		return userDao.update(user);
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return userDao.delete(id);
	}

	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	public Integer checkAccount(String account) {
		// TODO Auto-generated method stub
		return userDao.checkAccount(account);
	}

	public void dianzan(Map map) {
		// TODO Auto-generated method stub
		userDao.dianzan(map);
	}

	public void quxiaozan(Map map) {
		// TODO Auto-generated method stub
		userDao.quxiaozan(map);
	}

	public List getZan(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.getZan(userId);
	}

	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}
	
	

}
