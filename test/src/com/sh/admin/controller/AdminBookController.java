package com.sh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.admin.service.AdminBookServiceImpl;
import com.sh.entity.book;
import com.sh.util.bookPage;

@Controller
@RequestMapping("/Admin/Book")
public class AdminBookController {

	@Resource
	private AdminBookServiceImpl service;
	
	@RequestMapping("select")
	public String controllerAdminFindBook(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String name = request.getParameter("name");
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		bookPage page=service.queryForPage0(Integer.valueOf(pageNo), 8,name);
		System.out.println("进入controller层");
		request.setAttribute("MethodName", "AdminFindAllBook");
		request.setAttribute("page", page);
		List<book> list = page.getList();
		modelMap.put("list", list);
		return "admin/showBook";
	}
	
	@RequestMapping("AdminFindAllBook")
	public String controllerAdminFindAllBook(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		System.out.println("进入controller层");
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		bookPage page=service.serviceAdminFindAllBook(Integer.valueOf(pageNo), 8);
		System.out.println("进入controller层");
		request.setAttribute("MethodName", "AdminFindAllBook");
		request.setAttribute("page", page);
		List<book> list = page.getList();
		modelMap.put("list", list);
		return "admin/showBook";
	}
	
	@RequestMapping("AdminAddBook")
	public String controllerAdminAddBook(HttpServletRequest request, HttpServletResponse response) {
		String book_name=request.getParameter("book_name");
		String book_value=request.getParameter("book_value");
		String book_author=request.getParameter("book_author");
		String book_press=request.getParameter("book_press");
		int book_price=Integer.parseInt(request.getParameter("book_price"));
		String book_Introduction=request.getParameter("book_Introduction");
		String book_packing=request.getParameter("book_packing");
		String book_ISBN=request.getParameter("book_ISBN");
		String book_pages_number=request.getParameter("book_page_number");
		String book_folie=request.getParameter("book_folie");
		String book_image=request.getParameter("book_image");
		String book_img_min=request.getParameter("book_img_min");
		String book_introduction_img=request.getParameter("book_introduction_img");
		book book=new book();
		book.setBook_author(book_author);
		book.setBook_folie(book_folie);
		book.setBook_image(book_image);
		book.setBook_img_min(book_img_min);
		book.setBook_introduction(book_Introduction);
		book.setBook_introduction_img(book_introduction_img);
		book.setBook_ISBN(book_ISBN);
		book.setBook_name(book_name);
		book.setBook_packing(book_packing);
		book.setBook_pages_number(book_pages_number);
		book.setBook_press(book_press);
		book.setBook_price(book_price);
		book.setBook_value(book_value);
		this.service.serviceAdminAddBook(book);
		return "admin/addSuccessful";
	}
	
	@RequestMapping("AdminDeleteBook")
	public String controllerAdminDeleteBook(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		this.service.serviceAdminDeleteBook(id);
		return "admin/index";
	}
	
	@RequestMapping("AdminUpdateBook")
	public String controllerAdminUpdateBook(HttpServletRequest request, HttpServletResponse response) {
		int book_id=Integer.parseInt(request.getParameter("book_id"));
		String book_name=request.getParameter("book_name");
		String book_value=request.getParameter("book_value");
		String book_author=request.getParameter("book_author");
		String book_press=request.getParameter("book_press");
		int book_price=Integer.parseInt(request.getParameter("book_price"));
		String book_Introduction=request.getParameter("book_Introduction");
		String book_packing=request.getParameter("book_packing");
		String book_ISBN=request.getParameter("book_ISBN");
		String book_pages_number=request.getParameter("book_page_number");
		String book_folie=request.getParameter("book_folie");
		String book_image=request.getParameter("book_image");
		String book_img_min=request.getParameter("book_img_min");
		String book_introduction_img=request.getParameter("book_introduction_img");
		book book=new book();
		book.setBook_id(book_id);
		book.setBook_author(book_author);
		book.setBook_folie(book_folie);
		book.setBook_image(book_image);
		book.setBook_img_min(book_img_min);
		book.setBook_introduction(book_Introduction);
		book.setBook_introduction_img(book_introduction_img);
		book.setBook_ISBN(book_ISBN);
		book.setBook_name(book_name);
		book.setBook_packing(book_packing);
		book.setBook_pages_number(book_pages_number);
		book.setBook_press(book_press);
		book.setBook_price(book_price);
		book.setBook_value(book_value);
		this.service.serviceAdminUpdateBook(book);
		return "admin/index";
	}
	
	@RequestMapping("AdminUpdateBook0")
	public void controllerAdminUpdateBook0(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {
		String id=request.getParameter("id");
		book Book=this.service.serviceAdminFindBookById(id);
		request.getSession().setAttribute("AdminBook", Book);
		String address=request.getContextPath()+"/admin/updateBookjsp.jsp";
		try {
			response.sendRedirect(address);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
