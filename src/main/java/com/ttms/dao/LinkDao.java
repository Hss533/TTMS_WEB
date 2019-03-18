package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Link;

/**
 * 友情链接Dao层
 * @author Administrator
 *
 */
public interface LinkDao 
{
	/**
	 * 查询友情链接
	 * @param map
	 * @return
	 */
	public List<Link> find(Map map);
	
	/**
	 * 查询总记录数
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
