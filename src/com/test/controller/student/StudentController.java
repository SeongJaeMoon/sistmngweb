package com.test.controller.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {


	// 수강생 목록
	@RequestMapping("/list")
	public String studentlist() {
	
		return "student/studentlist";
	}
	
	// 수강생 > 수강생 등록 과정 
	@RequestMapping("/studentscore")
	public String studentscorelist() {
		
		return "student/studentscore";
	}
	
	// 수강생 > 수강생 등록 과정 > 점수 보기
	@RequestMapping("/studentscoredetail")
	public String studentscoredetail() {
		
		return "student/studentscoredetail";
	}
}
