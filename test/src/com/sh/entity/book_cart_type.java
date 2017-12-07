package com.sh.entity;

public class book_cart_type {
	
	private Integer id;
	private String book_name;
	private int book_num;
	private int book_price;
	private String book_img_min;
	
	public String getBook_img_min() {
		return book_img_min;
	}
	public void setBook_img_min(String book_img_min) {
		this.book_img_min = book_img_min;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
}
