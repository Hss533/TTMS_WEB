package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Film;
import com.ttms.entity.Picture;

/**
 * 电影管理Service层
 * @author Administrator
 *
 */
public interface FilmService 
{
	/**
	 * 获取电影
	 * @param map
	 * @return
	 */
	public List<Film> find(Map map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加电影
	 * @param film
	 * @return
	 */
	public int add(Film film);
	
	/**
	 * 修改电影
	 * @param film
	 * @return
	 */
	public int update(Film film);
	
	/**
	 * 删除电影
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据Id获取电影
	 * @param id
	 * @return
	 */
	public Film findById(Integer id);
	
	/**
	 * 获取当前最大id
	 * @return
	 */
	public Integer getMaxId();
	
	/**
	 * 向中间表添加数据
	 * @param map
	 * @return
	 */
	public Integer addMiddleTable(Map map);
	
	/**
	 * 电影相关图集
	 * @param map
	 * @return
	 */
	public Integer addPictures(Map map);
	
	/**
	 * 获取热门电影数量
	 * @return
	 */
	public Integer getHotNum();
	
	/**
	 * 获取热门电影
	 * @return
	 */
	public List<Film> getFilmByHot(Map map);
	
	/**
	 * 获取高票房电影
	 * @return
	 */
	public List<Film> getFilmByBox(Map map);
	
	/**
	 * 获取高点击次数电影
	 * @return
	 */
	public List<Film> getFilmByClickHit(Map map);
	
	/**
	 * 获取高分电影
	 * @return
	 */
	public List<Film> getFilmByScore(Map map);
	
	/**
	 * 根据电影类型获取
	 * @param id
	 * @return
	 */
	public List<Film> findByFilmTypeId(Integer id);
	
	/**
	 * 根据电影id删除先关类型
	 * @param id
	 */
	public int deleteByFilmId(Integer id);
	
	/**
	 * 删除相关电影图片
	 * @param id
	 * @return
	 */
	public int deletePictures(Integer id);

	public List<Film> findByName(String name);

	public Integer findCountByName(String name) ;
}
