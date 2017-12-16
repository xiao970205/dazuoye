package com.sh.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="userlogin")
public class UserLogin {
	private Integer id;
	private String loginName;
	private String password;
	private UserInfo UserInfo;
	
	@Id
	@GeneratedValue(generator="my_gen")
    @GenericGenerator(name="my_gen", strategy="increment")

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="id")
	public UserInfo getUserInfo() {
		return UserInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.UserInfo = userInfo;
	}
}
