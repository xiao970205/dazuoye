package com.sh.user.conntroller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.entity.Admin;
import com.sh.entity.UserInfo;
import com.sh.entity.UserLogin;
import com.sh.user.service.LoginUserServiceImpl;

@Controller
@RequestMapping("/loginuser")
public class LoginUserController {
	
	@Resource
	private LoginUserServiceImpl LoginUserServiceImpl;
	
	@RequestMapping("/login")
	public String login(@RequestParam("userName") String loginName,
			@RequestParam("password") String password,
			Model model,HttpSession session) {
		Admin admin=this.LoginUserServiceImpl.AdminLogin(loginName, password);
		if(admin!=null) {
			session.setAttribute("admin", admin);
			return "admin/index";
		}
		UserInfo lu=this.LoginUserServiceImpl.login2(loginName, password);
		if(lu!=null) {
			session.setAttribute("user", lu);
			return "user/index";
		}else {
			model.addAttribute("message", "您的账号密码不正确！");
			return "user/login";
		}
	}
	@RequestMapping("/regist")
	public String regist(HttpServletRequest request, HttpServletResponse response) {
		String UserName=request.getParameter("loginName");
		String password=request.getParameter("password");
		String realName=request.getParameter("realName");
		String Email=request.getParameter("email");
		String Address=request.getParameter("address");
		UserInfo userinfo=new UserInfo();
		userinfo.setAddress(Address);
		userinfo.setEmail(Email);
		userinfo.setLoginName(UserName);
		userinfo.setRealName(realName);
		UserLogin userLogin=new UserLogin();
		userLogin.setLoginName(UserName);
		userLogin.setPassword(password);
		this.LoginUserServiceImpl.regist(userinfo, userLogin);
		return "user/index";
	}
	
	@RequestMapping("/show_all")
	public void show_all() {
		this.LoginUserServiceImpl.show_all();
	}
	
	@RequestMapping("/LoginOutServlet")
	public String LoginOutServlet(HttpSession session) {
		session.removeAttribute("user");
		return "user/index";
	}
}