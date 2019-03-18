package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Information;

/**
 * 资讯dao层
 * @author Administrator
 *
 */
public interface InformationDao 
{
	/**
	 * 获取资讯链表
	 * @param map
	 * @return
	 */
	public List<Information> find(Map map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加资讯
	 * @param information
	 * @return
	 */
	public Integer add(Information information);
	
	/**
	 * 获取最新的4条资讯
	 * @return
	 */
	public List<Information> findNew();
	
	/**
	 * 根据id获取资讯
	 * @param id
	 * @return
	 */
	public Information findById(Integer id);
	
	/**
	 * 通过电影id获取资讯
	 * @param id
	 * @return
	 */
	public List<Information> findByFilmId(Integer id);
	
	/**
	 * 删除资讯
	 * @param id
	 * @return
	 */
	public int deleteByFilmId(Integer id);
	
	/**
	 * 修改资讯信息
	 * @param information
	 * @return
	 */
	public int update(Information information);
	
	/**
	 * 删除资讯信息
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

}
