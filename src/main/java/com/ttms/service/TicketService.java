package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Ticket;

public interface TicketService {
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

	public List<Ticket> findByPerformIdAndSeatId(Map<String,Integer> map);
}
