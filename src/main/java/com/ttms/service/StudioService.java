package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Studio;

/**
 * 演出厅service层
 * @author hu
 *
 */
public interface StudioService {
	
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
	 * 获取最大id
	 * @return
	 */
	public Integer getMaxId();

}
