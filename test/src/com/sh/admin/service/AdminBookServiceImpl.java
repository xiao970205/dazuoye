package com.sh.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.admin.dao.AdminBookDaoImpl;
import com.sh.entity.book;
import com.sh.util.bookPage;

@Service
@Transactional(readOnly=false)
public class AdminBookServiceImpl {
	@Resource
	private AdminBookDaoImpl dao;
	
	public bookPage queryForPage0(int currentPage,int pageSize,String name) {
		bookPage page=new bookPage();
		int offset=page.countOffset(currentPage, pageSize);
		List<book> list=dao.query_book_0(offset, pageSize, name);
		int allRow=dao.getAllRowCount0();
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	public bookPage serviceAdminFindAllBook(int currentPage,int pageSize) {
		System.out.println("进入service层");
		bookPage page=new bookPage();
		int offset=page.countOffset(currentPage, pageSize);
		List<book> list=dao.adminShowAllBook(offset, pageSize);
		int allRow=dao.getAllRowCount0();
		page.setPageNo(currentPage);;
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	public void serviceAdminAddBook(book book) {
		this.dao.adminAddBook(book);
	}
	
	public void serviceAdminDeleteBook(String id) {
		this.dao.adminDeleteBookById(id);
	}
	public void serviceAdminUpdateBook(book book) {
		this.dao.adminUpdateBookById(book);
	}
	public book serviceAdminFindBookById(String id) {
		return this.dao.adminFindBookById(id);
	}
}
