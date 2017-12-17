package com.sh.entity;

import java.util.List;

public class ShowOrders {

	private int id;
	private int UserId;
	private String SubmitTime;
	private String Ordernow;
	private String Address;
	private List<book_cart_type> books;
	public String getSubmitTime() {
		return SubmitTime;
	}
	public void setSubmitTime(String submitTime) {
		SubmitTime = submitTime;
	}
	public String getOrdernow() {
		return Ordernow;
	}
	public void setOrdernow(String ordernow) {
		Ordernow = ordernow;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public List<book_cart_type> getBooks() {
		return books;
	}
	public void setBooks(List<book_cart_type> books) {
		this.books = books;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	
}
