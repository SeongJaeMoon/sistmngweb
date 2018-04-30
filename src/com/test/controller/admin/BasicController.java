package com.test.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class BasicController {
	
	// 관리자 > 기초정보관리 > 코스관리
	@RequestMapping("/basiccourselist")
	public String courselist() {
	
		return "admin/basic/courselist";
	}
	
	// 관리자 > 기초정보관리 > 과목관리
	@RequestMapping("/subjectlist")
	public String subjectlist() {
	
		return "admin/basic/subjectlist";
	}
	
	// 관리자 > 기초정보관리 > 강의실관리
	@RequestMapping("/classlist")
	public String classlist() {
	
		return "admin/basic/classlist";
	}
	
	// 관리자 > 기초정보관리 > 교재관리
	@RequestMapping("/booklist")
	public String booklist() {
	
		return "admin/basic/booklist";
	}
	
	
}
