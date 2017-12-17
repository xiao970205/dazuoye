package com.sh.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.entity.Order0;
import com.sh.entity.ShowOrders;
import com.sh.entity.orderss;
import com.sh.user.dao.OrderDaoImpl;

@Service
@Transactional(readOnly=false)
public class OrderServiceImpl {
	@Resource
	private OrderDaoImpl dao;

	public List<ShowOrders> showUserAllOrder(int UserId) {
		System.out.println("进入OrderService(获取全部Order):");
		List<Order0> Order0=dao.getUserAllOrder(UserId);
		System.out.println("进入OrderService(获取到全部Order):");
		List<ShowOrders> order=new ArrayList<ShowOrders>();
		System.out.println("进入OrderService（开始添加书）:");
		for(int i=0;i<Order0.size();i++) {
			ShowOrders ShowOrders=new ShowOrders();
			ShowOrders.setId(Order0.get(i).getId());
			ShowOrders.setAddress(Order0.get(i).getAddress());
			ShowOrders.setOrdernow(Order0.get(i).getOrdernow());
			ShowOrders.setSubmitTime(Order0.get(i).getSubmittime());
			ShowOrders.setUserId(Order0.get(i).getUserid());
			ShowOrders.setBooks(dao.getUserOrderAllBook(Order0.get(i).getId()));
			order.add(ShowOrders);
		}
		System.out.println("进入OrderService（书添加完毕）:");
		System.out.println("OrderService over:");
		return order;
	}
	
	public void addOrderss(String BookId,String Ordersid) {
		this.dao.addOrders(BookId, Ordersid);
	}
	
	public void jianOrderss(String BookId,String Ordersid) {
		this.dao.jianOrders(BookId, Ordersid);
	}
	
	public void deleteOrderss(String BookId,String Ordersid) {
		this.dao.deleteOrders(BookId, Ordersid);
	}
	
	public void saveAll(List<orderss> orders,Order0 order) {
		this.dao.saveAll(orders, order);
	}
	
	public void deleteNullOrder() {
		this.dao.deleteNullOrder();
	}
	
	public void deleteOrder(int OrderId) {
		this.dao.deleteOrder(OrderId);
	}
}
