package com.test.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class CourseController {
	
	// 홈 > 과정 관리
	@RequestMapping("/courselist")
	public String courselist() {
		return "admin/course/courselist";
	}
	
	// 홈 > 과정 관리 > 과정 추가
	@RequestMapping("/courseaddform")
	public String courseaddform() {
		
		return "admin/course/courseaddform";
	}
	
	// 홈 > 과정 관리 > 과목 관리
	@RequestMapping("/coursedetaillist")
	public String coursedetail() {
		
		return "admin/course/coursedetaillist";
	}
	
	// 홈 > 과정 관리 > 과목 관리 > 과목 추가
	@RequestMapping("/subjectaddform")
	public String subjectaddform() {
		
		return "admin/course/subjectaddform";
	}
	
	// 홈 > 과정 관리 > 과목 관리 > 과목 상세 보기
	@RequestMapping("/subjectdetaillist")
	public String subjectdetaillist() {
		
		return "admin/course/subjectdetaillist";
	}
}
