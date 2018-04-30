package com.test.domain;

import lombok.Getter;
import lombok.Data;
import lombok.Builder;

@Data
@Builder
public class Student {
		@Getter
		//회원고유번호(pk), 이름, 주민번호 뒷 자리, 전화번호
		private String mid, name_, ssn, phone;
		//수강생 등록일
		private String studentRegDate;
		//과정코드(pk), 과정명, 과정수강횟수
		private String courseCode, courseName;
		private int courseNumber;
		//개설과정코드(pk), 강의실고유번호(pk), 강의실명, 정원
		private String openCourseCode, classCode, className, classQuota;
		//개설 과정 기간 시작일, 개설 과정 기간 종료일
		private String openCourseStartDate, openCourseCloseDate;
		//개설과목코드(pk), 교재번호, 교재명, 개설 과목 기간 시작일, 개설 과정 기간 종료일
		private String openSubCode, bookCode, bookName;
		private String openSubStartDate, openSubCloseDate;
		//과목코드(pk), 과목명
		private String subjectCode, subjectName; 
		//탈락코드(pk), 탈락날짜, 수료여부
		private String failureCode;
		private String failureDate;
		private String failureStatus;
		//시험코드(pk), 시험날짜, 시험문제파일
		private String testCode, testFile;
		private String testDate;
		//배점코드(pk), 출석배점, 필기배점, 실기배점
		private String distributionCode;
		private int attDistribution, wriDistribution, pracDistribution;
		//성적코드(pk), 출결점수, 필기점수, 실기점수
		private String scoreCode;
		private int attendanceScore, writingScore, practiceScore;
		//수료여부 (수료, 중도탈락, 수강중)
		private String completionCheck;
		// 수강횟수
		private int count_;
}
