package com.test.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin")
public class InsController {

	/*	@Autowired
	private AdminJDBCTemplate jdbcTemplate;*/

	
	// 홈 > 강사 관리
	@RequestMapping("/inslist")
	public String inslist() {
			
		return "admin/ins/instructoraccountmanagement";
	}
	
	// 홈 > 강사 관리 >강사 추가
	@RequestMapping("/insaddform")
	public String insaddform() {

		return "admin/ins/instructoraccountadd";
	}
	
	//홈 > 강사 관리 > 강사 상세 보기 
	@RequestMapping("/insdetail")
	public String insdetail() {
		
		return "admin/ins/instructoraccountdetail";
	}
	// 홈 > 강사 관리 > 강사 수정
	@RequestMapping("/insedit")
	public String insedit() {
		
		return "admin/ins/instructoraccountedit";
	}
	
	
	/*@RequestMapping("/login")
	public String login() {
		
		return "admin/ins/login";
	}
	@RequestMapping("/loginfail")
	public String loginfail() {
		
		return "admin/ins/loginfailform";
	}
	@RequestMapping("/logout")
	public String logout() {
		
		return "admin/ins/logoutform";
	}
	@RequestMapping("/loginsample")
	public String loginsample() {
		
		return "admin/ins/loginsample";
	}*/
	
}
