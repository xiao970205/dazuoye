package com.sh.admin.dao;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.sh.entity.Order0;
import com.sh.entity.ShowOrders;
import com.sh.entity.book_cart_type;
import com.sh.entity.orderss;

@Repository
public class AdminOrderDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	public List<ShowOrders> selectOrder(String Con,String Con2){
		List<ShowOrders> orders=new ArrayList<ShowOrders>();
		List<Order0> order0=null;
		String SQL="select * from order0 where "+Con+"=";
		if(Con.equals("id")||Con.equals("userid")) {
			SQL=SQL+Con2;
		}else {
			SQL=SQL+"'"+Con2+"'";
		}
		order0=(List<Order0>) sessionFactory.getCurrentSession()
				.createSQLQuery(SQL).addEntity(Order0.class).list();
		for(int i=0;i<order0.size();i++) {
			ShowOrders orders00=new ShowOrders();
			orders00.setAddress(order0.get(i).getAddress());
			orders00.setId(order0.get(i).getId());
			orders00.setOrdernow(order0.get(i).getOrdernow());
			orders00.setSubmitTime(order0.get(i).getSubmittime());
			orders00.setUserId(order0.get(i).getUserid());
			List<orderss> orderss=(List<orderss>) sessionFactory.getCurrentSession()
					.createSQLQuery("select * from orderss where orderid=" + order0.get(i).getId() + "")
					.addEntity(orderss.class).list();
			List<book_cart_type> books=new ArrayList<book_cart_type>();
			for(int j=0;j<orderss.size();j++) {
				book_cart_type book=new book_cart_type();
				book.setId(orderss.get(i).getBook_id());
				book.setBook_name(orderss.get(i).getBook_name());
				book.setBook_num(orderss.get(i).getBooknub());
				book.setBook_price(orderss.get(i).getPrice());
				book.setBook_img_min(orderss.get(i).getBook_min_image());
				books.add(book);
			}
			orders00.setBooks(books);
			orders.add(orders00);
		}
		return orders;
	}
}
