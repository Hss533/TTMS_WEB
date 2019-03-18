package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.FilmType;

/**
 * 电影类型Dao层
 * @author Administrator
 *
 */
public interface FilmTypeDao 
{
	/**
	 * 查询电影类型
	 * @param map
	 * @return
	 */
	public List<FilmType> find(Map map);
	
	/**
	 * 查询总记录数
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
	
	/**
	 * 获取电影所有类型
	 * @param id
	 * @return
	 */
	public List<FilmType> findByFilmId(Integer id);

}
