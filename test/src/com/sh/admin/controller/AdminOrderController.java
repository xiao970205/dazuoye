package com.sh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.admin.service.AdminOrderServiceImpl;
import com.sh.entity.ShowOrders;

@Controller
@RequestMapping("/Admin/Order")
public class AdminOrderController {
	@Resource
	private AdminOrderServiceImpl service;

	@RequestMapping("select")
	public void test2(HttpServletRequest request, HttpServletResponse response) {
		String Con = request.getParameter("Con");
		String Con2 = request.getParameter("Con2");
		List<ShowOrders> list = this.service.selectOrder(Con, Con2);
		if (request.getSession().getAttribute("admin") != null) {
			request.getSession().setAttribute("AdminOrders", list);
			String address = request.getContextPath() + "/admin/showOrder.jsp";
			try {
				response.sendRedirect(address);
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else {
			request.getSession().setAttribute("AdminOrders", list);
			String address = request.getContextPath() + "/admin/showOrder.jsp";
			try {
				response.sendRedirect(address);
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
