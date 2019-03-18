package com.ttms.entity;

import java.util.Date;

/**
 * 用户
 * @author hu
 *
 */
public class User 
{
	private Integer id;				// id
	private String account;			// 用户名
	private String password;		// 密码
	private String nickname;		// 昵称
	private String telephone;		// 电话号码
	private String sex;				// 性别
	private Date  birthday;         // 日期
	private String signature;		// 个性签名
	private String work;			// 工作
	private String lifeStatus;		// 生活状态
	private String interest;		// 兴趣
	private String userImage;		// 用户头像
	
	private Power  power;			// 权限
	
	public User()
	{
		super();
	}

	public User(String account,String password)
	{
		super();
		this.account = account;
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Power getPower() {
		return power;
	}

	public void setPower(Power power) {
		this.power = power;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getLifeStatus() {
		return lifeStatus;
	}

	public void setLifeStatus(String lifeStatus) {
		this.lifeStatus = lifeStatus;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

}
