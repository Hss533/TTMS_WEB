package com.ttms.service;

import java.util.List;
import java.util.Map;

import com.ttms.entity.OrderDetials;

public interface OrderDetialsService {
	
	/**
	 * 查找出一个人所有的订单
	 * @param map
	 * @return
	 */
	public List<OrderDetials> find(Integer orderId);
	
	/**
	 * 添加订单 默认为未支付
	 * @param orderDetials
	 * @return
	 */
	public int add(OrderDetials orderDetials);
	
	/**
	 * 修改订单为已支付
	 * @param orderDetials
	 * @return
	 */
	public int updateadd(OrderDetials orderDetials);
	/**
	 * 将订单设为取消
	 * @param orderDetials
	 * @return
	 */
	public int updatedel(OrderDetials orderDetials);
	
	/**
	 * 根据uuid查找出订单
	 * @param uuid
	 * @return
	 */
	public List<OrderDetials> findByUuid(String uuid);
	
	/**
	 * 查找所有的订单
	 * @param amp
	 * @return
	 */
	public List<OrderDetials> findAll(Map amp);
}
