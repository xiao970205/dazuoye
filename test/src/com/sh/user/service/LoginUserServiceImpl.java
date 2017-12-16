package com.sh.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.entity.Admin;
import com.sh.entity.UserInfo;
import com.sh.entity.UserLogin;
import com.sh.user.dao.LoginUserDaoImpl;

@Service
@Transactional(readOnly=false)
public class LoginUserServiceImpl {
	
	@Resource
	private LoginUserDaoImpl loginUserDaoImpl;

	public UserInfo login2(String name,String pwd) {
		UserInfo user=this.loginUserDaoImpl.login(name, pwd);
		if(user==null) {
			return null;
		}
		else {
			return user;
		}
	}
	public void regist(UserInfo userInfo,UserLogin userLogin) {
		this.loginUserDaoImpl.saveUser(userInfo, userLogin);
	}
	public void show_all() {
		this.loginUserDaoImpl.show_all();
	}
	
	public Admin AdminLogin(String userName,String password) {
		return this.loginUserDaoImpl.AdminLogin(userName, password);
	}
}