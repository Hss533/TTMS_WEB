package com.ttms.entity;

import java.util.Date;
import java.util.List;

/**
 * 订单详情 实例
 * @author hu
 *
 */
public class OrderDetials {

	private Integer id;
	private Integer orderId;
	private String uuid;
	private int state;//1 是未支付   2是已支付  3是已经取消
	private Date orderDateTime;
	private Order order;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	private List<Ticket> tickets;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	public Date getOrderDateTime() {
		return orderDateTime;
	}
	public void setOrderDateTime(Date orderDateTime) {
		this.orderDateTime = orderDateTime;
	}
	public List<Ticket> getTickets() {
		return tickets;
	}
	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}
}
