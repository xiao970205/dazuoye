package com.sh.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.sh.entity.Admin;
import com.sh.entity.UserInfo;
import com.sh.entity.UserLogin;
import com.sh.entity.book;

@Repository
public class LoginUserDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	public UserInfo login(String userName,String pasword) {
		List<UserLogin> userlogin=(List<UserLogin>)sessionFactory.getCurrentSession().createSQLQuery("select * from userlogin where loginName='"+userName+"' and password='"+pasword+"'").addEntity(UserLogin.class).list();
		if(userlogin.size()==0) {
			return null;
		}else {
			UserInfo user=(UserInfo)sessionFactory.getCurrentSession().createSQLQuery("select * from userinfo where id='"+userlogin.get(0).getId()+"'").addEntity(UserInfo.class).list().get(0);
			return user;
		}
	}
	
	public void saveUser(UserInfo userInfo,UserLogin userLogin) {
		userLogin.setUserInfo(userInfo);
		userInfo.setUserLogin(userLogin);
		
		Session s=this.sessionFactory.getCurrentSession();
		s.save(userLogin);
	}
	
	public void show_all() {
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery("select * from books").addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public Admin AdminLogin(String userName,String password) {
		List<Admin> admin=(List<Admin>)sessionFactory.getCurrentSession().createSQLQuery("select * from admin where username='"+userName+"' and password='"+password+"'").addEntity(Admin.class).list();
		if(admin.size()==0) {
			return null;
		}
		return admin.get(0);
	}
	
}
