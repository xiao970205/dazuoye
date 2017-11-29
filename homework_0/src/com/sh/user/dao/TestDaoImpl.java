package com.sh.user.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.sh.entity.UserInfo;
import com.sh.entity.UserLogin;

@Repository
public class TestDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	public void saveUser() {
		UserLogin ul=new UserLogin();
		ul.setLoginName("zs");
		ul.setPassword("123");
		
		UserInfo ui=new UserInfo();
		ui.setRealName("王八犊子");
		ul.setUserInfo(ui);
		ui.setUserLogin(ul);
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(ul);
		t.commit();
		s.close();
	}
}
