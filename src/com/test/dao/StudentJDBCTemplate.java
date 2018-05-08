package com.test.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.test.domain.*;

public class StudentJDBCTemplate implements StudentDAO{

	private JdbcTemplate jdbcTemplate;
	
	
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Student studentInfo(String mid) {
		/*
		 SELECT COUNT(sh.mid) AS count_, m.name_, m.ssn, m.phone 
		 FROM studentHistory_ sh, member_ m, student_ s, s.studentregdate
		 WHERE sh.mid = s.mid
		 AND s.mid = m.mid
		 AND sh.mid = 'MEM007' GROUP BY  m.name_, m.ssn, m.phone, s.studentregdate;
		 */
		String sql = "SELECT COUNT(sh.mid) AS count_, m.name_, m.ssn, m.phone, s.studentregdate FROM studentHistory_ sh, member_ m, student_ s WHERE sh.mid = s.mid AND s.mid = m.mid AND sh.mid = ? GROUP BY  m.name_, m.ssn, m.phone, s.studentregdate";
		
		Student ret = this.jdbcTemplate.queryForObject(sql, new Object[]{mid}, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student a = Student.builder()
						.count_(rs.getInt("count_"))
						.studentRegDate(rs.getString("studentRegDate"))
						.name_(rs.getString("name_"))
						.ssn(rs.getString("ssn"))
						.phone(rs.getString("phone"))
						.build();
				return a;
			}
		});
		
		return ret;
	}

	@Override
	public List<Student> studentScore(String mid) {
		/*
		CREATE OR REPLACE VIEW studentHistoryView
		AS
		-- 과정코드 / 과정명 / 시작일 / 종료일 / 강의실 /수료
        SELECT o.openCoCode, co.courseName, o.openCoStartDate, o.openCoCloseDate, cl.className, d.failureDate, sh.mid
		FROM openCourse_ o, studentHistory_ sh, dropOut_ d, class_ cl, course_ co
		WHERE o.openCoCode = sh.openCoCode
	 	AND o.classCode = cl.classCode
        AND d.mid(+) = sh.mid
	 	AND d.openCoCode(+) = sh.openCoCode
        AND co.courseCode = o.courseCode;
		 */
		
		String sql = "SELECT openCoCode, courseName, openCoStartDate, openCoCloseDate, className, NVL(failureDate, SYSDATE) AS failureDate FROM studentHistoryView WHERE mid = ?";
		List<Student> ret = this.jdbcTemplate.query(sql, new Object[]{mid}, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate now = LocalDate.now();
				DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				
				LocalDate fd = rs.getDate("failureDate").toLocalDate();
				LocalDate openCoCloseDate = rs.getDate("openCoCloseDate").toLocalDate();
				String temp = "";
				if(fd.isEqual(now) && now.isAfter(openCoCloseDate)) {
					temp = "수료";
				}else if(fd.isEqual(now) && openCoCloseDate.isBefore(now)){
					temp = "수강중";
				}else {
					temp = String.format("%s / 중도탈락",fd.format(dateFormat));
				}
				
				Student a = Student.builder()
						.openCourseCode(rs.getString("openCoCode"))
						.courseName(rs.getString("courseName"))
						.openCourseStartDate(rs.getDate("openCoStartDate").toString())
						.openCourseStartDate(openCoCloseDate.toString())
						.className(rs.getString("className"))
						.completionCheck(temp)
						.build();
				
				return a;
			}
		}); 
				
		return ret;
	}

	@Override
	public List<Student> studentSubject(String mid, String openCoCode) {
				//개설과정, 개설과목, 과목, 시험, 배점, 회원, 책
				//openSubject_, subject_, course_, score_, test_, distribution_, member_, books_
				/*
				 CREATE OR REPLACE VIEW studentSubjectView
		        AS
		        SELECT st.mid, oc.openCoCode, os.openSubCode, su.subjectName, 
		        os.openSubStartDate, os.openSubCloseDate, b.bookName, m.name_, 
		        di.attDistribution, di.wriDistribution, di.pracDistribution, sc.attendanceScore, sc.writingScore, sc.practiceScore,
				ts.testDate, ts.testFile
				FROM openSubject_ os, subject_ su, score_ sc, test_ ts, distribution_ di, member_ m, books_ b, openCourse_ oc, student_ st
				WHERE os.subjectCode = su.subjectCode
				AND os.mid = m.mid
				AND os.bookCode = b.bookCode
				AND os.openSubCode = ts.openSubCode
				AND ts.testCode = di.testCode
				AND sc.testCode = di.testCode
				AND oc.openCoCode = os.openCoCode
		        AND st.mid = sc.mid
				AND ts.testCode = sc.testCode;
				 */
		String sql = "SELECT openSubCode, subjectName, openSubStartDate, openSubCloseDate, bookName, isbn, name_, attDistribution, wriDistribution, pracDistribution, attendanceScore, writingScore, practiceScore, testDate, testFile FROM studentSubjectView WHERE mid = ? AND openCoCode = ?";
		
		List<Student> ret = this.jdbcTemplate.query(sql, new Object[] {mid, openCoCode}, new RowMapper<Student>() {

			@Override
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				
				LocalDate openSubStartDate = rs.getDate("openSubStartDate").toLocalDate();
				LocalDate openSubCloseDate = rs.getDate("openSubCloseDate").toLocalDate();
				LocalDate testDate = rs.getDate("testDate").toLocalDate();
				
				Student s = Student.builder()
						.openSubCode(rs.getString("openSubCode"))
						.subjectName(rs.getString("subjectName"))
						.openSubStartDate(openSubStartDate.format(dateFormat))
						.openSubCloseDate(openSubCloseDate.format(dateFormat))
						.bookName(rs.getString("bookName"))
						.isbn(rs.getString("isbn"))
						.name_(rs.getString("name_"))
						.attDistribution(rs.getInt("attDistribution"))
						.wriDistribution(rs.getInt("wriDistribution"))
						.pracDistribution(rs.getInt("pracDistribution"))
						.attendanceScore(rs.getInt("attendanceScore"))
						.writingScore(rs.getInt("writingScore"))
						.practiceScore(rs.getInt("practiceScore"))
						.testDate(testDate.format(dateFormat))
						.testFile(rs.getString("testFile"))
						.build();
				/*.totalScore(rs.getInt("writingScore") + rs.getInt("practiceScore") + rs.getInt("attendanceScore"))*/
				return s;
			}
			
		});
		
		return ret;
	}

	@Override
	public Student getCourseInfo(String openCoCode) {
		String sql = "SELECT co.courseName, oc.openCoStartDate, oc.openCoCloseDate FROM course_ co, openCourse_ oc WHERE co.courseCode = oc.courseCode AND oc.openCoCode = ?";
		
		Student ret = this.jdbcTemplate.queryForObject(sql, new Object[] {openCoCode}, new RowMapper<Student>() {

			@Override
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student s = Student.builder()
						.courseName(rs.getString("courseName"))
						.openCourseStartDate(rs.getString("openCourseStartDate"))
						.openCourseCloseDate(rs.getString("openCourseCloseDate"))
						.build();
				return s;
			}
			
		});
		
		return ret;
	}

}
