package com.sh.user.conntroller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.user.service.bookServiceImpl;

@Controller
@RequestMapping("/book")
public class bookController {

	@Resource
	private bookServiceImpl service;
	
	@RequestMapping("show_all")
	public String show_all() {
		this.service.show_all();
		return "index";
	}
	
	@RequestMapping("show_select_name")
	public String show_by_name(@RequestParam("name") String name) {
		System.out.println(name);
		this.service.show_select_name(name);
		return "index";
	}
	
	@RequestMapping("show_select_author")
	public String show_by_author(@RequestParam("author") String author) {
		System.out.println("1");
		System.out.println(author);
		this.service.show_select_author(author);
		return "index";
	}
	
	@RequestMapping("show_select_value")
	public String show_by_value(@RequestParam("value") String value) {
		this.service.show_select_value(value);
		return "index";
	}
	
	@RequestMapping("show_select_press")
	public String show_by_press(@RequestParam("author") String press) {
		this.service.show_select_press(press);
		return "index";
	}
	
	@RequestMapping("show_select_price")
	public String show_by_price(@RequestParam("min") String min,
			@RequestParam("max") String max) {
		this.service.show_select_price(max,min);
		return "index";
	}
	
	@RequestMapping("show_select0")
	public String show2(@RequestParam("select") String select) {
		//以上循环
		String[] condition0=select.split(" ");
		ArrayList<String> condition=new ArrayList<String>();
		for(int i=0;i<condition0.length;i++) {
			if(condition0[i].equals(" ")) {}
			else {
				condition.add(condition0[i]);
			}
		}
		this.service.show_select_n(condition);
		return "index";
	}
}
