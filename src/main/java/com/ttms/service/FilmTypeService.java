package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.FilmType;

/**
 * 电影类型Service层
 * @author Administrator
 *
 */
public interface FilmTypeService 
{
	/**
	 * 查询电影类型
	 * @param map
	 * @return
	 */
	public List<FilmType> find(Map map);
	
	/**
	 * 查询最大记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加电影类型
	 * @param filmType
	 * @return
	 */
	public int add(FilmType filmType);
	
	/**
	 * 修改电影类型
	 * @param filmType
	 * @return
	 */
	public int update(FilmType filmType);
	
	/**
	 * 删除电影类型
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

}
