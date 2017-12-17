package com.sh.user.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.sh.entity.Order0;
import com.sh.entity.book_cart_type;
import com.sh.entity.orderss;

@Repository
public class OrderDaoImpl {

	@Resource
	private SessionFactory sessionFactory;

	public List<Order0> getUserAllOrder(int UserId0) {
		System.out.println("进入OrderDao getUserAllOrder:");
		List<Order0> OrderList=null;
		if(UserId0==0) {
			OrderList = (List<Order0>) sessionFactory.getCurrentSession()
					.createSQLQuery("select * from order0").addEntity(Order0.class).list();
		}else {
		String UserId = "" + UserId0;
		OrderList = (List<Order0>) sessionFactory.getCurrentSession()
				.createSQLQuery("select * from order0 where userid=" + UserId + "").addEntity(Order0.class).list();
		}
		for (int i = 0; i < OrderList.size(); i++) {
			System.out.println(OrderList.get(i).getId());
			System.out.println(OrderList.get(i).getSubmittime());
			System.out.println(OrderList.get(i).getAddress());
			System.out.println("\n");
		}
		System.out.println("OrderDao getUserAllOrder over");
		return OrderList;
	}

	public List<book_cart_type> getUserOrderAllBook(int OrderId0) {
		System.out.println("进入OrderDao getUserOrderAllBook:");
		String OrderId = "" + OrderId0;
		List<orderss> Books0 = (List<orderss>) sessionFactory.getCurrentSession()
				.createSQLQuery("select * from orderss where orderid=" + OrderId + "").addEntity(orderss.class).list();
		List<book_cart_type> Books = new ArrayList<book_cart_type>();
		for (int i = 0; i < Books0.size(); i++) {
			book_cart_type cart = new book_cart_type();
			cart.setBook_name(Books0.get(i).getBook_name());
			cart.setBook_img_min(Books0.get(i).getBook_min_image());
			cart.setId(Books0.get(i).getBook_id());
			cart.setBook_num(Books0.get(i).getBooknub());
			cart.setBook_price(Books0.get(i).getPrice());
			Books.add(cart);
		}
		for (int i = 0; i < Books.size(); i++) {
			System.out.println(Books.get(i).getId());
			System.out.println(Books.get(i).getBook_name());
			System.out.println(Books.get(i).getBook_num());
			System.out.println(Books.get(i).getBook_price());
			System.out.println("\n");
		}
		System.out.println("OrderDao getUserOrderAllBook over");
		return Books;
	}

	public void addOrders(String BookId, String Ordersid) {
		Integer OrdersId = Integer.parseInt(Ordersid);
		System.out.println(Ordersid);
		List<orderss> orders = (List<orderss>) this.sessionFactory.getCurrentSession()
				.createSQLQuery("select * from orderss where orderid=" + OrdersId + " and book_id=" + BookId + "")
				.addEntity(orderss.class).list();

		System.out.println(orders.size());
		orderss orderss = orders.get(0);
		System.out.println("查询的" + orderss.getBook_name());
		int num = orderss.getBooknub() + 1;
		orderss.setBooknub(num);
		this.sessionFactory.getCurrentSession().update(orderss);
	}

	public void jianOrders(String BookId, String Ordersid) {
		Integer OrdersId = Integer.parseInt(Ordersid);
		List<orderss> orders = (List<orderss>) this.sessionFactory.getCurrentSession()
				.createSQLQuery("select * from orderss where orderid=" + OrdersId + " and book_id=" + BookId + "")
				.addEntity(orderss.class).list();
		orderss orderss = orders.get(0);
		int num = orderss.getBooknub();
		if (num == 1) {
			this.sessionFactory.getCurrentSession().delete(orderss);
		} else {
			num--;
			orderss.setBooknub(num);
			this.sessionFactory.getCurrentSession().update(orderss);
		}
	}

	public void deleteNullOrder() {
		List<Order0> orders = (List<Order0>) this.sessionFactory.getCurrentSession()
				.createSQLQuery("select * from order0").addEntity(Order0.class).list();
		for (int i = 0; i < orders.size(); i++) {
			if (orders.get(i).getOrderssSet().size() < 1) {
				this.sessionFactory.getCurrentSession().delete(orders.get(i));
			}
		}
	}

	public void deleteOrders(String BookId, String Ordersid) {
		Integer OrdersId = Integer.parseInt(Ordersid);
		List<orderss> orders = (List<orderss>) this.sessionFactory.getCurrentSession()
				.createSQLQuery("select * from orderss where orderid=" + OrdersId + " and book_id=" + BookId + "")
				.addEntity(orderss.class).list();
		orderss orderss = orders.get(0);
		this.sessionFactory.getCurrentSession().delete(orderss);
	}

	public void saveAll(List<orderss> orders, Order0 order) {

		for (int i = 0; i < orders.size(); i++) {
			orders.get(i).setOrder0(order);
			System.out.println(orders.get(i).getBook_name());
		}
		for (int i = 0; i < orders.size(); i++) {
			order.getOrderssSet().add(orders.get(i));
		}
		this.sessionFactory.getCurrentSession().save(order);
	}

	public void deleteOrder(Integer OrderId) {
		Order0 order=this.sessionFactory.getCurrentSession().get(Order0.class, new Integer(OrderId));
		this.sessionFactory.getCurrentSession().delete(order);
	}
}
