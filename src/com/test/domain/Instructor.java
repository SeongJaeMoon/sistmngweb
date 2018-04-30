package com.test.domain;

import lombok.Getter;
import lombok.Data;
import lombok.Builder;

@Data
@Builder
public class Instructor {
	@Getter
	// 회원고유번호(pk),회원구분, 이름, 주민번호, 전화번호, 회원등록일
		private String mid, memberStatus, name_, ssn, phone;
		private String studentRegDate;
		// 강사 등록일
		private String instructorRegDate;
		// 과정코드(pk), 과정명
		private String courseCode, courseName;
		// 강의실고유번호(pk), 강의실명
		private String classCode, className;
		// 개설과정 코드, 개설과정 상태
		private String openCocode, openCoStatus;
		// 개설과정 등록인원
		private int classQuota;
		// 개설 과정 기간 시작일, 개설 과정 기간 종료일
		private String openCoStartDate, openCoCloseDate;
		// 과목코드(pk), 과목명
		private String subjectCode, subjectName;
		// 개설 과목(pk), 교재번호(fk))
		private String openSubCode, bookCode, openSubSatus;
		// 개설 과목 시작일, 개설 과목 종료일
		private String openSubStartDate, openSubCloseDate;
		// 교재명, 출판사명
		private String bookName, bookPublisher;
		// 수료상태
		private String studentStatus;
		// 탈락코드(pk), 탈락날짜
		private String failureCode;
		private String failureDate;
		// 시험코드(pk), 시험날짜, 시험문제파일
		private String testCode, testFile;
		private String testDate;
		// 배점코드(pk), 출석배점, 필기배점, 실기배점
		private String distributionCode;
		private int attendanceDistribution, writingDistribution, practiceDistribution;
		// 성적코드(pk)
		private String scoreCode;
		// 성적 출결점수 ,필기점수, 실기점수, 총점, 성적 등록인원
		private int attendanceScore, writingScore, practiceScore, totalScore, numberOfStuHaveScore;
}
