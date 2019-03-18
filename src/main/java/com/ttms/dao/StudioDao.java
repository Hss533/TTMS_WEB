package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Link;
import com.ttms.entity.Studio;

/**
 * 演出厅Dao层
 * @author Administrator
 *
 */
public interface StudioDao 
{
	/**
	 * 查询演出厅
	 * @param map
	 * @return
	 */
	public List<Studio> find(Map map);
	
	/**
	 * 查询总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加演出厅
	 * @param link
	 * @return
	 */
	public int add(Studio studio);
	
	/**
	 * 修改演出厅 修改演出厅的时候只能修改演出厅的名称 其他的不能进行修改
	 * @param link
	 * @return
	 */
	public int update(Studio studio);
	
	/**
	 * 删除演出厅
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Studio findById(Integer id);
	
	/**
	 * 获取最大的id
	 */
	public Integer getMaxId();
	
}
