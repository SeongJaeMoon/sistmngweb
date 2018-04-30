package com.test.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// 관리자 홈
	@RequestMapping("/list")
	public String list() {
		return "admin/main";
	}
}
