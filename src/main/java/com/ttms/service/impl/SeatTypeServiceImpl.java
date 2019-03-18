package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.SeatTypeDao;
import com.ttms.entity.SeatType;
import com.ttms.service.SeatTypeService;

/**
 * 友情链接Service实现层
 * @author Administrator
 *
 */
@Service("seatTypeService")
public class SeatTypeServiceImpl implements SeatTypeService
{
	@Resource
	private SeatTypeDao seatTypeDao;

	public List<SeatType> find(Map map) {
		return seatTypeDao.find(map);
	}

	public Long count(Map map) {
		return seatTypeDao.count(map);
	}

	public SeatType findById(Integer id) {
		return seatTypeDao.findById(id);
	}

}
