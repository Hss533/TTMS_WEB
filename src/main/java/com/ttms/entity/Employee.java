package com.ttms.entity;

import java.util.List;

/**
 * 雇员类
 * @author Administrator
 *
 */
public class Employee 
{
	private Integer id;		// 雇员id
	private String name;	// 姓名
	
	private List<Film> films;	//对应电影
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<Film> getFilms() {
		return films;
	}
	public void setFilms(List<Film> films) {
		this.films = films;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
