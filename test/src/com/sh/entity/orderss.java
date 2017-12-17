package com.sh.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="ORDERSS")
public class orderss {

	
	private Integer id;
	private int price;
	private int booknub;
	private int book_id;
	private String book_min_image;
	private String book_name;
	private Order0 order0;

	 @Id
	 @GeneratedValue(generator="my_gen")
	 @GenericGenerator(name = "my_gen", strategy = "increment")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBooknub() {
		return booknub;
	}
	public void setBooknub(int booknub) {
		this.booknub = booknub;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_min_image() {
		return book_min_image;
	}
	public void setBook_min_image(String book_min_image) {
		this.book_min_image = book_min_image;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	@ManyToOne
    @JoinColumn(name="ORDERID")
	public Order0 getOrder0() {
		return order0;
	}
	public void setOrder0(Order0 order0) {
		this.order0 = order0;
	}
}
