package com.sh.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.user.dao.TestDaoImpl;

@Service
@Transactional(readOnly=false)
public class TestServiceImpl {

	@Resource
	private TestDaoImpl testDaoImpl;
	
	public void regist() {
		this.testDaoImpl.saveUser();
	}
}
