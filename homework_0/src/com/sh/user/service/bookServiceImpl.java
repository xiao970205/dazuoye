package com.sh.user.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.user.dao.bookDaoImpl;

@Service
@Transactional(readOnly=true)
public class bookServiceImpl {

	@Resource
	private bookDaoImpl dao;
	public void show_all() {
		this.dao.show_all();
	}
	
	public void show_select_name(String name) {
		System.out.println(name);
		this.dao.show_select_name(name);
	}
	
	public void show_select_author(String author) {
		this.dao.show_select_author(author);
	}
	
	public void show_select_value(String value) {
		this.dao.show_select_value(value);
	}
	
	public void show_select_press(String press) {
		this.dao.show_select_press(press);
	}
	
	public void show_select_price(String max,String min) {
		this.dao.show_select_price(max,min);
	}
	
	public void show_select_n(ArrayList<String> i) {
		this.dao.show_select_n(i);
	}
}
