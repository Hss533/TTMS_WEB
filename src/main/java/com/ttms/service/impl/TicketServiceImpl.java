package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.TicketDao;
import com.ttms.entity.Ticket;
import com.ttms.service.TicketService;

@Service("ticketService")
public class TicketServiceImpl implements TicketService{

	@Resource
	private TicketDao ticketDao;
	
	public List<Ticket> findByUuid(String uuid) {
		
		return ticketDao.findByUuid(uuid);
	}

	public Ticket findById(Integer id) {
		
		return ticketDao.findById(id);
	}

	public int add(Ticket ticket) {
		
		return ticketDao.add(ticket);
	}

	public List<Ticket> findByPerformId(Integer performId) {
		
		return ticketDao.findByPerformId(performId);
	}

	public List<Ticket> findByPerformIdAndSeatId(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return ticketDao.findByPerformIdAndSeatId(map);
	}

	
}
