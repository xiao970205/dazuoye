package com.sh.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="books")
public class book {
	
	@Id
	private Integer book_id;
	private String book_name;
	private String book_value;
	private String book_author;
	private String book_press;
	private Integer book_price;
	private String book_introduction;
	
	public book() {}
	public book(String book_name,
				String book_value,
				String book_author,
				String book_press,
				String book_prive,
				String book_introduction) {
		this.setBook_author(book_author);
		this.setBook_introduction(book_introduction);
		this.setBook_name(book_name);
		this.setBook_press(book_press);
		this.setBook_price(book_price);
		this.setBook_value(book_value);
	}
	
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id=book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_value() {
		return book_value;
	}
	public void setBook_value(String book_value) {
		this.book_value = book_value;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_press() {
		return book_press;
	}
	public void setBook_press(String book_press) {
		this.book_press = book_press;
	}
	public Integer getBook_price() {
		return book_price;
	}
	public void setBook_price(Integer book_price) {
		this.book_price = book_price;
	}
	public String getBook_introduction() {
		return book_introduction;
	}
	public void setBook_introduction(String book_introduction) {
		this.book_introduction = book_introduction;
	}
}
