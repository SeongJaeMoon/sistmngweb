package com.test.dao;

import com.test.domain.*;
import java.util.List;

public interface StudentDAO {
	//회원정보출력
	public Student menu_1();
	//과정정보출력
	public List<Student> menu_2(String mid);
	//과목 정보 전체 출력
	public List<Student> menu_21(String openCoCode);
	//과정명 / 과정 시작일 / 과정 종료일 계산
	public String getCourseInfo(String openCoCode);
}
