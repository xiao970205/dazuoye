package com.sh.user.dao;

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
public class bookDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	private int AllRowCount0;
	
	public List<book> findBookByPrice(int offset,int length,String max,String min) {
		System.out.println("进入dao层");
		String hql="from book a where a.book_price >"+min+" and a.book_price <"+max;
		Query query=(Query)sessionFactory.getCurrentSession().createQuery(hql);
		int count=query.list().size();
		System.out.println(count);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		for(int i=0;i<query.list().size();i++) {
			System.out.println(query.list().get(i));
		}
		this.setAllRowCount0(count);
		return query.list();
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
	
	public List<book> queryForPageAuthor(int offset,int length,String author){
		Query query=(Query)sessionFactory.getCurrentSession().createQuery("from book where book_author='"+author+"'");
		int count=query.list().size();
		query.setFirstResult(offset);
		query.setMaxResults(length);
		for(int i=0;i<query.list().size();i++) {
			System.out.println(query.list().get(i));
		}
		this.setAllRowCount0(count);
		return query.list();
	}
	public List<book> queryForPageValue(int offset,int length,String value){
		Query query=(Query)sessionFactory.getCurrentSession().createQuery("from book where book_value='"+value+"'");
		int count=query.list().size();
		query.setFirstResult(offset);
		query.setMaxResults(length);
		for(int i=0;i<query.list().size();i++) {
			System.out.println(query.list().get(i));
		}
		this.setAllRowCount0(count);
		return query.list();
	}
	
	public List<book> queryForPage(int offset,int length){
		Query query=(Query)sessionFactory.getCurrentSession().createQuery("from book");
		int count=query.list().size();
		query.setFirstResult(offset);
		query.setMaxResults(length);
		this.setAllRowCount0(query.list().size());
		
		this.setAllRowCount0(count);
		return query.list();
	}
	
	public List<book> showPagingHot(int offset,int length){
		Query query=(Query)sessionFactory.getCurrentSession().createQuery("from book e where e.book_id>0 and e.book_id<11");
		int count=query.list().size();
		query.setFirstResult(offset);
		query.setMaxResults(length);
		this.setAllRowCount0(query.list().size());
		
		this.setAllRowCount0(count);
		return query.list();
	}
	
	public List<book> showPagingNew(int offset,int length){
		Query query=(Query)sessionFactory.getCurrentSession().createQuery("from book order by book_id asc");
		int count=query.list().size();
		query.setFirstResult(offset);
		query.setMaxResults(length);
		this.setAllRowCount0(query.list().size());
		
		this.setAllRowCount0(count);
		return query.list();
	}
	
	public int getAllRowCount() {
		int count=((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from book").iterate().next()).intValue();
		return count;
	}
	
	public List<book> query_book_name(int offset,int length,String name){
		String hql="from book as a where a.book_name like '%"+name+"%'";
		Query query=(Query)sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	
	public int get_paging_count(String name) {
		String hql="select count(*) from book as a where a.book_name like '%"+
				name+"%'";
		int count=((Long) sessionFactory.getCurrentSession().createQuery(hql
				).iterate().next()).intValue();
		return count;
	}
	
	public List<book> query_book_price(int offset,int length,String max,String min){
		String hql="from book a where a.book_price >"+min+" and a.book_price <"+max;
		Query query=(Query)sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	
	public int get_paging_price_count(String max,String min) {
		String hql="select count(*) from book a where a.book_price >"+min+" and a.book_price <"+max;
		int count=((Long) sessionFactory.getCurrentSession().createQuery(hql
				).iterate().next()).intValue();
		return count;
	}
	
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
	
	public int getAllRowCount0() {
		return this.AllRowCount0;
	}
	public void setAllRowCount0(int i) {
		this.AllRowCount0=i;
	}
	
	public book findByName(String name) {
		String sql="select * from books where book_id="+name+";";
		List<book> book4=sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(book.class).list();
		book book=book4.get(0);
		return book;
	}
}
