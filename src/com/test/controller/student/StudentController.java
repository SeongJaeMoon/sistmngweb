package com.test.controller.student;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.test.dao.StudentJDBCTemplate;
import com.test.domain.Student;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;
import javax.xml.xpath.*;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private StudentJDBCTemplate jdbcTemplate;
	
	@Autowired
	private ServletContext context;
	
	// 수강생 목록
	@RequestMapping("/list")
	public String studentlist(Model model) {
		String mid = "MEM007";
		Student s = this.jdbcTemplate.studentInfo(mid);
		
		model.addAttribute("studentinfo", s);
		
		return "student/studentlist";
	}
	
	// 수강생 > 수강생 등록 과정 
	@RequestMapping("/studentscore")
	public String studentscorelist(Model model) {
		String mid = "MEM007";
		List<Student> ret = this.jdbcTemplate.studentScore(mid);
		model.addAttribute("studentscore", ret);
		
		return "student/studentscore";
	}
	
	// 수강생 > 수강생 등록 과정 > 점수 보기
	@RequestMapping("/studentscoredetail")
	public String studentscoredetail(Model model, String ocu, String dates, String octitle) {
		String mid = "MEM007";
		
		List<Student> ret = this.jdbcTemplate.studentSubject(mid, ocu);
		
		for(int i = 0; i < ret.size(); i++) {
			String url = "";
			try {
				url = this.getBookImgUrl(ret.get(i).getIsbn());
			}catch(Exception e) {
				System.out.println(e);
			}
			if(!url.equals("")) {
				Student temp = ret.get(i);
				temp.setIsbn(url);
				ret.set(i, temp);
			}
		}
		
		model.addAttribute("studentsubject", ret);
		model.addAttribute("ocu", ocu);
		model.addAttribute("dates", dates);
		model.addAttribute("octitle", octitle);
		
		return "student/studentscoredetail";
	}
	
	private String getBookImgUrl(String isbn) throws ParserConfigurationException, IOException, SAXException, XPathExpressionException {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		String apikey = "48C0FDD868AFA5A3DD58893358C806EFC358FE5FAA15113CC4EEBA2C5125C9C8";
		String str = "http://book.interpark.com/api/search.api?key="+apikey+"&inputEncoding=utf-8&query="+isbn+"&queryType=isbn";
		Document xmlObj = null;
		URL url = new URL(str);
		InputSource is = new InputSource(url.openStream());
		xmlObj = builder.parse(is);
		
		XPath xPath = XPathFactory.newInstance().newXPath();
		xPath.compile("channel/totalResults").evaluate(xmlObj,XPathConstants.STRING);
		
		String result = xPath.compile("/channel/item[1]/coverSmallUrl").evaluate(xmlObj);     
	    System.out.println(result);  
		return result;
	}
	
	@RequestMapping("/studentajax")
	public @ResponseBody Map<String, List<Student>> studentajax(String query){
		Map<String, List<Student>> map = new HashMap<>();
		String mid = "MEM007";
		
		List<Student> ret = this.jdbcTemplate.studentSubject(mid, query);
		map.put("success", ret);
		
		return map;
	}
}
