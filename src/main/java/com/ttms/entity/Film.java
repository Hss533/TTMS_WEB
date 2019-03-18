package com.ttms.entity;

import java.util.Date;
import java.util.List;

/**
 * 电影类
 * @author Administrator
 *
 */
public class Film 
{
	private Integer id;				// 编号
	private String name;			// 电影名称
	private String englishName;		// 英文名称
	private String cover;			// 封面图片
	private Integer duration;		// 电影时长(单位：分钟)
	private Integer box;			// 票房
	private Float score;			// 豆瓣得分
	private String resume;			// 电影描述
	private int isHot;				// 是否热门
	private int clickHit;			// 点击次数
	private Date publishDate;		// 上映日期
	
	private Employee employee;			// 导演
	private List<FilmType> filmTypes;	// 电影类型
	private List<Employee> employees;	// 雇员(演员)
	private List<Picture> pictures;		// 图集
	
	// 项目开发中，不需要对应数据库的字段
	private List<Perform> performs;
	
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
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Integer getBox() {
		return box;
	}
	public void setBox(Integer box) {
		this.box = box;
	}
	public Float getScore() {
		return score;
	}
	public void setScore(Float score) {
		this.score = score;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public int getIsHot() {
		return isHot;
	}
	public void setIsHot(int isHot) {
		this.isHot = isHot;
	}
	public int getClickHit() {
		return clickHit;
	}
	public void setClickHit(int clickHit) {
		this.clickHit = clickHit;
	}
	public List<FilmType> getFilmTypes() {
		return filmTypes;
	}
	public void setFilmTypes(List<FilmType> filmTypes) {
		this.filmTypes = filmTypes;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	public List<Picture> getPictures() {
		return pictures;
	}
	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public List<Perform> getPerforms() {
		return performs;
	}
	public void setPerforms(List<Perform> performs) {
		this.performs = performs;
	}

}
