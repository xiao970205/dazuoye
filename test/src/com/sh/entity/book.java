package com.sh.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="books")
public class book {
	
	
	private Integer book_id;
	private String book_name;
	private String book_value;
	private String book_author;
	private String book_press;
	private Integer book_price;
	private String book_introduction;
	private String book_image;
	private String book_packing;
	private String book_ISBN;
	private String book_pages_number;
	private String book_folie;
	private String book_introduction_img;
	private String book_img_min;
	
	@Id
	@GeneratedValue(generator="my_gen")
    @GenericGenerator(name="my_gen", strategy="increment")
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id=book_id;
	}
	public String getBook_packing() {
		return book_packing;
	}
	public void setBook_packing(String book_packing) {
		this.book_packing = book_packing;
	}
	public String getBook_ISBN() {
		return book_ISBN;
	}
	public void setBook_ISBN(String book_ISBN) {
		this.book_ISBN = book_ISBN;
	}
	public String getBook_pages_number() {
		return book_pages_number;
	}
	public void setBook_pages_number(String book_page_number) {
		this.book_pages_number = book_page_number;
	}
	public String getBook_folie() {
		return book_folie;
	}
	public void setBook_folie(String book_folie) {
		this.book_folie = book_folie;
	}
	public String getBook_introduction_img() {
		return book_introduction_img;
	}
	public void setBook_introduction_img(String book_introduction_img) {
		this.book_introduction_img = book_introduction_img;
	}
	public String getBook_img_min() {
		return book_img_min;
	}
	public void setBook_img_min(String book_img_min) {
		this.book_img_min = book_img_min;
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
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
}
