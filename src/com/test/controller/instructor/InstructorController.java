package com.test.controller.instructor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;	
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/instructor", method = RequestMethod.POST)
public class InstructorController {

	private static final Logger logger = LoggerFactory.getLogger(InstructorController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String instructorInfo(ModelAndView mv) {
		return "instructor/info";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String instructorInfo(Model model) {
		return "instructor/info";
	}

	@RequestMapping(value = "/lectureinfo", method = RequestMethod.GET)
	public String lectureInfo() {
		return "instructor/schedule/lectureinfo";
	}

	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String schedule() {
		return "instructor/schedule/schedule";
	}

	@RequestMapping(value = "/scorelist", method = RequestMethod.GET)
	public String scoreList() {
		return "instructor/test/scorelist";
	}

	@RequestMapping(value = "/testlist", method = RequestMethod.GET)
	public String testList() {
		return "instructor/test/testlist";
	}

	@RequestMapping(value = "/testmng", method = RequestMethod.GET)
	public String testMng() {
		return "instructor/test/testmng";
	}

}
