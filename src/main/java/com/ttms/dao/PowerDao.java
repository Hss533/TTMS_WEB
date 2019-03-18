package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Power;

/**
 * 权限dao层
 * @author hu
 *
 */
public interface PowerDao {
	
	/**
	 * 查询所有的权限
	 * @param map
	 * @return
	 */
	public List<Power> find(Map map);
	
	/**
	 * 查询总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);

	/**
	 * 添加权限
	 * @param power
	 * @return
	 */
	
	public int add(Power power);
	
	/**
	 * 修改权限
	 * @param power
	 * @return
	 */
	
	public int update(Power power);
	
	/**
	 * 修改权限
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

	/**
	 * 根据id查找权限
	 * @param id
	 * @return
	 */
	public Power findById(Integer id);

}
