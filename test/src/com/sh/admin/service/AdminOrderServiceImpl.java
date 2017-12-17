package com.sh.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.admin.dao.AdminOrderDaoImpl;
import com.sh.entity.ShowOrders;

@Service
@Transactional(readOnly=false)
public class AdminOrderServiceImpl {
	
	@Resource
	private AdminOrderDaoImpl dao;
	
	public List<ShowOrders> selectOrder(String Con,String Con2){
		return this.dao.selectOrder(Con, Con2);
	}
}
