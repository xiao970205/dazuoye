package com.sh.user.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.sh.entity.book;

@Repository
public class bookDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	public void show_all() {
		Query query = sessionFactory.getCurrentSession().createQuery("from book");
		for(int i=0;i<query.list().size();i++) {
			System.out.println(query.list().get(1));
		}
//		List<book> books=sessionFactory.getCurrentSession().createSQLQuery("select * from books").addEntity(book.class).list();
//		for(int i=0;i<books.size();i++) {
//			System.out.println(books.get(i).getBook_name());
//		}
	}
	
	public void show_select(String name) {
		String sql="select * from books where book_author='"+name+"';";
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public void show_select_name(String name) {
		String sql="select * from books where book_name='"+name+"';";
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public void show_select_author(String author) {
		String sql="select * from books where book_author='"+author+"';";
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public void show_select_value(String value) {
		String sql="select * from books where book_value='"+value+"';";
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public void show_select_press(String press) {
		String sql="select * from books where book_press='"+press+"';";
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public void show_select_price(String mx,String mn) {
		int max=Integer.parseInt(mx);
		int min=Integer.parseInt(mn);
		String sql="select * from books where book_price>="+mn+" and book_price<="+mx+";";
		List<book> books=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		System.out.println("长度"+books.size());
		for(int i=0;i<books.size();i++) {
			System.out.println(books.get(i).getBook_name());
		}
	}
	
	public void show_select_n(ArrayList<String> arr) {
		Set<book> books=new HashSet<book>();
		for(int i=0;i<arr.size();i++) {
			String sql1="select * from books where book_name like '%"+arr.get(i)+"%'";
			List<book> book1=sessionFactory.getCurrentSession().createSQLQuery(sql1).addEntity(book.class).list();
			String sql2="select * from books where book_author like '%"+arr.get(i)+"%'";
			List<book> book2=sessionFactory.getCurrentSession().createSQLQuery(sql2).addEntity(book.class).list();
			String sql3="select * from books where book_value like '%"+arr.get(i)+"%'";
			List<book> book3=sessionFactory.getCurrentSession().createSQLQuery(sql3).addEntity(book.class).list();
			String sql4="select * from books where book_press like '%"+arr.get(i)+"%'";
			List<book> book4=sessionFactory.getCurrentSession().createSQLQuery(sql4).addEntity(book.class).list();
			books.addAll(book1);
			books.addAll(book2);
			books.addAll(book3);
			books.addAll(book4);
		}
		for(Iterator<book> iterator=books.iterator();iterator.hasNext();) {
			System.out.println(iterator.next().getBook_name());
		}
	}
}
