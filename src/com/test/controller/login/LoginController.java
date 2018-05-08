package com.test.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/loginRequest")
	public String loginRequest(String optradio) {
		String result = "";
		if(optradio.equals("1")){
			result = "redirect:/student/list";
		}else if(optradio.equals("2")){
			
		}else if(optradio.equals("3")){
			
		}
		
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
//		//세션 소멸
//		session.invalidate();
		return "redirect:/logoutForm";
	}
	
	@RequestMapping("/logoutform")
	public String logoutForm() {
		
		return "login/logoutForm";  
	}
	
	@RequestMapping("/loginFail")
	public String loginFail() {
		
		return "login/loginFail"; 
	}
}
