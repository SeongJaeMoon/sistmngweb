package com.test.domain;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Data
@Builder
public class Admin {
	@Getter
	private String mid; // 회원고유번호(pk)
	private String memberStatus; // 회원구분
	private String name_, ssn, phone; // 회원정보,주민번호,전화번호
	private String memberRegDate; // 회원등록일
	private String adminRegDate; // 관리자 등록일
	private String sstudentRegDate; // 수강생 등록일
	private String instructorRegDate; // 강사 등록일
	private String courseCode, courseName; // 과정코드,과정이름
	private String subjectCode, subjectName; // 과목코드,과목이름
	private String classCode, className; // 강의실코드,강의실이름
	private int classQuota; //강의실 정원
	private String bookCode, bookName, bookPublisher; // 교재코드,교재이름,출판사
	private String openCoCode; // 개설 과정 코드
	private String openCoStartDate, openCoCloseDate; // 개설과정시작일,개설과정종료일
	private String openSubCode; // 개설 과목 코드
	private String openSubStartDate, openSubCloseDate; // 개설과목시작일, 개설과목종료일
	private String failureCode; // 중도 탈락 코드
	private String failureDate; // 중도탈락
	private String scoreCode; // 성적코드
	private int attendanceScore, writingScore, practiceScore; // 출결,필기,실기 점수
	private String disCode; // 배점코드
	private int attDistribution, wriDistribution, pracDistribution; // 출결,필기,실기 배점
	private String testCode; // 시험코드
	private String testDate; // 시험날짜
	private String testFile; // 시험문제파일
	private String instStatus; //강의상태
	private int count_; // 개설과정 등록 갯수
	private int count_studentHistory; // 과정등록인원
	private String completionCheck; //수료여부
	private String checkDelOpenCourse; // 개설과정 삭제 가능 여부
	private int courseCount; //수강횟수
	private int num; //번호부여 변수
	private int count_openSub; //개설 과목 등록 갯수
}
