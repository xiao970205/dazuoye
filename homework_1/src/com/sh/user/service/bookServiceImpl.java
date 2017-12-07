package com.sh.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.entity.book;
import com.sh.user.dao.bookDaoImpl;
import com.sh.util.bookPage;

@Service
@Transactional(readOnly=true)
public class bookServiceImpl {

	@Resource
	private bookDaoImpl dao;
		
	public void show_select_n(ArrayList<String> i) {
		this.dao.show_select_n(i);
	}
	
	public bookPage queryForPage(int currentPage,int pageSize) {
		bookPage page=new bookPage();
		
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);  
        //分页查询结果集
        List<book> list = dao.queryForPage(offset, pageSize); 
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        int allRow = dao.getAllRowCount0();
        page.setTotalRecords(allRow);
        page.setList(list);
		return page;
	}
	
	public bookPage queryForPage(int currentPage,int pageSize,String name) {
		bookPage page=new bookPage();
		int allRow=dao.get_paging_count(name);
		int offset=page.countOffset(currentPage, pageSize);
		List<book> list=dao.query_book_name(offset, pageSize, name);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	public bookPage queryForPage(int currentPage,int pageSize,String max,String min) {
		bookPage page=new bookPage();
		int allRow=dao.get_paging_price_count(max, min);
		int offset=page.countOffset(currentPage, pageSize);
		List<book> list=dao.query_book_price(offset, pageSize, max, min);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
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
	
	public bookPage queryForPageValue(int currentPage,int pageSize,String value) {
		bookPage page=new bookPage();
		int offset=page.countOffset(currentPage, pageSize);
		List<book> list=dao.queryForPageValue(offset, pageSize, value);
		int allRow=dao.getAllRowCount0();
		page.setPageNo(currentPage);;
		page.setPageSize(pageSize);;
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	public bookPage queryForPageAuthor(int currentPage,int pageSize,String value) {
		bookPage page=new bookPage();
		int offset=page.countOffset(currentPage, pageSize);
		List<book> list=dao.queryForPageAuthor(offset, pageSize, value);
		int allRow=dao.getAllRowCount0();
		page.setPageNo(currentPage);;
		page.setPageSize(pageSize);;
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	public book queryForPageName(String name) {
		book book=dao.findByName(name);
		return book;
	}
}
