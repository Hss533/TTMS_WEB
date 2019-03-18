package com.ttms.entity;

/**
 * 用户权限
 * @author hu
 *
 */
public class Power 
{
	private Integer id;				// 编号
	private String name;			// 名称
	private String powerDescribe;	// 权限描述
	private Integer floor;			// 优惠下限值
	private float discount;			// 具体折扣
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getpowerDescribe() {
		return powerDescribe;
	}
	public void setpowerDescribe(String powerDescribe) {
		this.powerDescribe = powerDescribe;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}

}
