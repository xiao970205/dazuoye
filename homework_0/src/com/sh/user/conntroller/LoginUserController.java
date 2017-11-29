package com.sh.user.conntroller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.entity.UserInfo;
import com.sh.user.service.LoginUserServiceImpl;

@Controller
@RequestMapping("/loginuser")
public class LoginUserController {
	
	@Resource
	private LoginUserServiceImpl LoginUserServiceImpl;
	
	@RequestMapping("/login2")
	public String login2(@RequestParam("loginName") String loginName,
			@RequestParam("password") String password,
			Model model,HttpSession session) {
		UserInfo lu=this.LoginUserServiceImpl.login2(loginName,password);
		if(lu!=null) {
			session.setAttribute("lu", lu);
			return "main";
		}else {
			model.addAttribute("errorinfo", "您的账号密码不正确！");
			return "index";
		}
	}
	
	@RequestMapping("/regist")
	public String regist(@RequestParam("realName") String realName,
			@RequestParam("password") String password,@RequestParam("loginName") String loginName) {
		this.LoginUserServiceImpl.regist(loginName,password,realName);
		
		return "";
	}
	
	@RequestMapping("/show_all")
	public void show_all() {
		this.LoginUserServiceImpl.show_all();
	}
}