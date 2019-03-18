package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Link;

/**
 * 友情链接Service层
 * @author Administrator
 *
 */
public interface LinkService 
{
	/**
	 * 查询友情链接
	 * @param map
	 * @return
	 */
	public List<Link> find(Map map);
	
	/**
	 * 查询最大记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加友情链接
	 * @param link
	 * @return
	 */
	public int add(Link link);
	
	/**
	 * 修改友情链接
	 * @param link
	 * @return
	 */
	public int update(Link link);
	
	/**
	 * 删除友情链接
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
}
