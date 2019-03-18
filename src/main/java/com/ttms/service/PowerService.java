package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Power;

/**
 * 权限service层
 * @author hu
 *
 */
public interface PowerService {
	
	/**
	 * 查询所有的权限
	 * @param map
	 * @return
	 */
	public List<Power> find(Map<String,Object> map);
	
	/**
	 * 查询总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map<String, Object> map);

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
