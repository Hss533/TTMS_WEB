package com.ttms.entity;

public class Order {

	private Integer id;
	private Integer number;//订单数量
	private  float amount;//消费总额
	private  User user;
	private OrderDetials orderDetials;
	
	
	public OrderDetials getOrderDetials() {
		return orderDetials;
	}
	public void setOrderDetials(OrderDetials orderDetials) {
		this.orderDetials = orderDetials;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
