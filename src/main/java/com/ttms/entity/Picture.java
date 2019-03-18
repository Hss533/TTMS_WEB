package com.ttms.entity;

/**
 * 电影相关图集类
 * @author Administrator
 *
 */
public class Picture 
{
	private Integer id;		// 编号
	private String url;		// url地址
	
	private Film film;		// 相关电影
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}

}
