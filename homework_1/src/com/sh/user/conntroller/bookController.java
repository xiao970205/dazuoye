package com.sh.user.conntroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.entity.book;
import com.sh.entity.book_cart_type;
import com.sh.user.service.bookServiceImpl;
import com.sh.util.bookPage;

@Controller
@RequestMapping("/book")
public class bookController {

	@Resource
	private bookServiceImpl service;

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
	
	@RequestMapping("show_paging")
	public String find_all_paging(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
        if (pageNo == null) {
            pageNo = "1";
        }
        bookPage page = service.queryForPage(Integer.valueOf(pageNo), 5);
        request.setAttribute("MethodName", "show_paging");
        request.setAttribute("page", page);
        List<book> list = page.getList();
        modelMap.put("list", list);
    return "user/allBook";
	}
	
	@RequestMapping("show_name_paging")
	public String find_name_paging(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String pageNo=request.getParameter("pageNo");
		String name=request.getParameter("name");
		if(pageNo==null) {
			pageNo="1";
		}
		if(name==null) {
			name=request.getAttribute("MethodValue").toString();
		}
		bookPage page=service.queryForPage(Integer.valueOf(pageNo), 2, name);
		request.setAttribute("MethodValue", name);
		request.setAttribute("page", page);
		request.setAttribute("MethodName", "show_name_paging");
		List<book> list=page.getList();
		modelMap.put("list", list);
		return "index";
	}
	
	@RequestMapping("show_price_paging")
	public String find_price_paging(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String max=request.getParameter("max");
		String min=request.getParameter("min");
		if(max==null&&min==null) {
			String[] name=request.getParameter("name").split(" ");
			max=name[1];
			min=name[0];
		}
        if (pageNo == null) {
            pageNo = "1";
        }
        bookPage page = service.queryForPage(Integer.valueOf(pageNo), 2, max, min);
        request.setAttribute("MethodName", "show_price_paging");
        request.setAttribute("MethodValue", min+" "+max);
        request.setAttribute("page", page);
        List<book> list = page.getList();
        modelMap.put("list", list);
    return "index";
	}
	
	@RequestMapping("show_paging_0")
	public String show_paging_0(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String pageNo=request.getParameter("pageNo");
		String name=request.getParameter("name");
		if(pageNo==null) {
			pageNo="1";
		}
		if(name==null) {
			name=request.getAttribute("MethodValue").toString();
		}
		bookPage page=service.queryForPage0(Integer.valueOf(pageNo), 2, name);
		request.setAttribute("MethodValue", name);
		request.setAttribute("page", page);
		request.setAttribute("MethodName", "show_paging_0");
		List<book> list=page.getList();
		modelMap.put("list", list);
		return "user/allBook";
		
	}
	
	@RequestMapping("show_paging_value")
	public String show_paging_value(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String pageNo=request.getParameter("PageNo");
		String name=request.getParameter("name");
		if(pageNo==null) {
			pageNo="1";
		}
		if(name==null) {
			name=request.getAttribute("MethodValue").toString();
		}
		bookPage page=service.queryForPageValue(Integer.valueOf(pageNo), 2, name);
		request.setAttribute("MethodValue", name);
		request.setAttribute("page", page);
		request.setAttribute("MethodName", "show_paging_value");
		List<book> list=page.getList();
		modelMap.put("list", list);
		return "user/allBook";
	}
	
	@RequestMapping("show_paging_author")
	public String show_paging_author(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String pageNo=request.getParameter("pageNo");
		String name=request.getParameter("name");
		if(pageNo==null) {
			pageNo="1";
		}
		if(name==null) {
			name=request.getAttribute("MethodValue").toString();
		}
		bookPage page=service.queryForPageAuthor(Integer.valueOf(pageNo), 2, name);
		request.setAttribute("MethodValue", name);
		request.setAttribute("page", page);
		request.setAttribute("MethodName", "show_paging_author");
		List<book> list=page.getList();
		modelMap.put("list", list);
		return "user/allBook";
	}
	
	@RequestMapping("book_test_0")
	public void book_test_0(HttpServletRequest request,HttpServletResponse response) {
		String book0=request.getParameter("bookid");
		book book=this.service.queryForPageName(book0);
		try {
			this.tiaozhuan(request, response, book);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void tiaozhuan(HttpServletRequest request,HttpServletResponse response,book book) throws IOException {
		request.getSession().setAttribute("book", book);
		response.sendRedirect("/homework_0/user/book_test_0.jsp");
	}
	
	@RequestMapping("add_cart")
	public String add_cart(HttpServletRequest request,HttpServletResponse response) {
		
		String book0=request.getParameter("bookid");
		
		book book1=this.service.queryForPageName(book0);
		
		book_cart_type book=new book_cart_type();
		book.setBook_num(1);
		book.setBook_name(book1.getBook_name());
		book.setBook_price(book1.getBook_price());
		book.setId(book1.getBook_id());
		
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
		return "user/shoppingCart";
	}
		
}
