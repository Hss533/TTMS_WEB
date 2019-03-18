package com.ttms.entity;

import java.util.Date;
import java.util.List;

/**
 * 资讯类
 * @author Administrator
 *
 */
public class Information 
{
	private Integer id;			// 编号
	private String title;		// 标题
	private String source;		// 来源
	private Date uploadTime;	// 上传日期
	private Integer clickHit;	// 点击次数
	private String content;		// 内容
	private int praiseHit;		// 点赞数
	private String cover;		// 封面

	private Film film;			// 关联电影
	
	// 和实体类无关
	public Integer pictureNum;		// 图集数量
	public List<Picture> pictures;	// 具体图集
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public Integer getClickHit() {
		return clickHit;
	}
	public void setClickHit(Integer clickHit) {
		this.clickHit = clickHit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPraiseHit() {
		return praiseHit;
	}
	public void setPraiseHit(int praiseHit) {
		this.praiseHit = praiseHit;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getPictureNum() {
		return pictureNum;
	}
	public void setPictureNum(Integer pictureNum) {
		this.pictureNum = pictureNum;
	}
	public List<Picture> getPictures() {
		return pictures;
	}
	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

}
