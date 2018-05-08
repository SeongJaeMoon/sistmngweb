package com.test.dao;

import com.test.domain.*;
import java.util.List;

public interface StudentDAO {
	//회원정보출력
	public Student studentInfo(String mid);
	//과정정보출력
	public List<Student> studentScore(String mid);
	//과목 정보 전체 출력
	public List<Student> studentSubject(String mid, String openCoCode);
	//과정명 / 과정 시작일 / 과정 종료일 계산
	public Student getCourseInfo(String openCoCode);
}
