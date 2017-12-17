package com.sh.admin.dao;

import java.util.ArrayList;
import java.util.Collections;
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
public class AdminBookDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	private int AllRowCount0;
	
	public List<book> query_book_0(int offset,int length,String name){
		String[] arr0=name.split(" ");
		ArrayList<String> arr=new ArrayList<String>();
		for(int i=0;i<arr0.length;i++) {
			if(arr0[i].equals(" ")) {}
			else {
				arr.add(arr0[i]);
			}
		}
		//处理条件
		
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
		List<book> bookn=new ArrayList<book>();
		for(Iterator<book> iterator=books.iterator();iterator.hasNext();) {
			bookn.add(iterator.next());
		}
		List<Integer> nums=new ArrayList<Integer>();
		for(int i=0;i<bookn.size();i++) {
			nums.add(bookn.get(i).getBook_id());
		}
		Collections.sort(nums);
		
		List<book> book0=new ArrayList<book>();
		for(int i=0;i<nums.size();i++) {
			for(int j=0;j<bookn.size();j++) {
				if(bookn.get(j).getBook_id().equals(nums.get(i))) {
					book0.add(bookn.get(j));
				}
			}
		}
		List<book> book02=new ArrayList<book>();
		for(int i=offset;i<offset+length;i++) {
			if(i<book0.size()) {
			book02.add(book0.get(i));
			}
		}
		this.setAllRowCount0(book0.size());
		return book02;
	}
	
	public List<book> adminShowAllBook(int offset,int length) {
		System.out.println("进入dao层");
		String hql="from book";
		Query query=(Query)sessionFactory.getCurrentSession().createQuery(hql);
		int count=query.list().size();
		System.out.println(count);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		for(int i=0;i<query.list().size();i++) {
			System.out.println(query.list().get(i));
		}
		this.setAllRowCount0(count);
		List<book> list=(List <book>)sessionFactory.getCurrentSession().createSQLQuery("select * from books").addEntity(book.class).list();
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getBook_pages_number());
		}
		return query.list();
	}
	public int getAllRowCount0() {
		return this.AllRowCount0;
	}
	public void setAllRowCount0(int i) {
		this.AllRowCount0=i;
	}
	
	public void adminAddBook(book book) {
		this.sessionFactory.getCurrentSession().save(book);
	}
	
	public void adminDeleteBookById(String id) {
		List<book> list=(List<book>)sessionFactory.getCurrentSession().createSQLQuery("select * from books where book_id="+id+"").addEntity(book.class).list();
		book book=list.get(0);
		this.sessionFactory.getCurrentSession().delete(book);
	}
	
	public void adminUpdateBookById(book book) {
		this.sessionFactory.getCurrentSession().update(book);;
	}
	
	public book adminFindBookById(String id) {
		book Book=this.sessionFactory.getCurrentSession().get(book.class, new Integer(id));
		return Book;
	}
}
