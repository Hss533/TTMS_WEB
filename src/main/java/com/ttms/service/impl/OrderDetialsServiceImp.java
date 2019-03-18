package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.OrderDetialsDao;
import com.ttms.entity.OrderDetials;
import com.ttms.service.OrderDetialsService;

@Service("orderDetialsService")
public class OrderDetialsServiceImp implements OrderDetialsService{

	@Resource
	private OrderDetialsDao orderDetialsDao;
	
	public int add(OrderDetials orderDetials) {
		
		return orderDetialsDao.add(orderDetials);
	}
	public int updateadd(OrderDetials orderDetials) {
		
		return orderDetialsDao.updateadd(orderDetials);
	}

	public int updatedel(OrderDetials orderDetials) {
		
		return orderDetialsDao.updatedel(orderDetials);
	}
	public List<OrderDetials> find(Integer orderId) {
		
		return orderDetialsDao.find(orderId);
	}
	public List<OrderDetials> findByUuid(String uuid) {
		
		return orderDetialsDao.findByUuid(uuid);
	}
	public List<OrderDetials> findAll(Map map) {
		
		return orderDetialsDao.findAll(map);
	}

}
