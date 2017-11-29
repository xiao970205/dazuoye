package com.sh.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.sh.entity.LoginUser;
import com.sh.entity.UserInfo;
import com.sh.entity.UserLogin;
import com.sh.entity.book;

@Repository
public class LoginUserDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	public LoginUser findById(String loginName) {
		LoginUser lu=this.sessionFactory.getCurrentSession().get(LoginUser.class, loginName);
		return lu;
	}
	
	public UserLogin findById2(String loginName) {
		UserLogin lu=this.sessionFactory.getCurrentSession().get(UserLogin.class, loginName);
		return lu;
	}
	
	public UserInfo findById3(String loginName) {
		UserInfo lu=this.sessionFactory.getCurrentSession().get(UserInfo.class, loginName);
		return lu;
	}
	
	public void saveUser(String loginName,String password,String realName) {
		UserLogin ul=new UserLogin();
		ul.setLoginName(loginName);
		ul.setPassword(password);
		
		UserInfo ui=new UserInfo();
		ui.setRealName(realName);
		ul.setUserInfo(ui);
		ui.setUserLogin(ul);
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(ul);
		t.commit();
		s.close();
	}
	public void show_all() {
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery("select * from books").addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
}
