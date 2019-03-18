package com.ttms.entity;

import java.util.List;

/**
 * 演出厅实体
 * @author hu
 *
 */
public class Studio 
{
	private Integer id;			//id
	private String  name;		//演出厅姓名
	private int length;			//演出厅长度
	private int width;			//演出厅宽度
	
	
	
	
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
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}

}
