package com.test.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.test.domain.*;

public class StudentJDBCTemplate implements StudentDAO{

	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Student menu_1() {
		/*
		 SELECT COUNT(sh.mid) AS count_, m.name_, m.ssn, m.phone 
		 FROM studentHistory_ sh, member_ m, student_ s
		 WHERE sh.mid = s.mid
		 AND s.mid = m.mid
		 AND sh.mid = 'MEM007' GROUP BY  m.name_, m.ssn, m.phone ;
		 */
		String sql = "SELECT COUNT(sh.mid) AS count_, m.name_, m.ssn, m.phone FROM studentHistory_ sh, member_ m, student_ s WHERE WHERE sh.mid = s.mid AND s.mid = m.mid AND sh.mid = ? GROUP BY  m.name_, m.ssn, m.phone";
		
		Student a = this.jdbcTemplate.queryForObject(sql, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student a = Student.builder()
						.count_(rs.getInt("count_"))
						.name_(rs.getString("name_"))
						.ssn(rs.getString("ssn"))
						.phone(rs.getString("phone"))
						.build();
				return a;
			}
		});
		
		return a;
	}

	@Override
	public List<Student> menu_2(String mid) {
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
		List<Student> ret = this.jdbcTemplate.query(sql, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int row) throws SQLException {
				Student a = Student.builder()
						.openCourseCode(rs.getString("openCoCode"))
						.courseName(rs.getString("courseName"))
						.openCourseStartDate(rs.getString("openCoStartDate"))
						.openCourseStartDate(rs.getString("openCoCloseDate"))
						.className(rs.getString("className"))
						.failureDate(rs.getString("failureDate"))
						.build();
				
				return a;
			}
		}); 
				
		return ret;
	}

	@Override
	public List<Student> menu_21(String openCoCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getCourseInfo(String openCoCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
