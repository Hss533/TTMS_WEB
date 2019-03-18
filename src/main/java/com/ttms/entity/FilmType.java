package com.ttms.entity;

import java.util.List;

/**
 * 电影类型
 * @author Administrator
 *
 */
public class FilmType 
{
	private Integer id;			// 编号
	private String typeName;	// 类型名称
	
	private List<Film> films;	// 对应电影
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<Film> getFilms() {
		return films;
	}
	public void setFilms(List<Film> films) {
		this.films = films;
	}

}
