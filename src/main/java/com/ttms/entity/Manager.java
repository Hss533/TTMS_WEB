package com.ttms.entity;

/**
 * 管理员
 * @author Administrator
 *
 */
public class Manager 
{
	private Integer id;			// 主键Id
	private String account;		// 账号
	private String password;	// 密码
	private String name;		// 管理员名称
	
	private Integer power;		// 权限，1代表系统管理员，2代表售票员
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPower() {
		return power;
	}
	public void setPower(Integer power) {
		this.power = power;
	}
	
}
