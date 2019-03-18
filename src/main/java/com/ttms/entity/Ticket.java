package com.ttms.entity;

/**
 * 票的实体
 * @author hu
 *
 */

public class Ticket {

	private Integer id;
	private String uuid;//与订单进行对应
	private Perform perform;//演出
	private Seat seat;//座位
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public Perform getPerform() {
		return perform;
	}
	public void setPerform(Perform perform) {
		this.perform = perform;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	
}
