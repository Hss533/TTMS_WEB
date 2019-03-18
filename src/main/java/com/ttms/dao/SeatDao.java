package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Seat;

/**
 * 座位Dao层
 * @author Administrator
 *
 */
public interface SeatDao 
{
	/**
	 * 查询座位
	 * @param map
	 * @return
	 */
	public List<Seat> find(Map map);
	
	/**
	 * 查询总记录数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	
	/**
	 * 添加座位
	 * @param seat
	 * @return
	 */
	public int add(Seat seat);
	/**
	 * 修改座位
	 * @param link
	 * @return
	 */
	public int update(Seat seat);
	
	/**
	 * 删除座位
	 * @param id
	 * @return
	 */
	public int delete(Integer id);

	/**
	 * 删除该演出厅的所有座位
	 * @param studioId
	 * @return
	 */
	public int deleteAllInStudio(Integer studioId);
	/**
	 * 根据演出厅id查找seat
	 * @param studioId
	 * @return
	 */
	public List<Seat> findSeatByStudioId(Integer studioId);
	/**
	 * 根据座位id 查找座位
	 * @param id
	 * @return
	 */
	public Seat findById(Integer id);
	/**
	 * 根据col row 还有studioid 查找seat
	 * @param map
	 * @return
	 */
	public Seat findByPerform(Map map);
}
