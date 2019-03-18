package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Link;
import com.ttms.entity.User;

/**
 * 用户dao层
 * @author hu
 *
 */
public interface UserDao 
{

	/**
	 * 查询所有用户
	 * @param map
	 * @return
	 */
	public List<User> find(Map map);
	
	/**
	 * 查询用户总数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加用户
	 * @param link
	 * @return
	 */
	public int add(User user);
	
	/**
	 * 修改用户信息
	 * @param link
	 * @return
	 */
	public int update(User link);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 验证账号
	 * @param account
	 * @return
	 */
	public Integer checkAccount(String account);
	
	/**
	 * 点赞
	 * @param map
	 */
	public void dianzan(Map map);
	
	/**
	 * 取消点赞
	 * @param map
	 */
	public void quxiaozan(Map map);
	
	/**
	 * 获取用户点赞
	 * @param userId
	 * @return
	 */
	public List getZan(Integer userId);

	/**
	 * 根据用户id 获取用户
	 * @param userId
	 * @return
	 */
	public User findById(Integer id);
}
