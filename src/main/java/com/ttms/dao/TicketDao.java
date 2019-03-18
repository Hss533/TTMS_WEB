package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Ticket;

public interface TicketDao {
	
	/**
	 * 根据uuid进行查找票
	 * @param uuid
	 * @return
	 */
	public List<Ticket> findByUuid(String uuid);
	
	/**
	 * 根据票的id进行查找
	 * @param id
	 * @return
	 */
	public Ticket  findById(Integer id);
	/**
	 * 添加票
	 * @param ticket
	 * @return
	 */
	public int  add(Ticket ticket);
	/**
	 * 根据演出id进行查找
	 * @param performId
	 * @return
	 */
	public List<Ticket> findByPerformId(Integer performId);
	
	/**
	 * 根据演出ID和座位进行查找
	 * @param map
	 * @return
	 */
	public List<Ticket> findByPerformIdAndSeatId(Map<String,Integer> map);
}
