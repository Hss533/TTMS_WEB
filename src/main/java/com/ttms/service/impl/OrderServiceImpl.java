package com.ttms.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ttms.dao.OrderDao;
import com.ttms.entity.Order;
import com.ttms.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService
{

	@Resource
	private OrderDao  orderDao;
	
	public List<Order> getAllOrder(Map map) {
		
		return orderDao.getAllOrder(map);
	}

	public Long count(Map map) {
		
		return orderDao.count(map);
	}

	public Order getOrderByUser(Integer userId) {
		
		return orderDao.getOrderByUser(userId);
	}

	public int addOrder(Order order) {
		
		return orderDao.addOrder(order);
	}

	public Integer updateOrder(Order order) {
		
		return orderDao.updateOrder(order);
	}

	public Order getOrderByOrderId(Integer orderId) {
		// TODO Auto-generated method stub
		return orderDao.getOrderByOrderId(orderId);
	}

}
