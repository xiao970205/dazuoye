package com.sh.user.conntroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.entity.book;
import com.sh.entity.book_cart_type;
import com.sh.user.service.bookServiceImpl;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Resource
	private bookServiceImpl service;
	
	@RequestMapping("add_cart")
	public void add_cart(HttpServletRequest request,HttpServletResponse response) {
		
		String book0=request.getParameter("bookid");
		
		book book1=service.queryForPageName(book0);
		
		book_cart_type book=new book_cart_type();
		book.setBook_num(1);
		book.setBook_name(book1.getBook_name());
		book.setBook_price(book1.getBook_price());
		book.setId(book1.getBook_id());
		book.setBook_img_min(book1.getBook_img_min());
		
		HttpSession session=request.getSession();
		if(session.getAttribute("cart")==null) {
			List<book_cart_type> books=new ArrayList<book_cart_type>();
			books.add(book);
			session.setAttribute("cart", books);
			for(int i=0;i<books.size();i++) {
				System.out.println(books.get(i).getBook_name());
			}
		}else {
			int a=0;
			List<book_cart_type> books=(List<book_cart_type>)session.getAttribute("cart");
			for(int i=0;i<books.size();i++) {
				if(books.get(i).getId().equals(book.getId())) {
					a++;
					int b=books.get(i).getBook_num();
					b++;
					books.get(i).setBook_num(b);
				}
			}

			if(a==0) {
				books.add(book);
			}
			session.setAttribute("cart", books);
		}
		try {
			this.tiaozhuan(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void tiaozhuan(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.sendRedirect(request.getContextPath()+"/user/shoppingCart.jsp");
	}
	
	@RequestMapping("delete_cart")
	public void delete_cart(HttpServletRequest request,HttpServletResponse response) {
		int bookid=Integer.parseInt(request.getParameter("bookid"));
		HttpSession session=request.getSession();
		List<book_cart_type> book_cart=(List<book_cart_type>)session.getAttribute("cart");
		for(int i=0;i<book_cart.size();i++) {
			if(bookid==book_cart.get(i).getId()) {
				book_cart.remove(i);
			}
		}
		session.setAttribute("cart", book_cart);
		
		try {
			this.tiaozhuan(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("jian_cart")
	public void cart_jian(HttpServletRequest request,HttpServletResponse response) {
		int bookid=Integer.parseInt(request.getParameter("bookid"));
		HttpSession session=request.getSession();
		List<book_cart_type> book_cart=(List<book_cart_type>)session.getAttribute("cart");
		for(int i=0;i<book_cart.size();i++) {
			if(bookid==book_cart.get(i).getId()) {
				int num=book_cart.get(i).getBook_num()-1;
				book_cart.get(i).setBook_num(num);
			}
		}
		session.setAttribute("cart", book_cart);
		try {
			this.tiaozhuan(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
