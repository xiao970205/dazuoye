package com.sh.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.entity.LoginUser;
import com.sh.entity.UserInfo;
import com.sh.entity.UserLogin;
import com.sh.user.dao.LoginUserDaoImpl;

@Service
@Transactional(readOnly=true)
public class LoginUserServiceImpl {
	
	@Resource
	private LoginUserDaoImpl loginUserDaoImpl;
	public LoginUser login(String name,String pwd) {
		
		LoginUser lu=this.loginUserDaoImpl.findById(name);
		if(lu!=null) {
			if(lu.getPassword().equals(pwd)) {
				return lu;
			}else {
				return null;
			}
		}else {
			return null;
		}
	}
	
	public UserInfo login2(String name,String pwd) {
		UserLogin lu=this.loginUserDaoImpl.findById2(name);
		if(lu!=null) {
			if(lu.getPassword().equals(pwd)) {
				return login3(name);
			}else {
				return null;
			}
		}else {
			return null;
		}
	}
	
	public UserInfo login3(String name) {
		UserInfo lu=this.loginUserDaoImpl.findById3(name);
		return lu;
	}
	
	public void regist(String loginName,String password,String realName) {
		this.loginUserDaoImpl.saveUser(loginName,password,realName);
	}
	public void show_all() {
		this.loginUserDaoImpl.show_all();
	}
}