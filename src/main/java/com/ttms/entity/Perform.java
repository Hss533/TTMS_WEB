package com.ttms.entity;

import java.util.Date;
import java.util.List;

/**
 * 演出计划实体
 * @author hu
 *
 */
public class Perform 
{
	private Integer id;					//编号
	private Studio studio;				//演出厅id
	private float price;				//票价
	private int sold;					//已售张数
	private Date startTime;				//开始时间
	private Date endTime;				//结束时间
	private Film film;					//电影id
	
	private List<Ticket> ticket;               //票
	private List<Seat> seat;               //座位
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	public List<Ticket> getTicket() {
		return ticket;
	}
	public void setTicket(List<Ticket> ticket) {
		this.ticket = ticket;
	}
	public List<Seat> getSeat() {
		return seat;
	}
	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}
	
	
}
