package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.SeatType;

/**
 * 友情链接Service层
 * @author Administrator
 *
 */
public interface SeatTypeService 
{
	/**
	 * 查询所有的座位状态
	 * @param map
	 * @return
	 */
	public List<SeatType> find(Map map);
	
	/**
	 * 查询座位状态的数量
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public SeatType findById(Integer id);

}
