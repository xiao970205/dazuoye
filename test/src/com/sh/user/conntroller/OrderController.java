package com.sh.user.conntroller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.entity.Order0;
import com.sh.entity.ShowOrders;
import com.sh.entity.UserInfo;
import com.sh.entity.book_cart_type;
import com.sh.entity.orderss;
import com.sh.user.service.OrderServiceImpl;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Resource
	private OrderServiceImpl service;

	@RequestMapping("showAllOrder")
	public void showUserAllOrder(HttpServletRequest request, HttpServletResponse response) {
		this.service.deleteNullOrder();
		System.out.println("验证用户用户！");
		System.out.println(request.getSession().getAttribute("admin"));
		int UserId=0;
		if (request.getSession().getAttribute("admin") != null) {
			System.out.println("管理员检查订单");
		} else {
			if (request.getSession().getAttribute("user") == null) {
				System.out.println("没有用户！");
				String address = request.getContextPath() + "/user/index.jsp";
				try {
					response.sendRedirect(address);
					return;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("进入OrderController（获取用户id）:");
			UserId = ((UserInfo) request.getSession().getAttribute("user")).getId();
			System.out.println("进入OrderController（用户id已获取）:");
			System.out.println("userid=" + UserId);
		}
		System.out.println("进入OrderController（开始获得数据库数据）:");
		List<ShowOrders> Orders = service.showUserAllOrder(UserId);
		for (int i = 0; i < Orders.size(); i++) {
			System.out.println("书数：" + Orders.get(i).getBooks().size());
			System.out.println("OrderId:" + Orders.get(i).getId());
			List<book_cart_type> boos = Orders.get(i).getBooks();
			for (int j = 0; j < boos.size(); j++) {
				System.out.println(boos.get(j).getBook_name());
				System.out.println(boos.get(j).getId());
			}
			System.out.println("");
		}
		if (request.getSession().getAttribute("admin") != null) {
			request.getSession().setAttribute("AdminOrders", Orders);
			String address = request.getContextPath() + "/admin/showOrder.jsp";
			try {
				response.sendRedirect(address);
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.getSession().setAttribute("Orders", Orders);
		this.runToOrder(request, response);
	}

	public void runToOrder(HttpServletRequest request, HttpServletResponse response) {
		String address = request.getContextPath() + "/user/order.jsp";
		try {
			response.sendRedirect(address);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("add_order")
	public void addOrder(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("bookid") String BookId, @RequestParam("ordersid") String OrdersId) {
		this.service.addOrderss(BookId, OrdersId);
		this.showUserAllOrder(request, response);
	}

	@RequestMapping("jian_order")
	public void jianOrder(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("bookid") String BookId, @RequestParam("ordersid") String OrdersId) {
		this.service.jianOrderss(BookId, OrdersId);
		this.showUserAllOrder(request, response);
	}

	@RequestMapping("delete_order")
	public void deleteOrder(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("bookid") String BookId, @RequestParam("ordersid") String OrdersId) {
		this.service.deleteOrderss(BookId, OrdersId);
		this.showUserAllOrder(request, response);
	}

	@RequestMapping("save2")
	public void save2(@RequestParam("address") String address, HttpServletRequest request,
			HttpServletResponse response) {
		Order0 order = new Order0();
		order.setAddress(address);
		order.setOrdernow("未支付");
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = formatter.format(currentTime);
		order.setSubmittime(time);

		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		int userid = user.getId();
		order.setUserid(userid);

		List<book_cart_type> book = (List<book_cart_type>) request.getSession().getAttribute("cart");
		List<orderss> orders = new ArrayList<orderss>();
		for (int i = 0; i < book.size(); i++) {
			orderss order2 = new orderss();
			order2.setBook_id(book.get(i).getId());
			order2.setBook_min_image(book.get(i).getBook_img_min());
			order2.setBook_name(book.get(i).getBook_name());
			order2.setBooknub(book.get(i).getBook_num());
			order2.setPrice(book.get(i).getBook_price());
			orders.add(order2);
		}
		this.service.saveAll(orders, order);
		request.getSession().removeAttribute("cart");
		if(request.getSession().getAttribute("cart")!=null) {
			System.out.println("cart存在");
		}
		this.showUserAllOrder(request, response);
	}

	@RequestMapping("deleteOrder")
	public void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
		String orderid = request.getParameter("OrderId");
		int OrderId = Integer.parseInt(orderid);
		this.service.deleteOrder(OrderId);
		this.showUserAllOrder(request, response);
	}
}
