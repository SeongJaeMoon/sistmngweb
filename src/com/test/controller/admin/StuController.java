package com.test.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class StuController {
	
	
	
	// 관리자 > 수강생 관리 > 메인화면 
	@RequestMapping("/studentlist")
	public String studentlist() {
	
		return "admin/stu/studentlist";
	}
	
	// 관리자 > 수강생 관리 > 수강생 상세보기
	@RequestMapping("/studentdetaillist")
	public String studentdetaillist() {
	
		return "admin/stu/studentdetaillist";
	}
	
	// 관리자 > 수강생 관리 > 수강생 등록과정 상세보기
	@RequestMapping("/studentcoursedetaillist")
	public String studentcoursedetaillist() {
	
		return "admin/stu/studentcoursedetaillist";
	}
	
	// 관리자 > 수강생 관리 > 수강생 등록
	@RequestMapping("/studentaddform")
	public String studentaddform() {
	
		return "admin/stu/studentaddform";
	}
	
	// 관리자 > 수강생 수정
	@RequestMapping("/studentmodify")
	public String studentmodify() {
	
		return "admin/stu/studentmodify";
	}
}
