package com.ttms.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ttms.entity.Perform;

/**
 * 演出Dao层
 * @author Administrator
 *
 */
public interface  PerformDao 
{
	/**
	 * 查询演出
	 * @param map
	 * @return
	 */
	public List<Perform> find(Map map);
	
	/**
	 * 查询总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加演出
	 * @param Perform
	 * @return
	 */
	public int add(Perform perform);
	
	/**
	 * 修改演出
	 * @param Perform
	 * @return
	 */
	public int update(Perform perform);
	
	/**
	 * 删除演出
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	/**
	 * 获取上一个演出计划
	 * @return
	 */
	public Perform getLeft(Date time);
	
	/**
	 * 获取下一个演出计划
	 * @return
	 */
	public Perform getRight(Date time);
	
	/**
	 * 根据id进行查找
	 * @param id
	 * @return
	 */
	public Perform findById(Integer id);
}
