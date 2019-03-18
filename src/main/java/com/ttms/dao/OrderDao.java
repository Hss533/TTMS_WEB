package com.ttms.dao;

import java.util.List;
import java.util.Map;

import com.ttms.entity.Order;

public interface OrderDao {


	/**
	 * 查看所有用户的所有订单
	 * @return
	 */
	public List<Order> getAllOrder(Map map);
	/**
	 * 查看所有的订单总数
	 * @param map
	 * @return
	 */
	public Long count(Map map);
	/**
	 * 根据用户id 查看用户所有的订单
	 * @param userId
	 * @return
	 */
	public Order getOrderByUser(Integer userId);
	/**
	 * 用户添加订单
	 * 第一次进行买票
	 * @param order
	 * @return
	 */
	public int addOrder(Order order);
	
	/**
	 * 用户修改(添加或者删除)订单
	 * @param order
	 * @return
	 */
	public Integer updateOrder(Order order);
	public Order getOrderByOrderId(Integer orderId);
}
