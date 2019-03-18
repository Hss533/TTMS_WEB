package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.SeatDao;
import com.ttms.entity.Seat;
import com.ttms.service.SeatService;

@Service("seatService")
public class SeatServiceImpl implements SeatService{

	@Resource
	private SeatDao seatDao;
	
	public List<Seat> find(Map map) {
		return seatDao.find(map);
	}

	public Long count(Map map) {
		return seatDao.count(map);
	}
	public int add(Seat seat) {
		return seatDao.add(seat);
	}
	
	public int update(Seat seat) {
		return seatDao.update(seat);
	}

	public int delete(Integer id) {
		return seatDao.delete(id);
	}

	public int deleteAllInStudio(Integer studioId) 
	{
		return seatDao.deleteAllInStudio(studioId);
	}

	public List<Seat> findSeatByStudioId(Integer studioId) {
		
		return seatDao.findSeatByStudioId(studioId);
	}

	public Seat findById(Integer id) {
		
		return seatDao.findById(id);
	}

	public Seat findByPerform(Map map) {
		
		return seatDao.findByPerform(map);
	}

}
