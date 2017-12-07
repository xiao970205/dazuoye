package com.sh.user.conntroller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sh.user.service.TestServiceImpl;

@Controller
@RequestMapping("/test")
public class TestController {

	@Resource
	private TestServiceImpl testServiceImpl;
	
	@RequestMapping("/regist")
	public String regist() {
		this.testServiceImpl.regist();
		return "";
	}
}
