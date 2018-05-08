package com.test.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.test.domain.Instructor;
import com.test.domain.Student;

public class InstructorJDBCTemplate implements InstructorDAO{
	
	private JdbcTemplate jdbcTemplate;
	private LocalDate now = LocalDate.now();
	private DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Instructor> instructorInfo(String mid) {
		/*
		 * CREATE OR REPLACE VIEW InstructorInfoView AS SELECT m.name_ , m.phone , m.ssn
		 * , i.instructorRegDate , c.subjectCode , s.subjectName FROM member_ m ,
		 * instructor_ i, checkSubject_ c , subject_ s WHERE m.mid = i.mid AND i.mid =
		 * c.mid AND s.subjectCode = c.subjectCode;
		 */
		
		// 강사명 / 주민번호 / 전화번호 / 강의 가능 목록
		String sql = "SELECT name_, phone, ssn, instructorRegDate, subjectCode, subjectName FROM InstructorInfoView WHERE mid = ?";
		List<Instructor> instructorInfo = this.jdbcTemplate.query(sql, new Object[] {mid}, new RowMapper<Instructor>() {

			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				Instructor i = Instructor.builder()
						.name_(rs.getString("name_"))
						.phone(rs.getString("phone"))
						.ssn(rs.getString("ssn"))
						.instructorRegDate(rs.getString("instructorRegDate"))
						.subjectCode(rs.getString("subjectCode"))
						.subjectName(rs.getString("subjectName"))
						.build();
				return i;
			}
			
		});
				
		return instructorInfo;
	}

	@Override
	public List<Instructor> subjectListByInstructor(String mid) {
		/*
		 * CREATE OR REPLACE VIEW subjectListByInstructorView AS SELECT
		 * openS.openSubCode , subj.subjectName , openS.openSubStartDate ,
		 * openS.openSubCloseDate , books.bookName , openC.openCoCode , cours.courseName
		 * , openC.openCoStartDate , openC.openCoCloseDate ,
		 * clas.className,COUNT(*)OVER(PARTITION BY subj.subjectName) AS
		 * number_of_student, mem.mid, mem.name_ FROM openSubject_ openS , subject_ subj
		 * , books_ books , course_ cours , openCourse_ openC , class_ clas ,
		 * instructor_ instr , member_ mem WHERE openS.subjectCode = subj.subjectCode
		 * AND openS.openCoCode = openC.openCoCode AND openS.bookCode = books.bookCode
		 * AND openC.courseCode = cours.courseCode AND openC.classCode = clas.classCode
		 * AND openS.mid = instr.mid AND mem.mid = instr.mid GROUP BY openS.openSubCode
		 * , subj.subjectName , openS.openSubStartDate , openS.openSubCloseDate ,
		 * books.bookName , openC.openCoCode , cours.courseName , openC.openCoStartDate
		 * , openC.openCoCloseDate , clas.className, mem.mid, mem.name_ ORDER BY
		 * openS.openSubStartDate DESC;
		 */
		
		// 과목코드 / 과목명 / 과목 시작일 / 과목 종료일 / 교재명/ 과정코드 / 과정명 / 과정 시작일/ 과정 종료일 / 강의실 / 등록인원 / 상태
		String sql = "SELECT openSubCode , subjectName , openSubStartDate , openSubCloseDate , bookName , openCoCode , courseName , openCoStartDate , openCoCloseDate , className, number_of_student FROM subjectListByInstructorView WHERE mid = ?";
		
		List<Instructor> subjectListByInstructor = this.jdbcTemplate.query(sql, new Object[] {mid}, new RowMapper<Instructor>() {
				
			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate openSubStartDate = rs.getDate("openSubStartDate").toLocalDate();
				LocalDate openSubCloseDate = rs.getDate("openSubCloseDate").toLocalDate();
				LocalDate openCoStartDate = rs.getDate("openCoStartDate").toLocalDate();
				LocalDate openCoCloseDate = rs.getDate("openCoCloseDate").toLocalDate();
				Instructor i = Instructor.builder()
						.openSubCode(rs.getString("openSubCode"))
						.subjectName(rs.getString("subjectName"))
						.openSubStartDate(openSubStartDate.format(dateFormat))
						.openSubCloseDate(openSubCloseDate.format(dateFormat))
						.bookName(rs.getString("bookName"))
						.openCocode(rs.getString("openCocode"))
						.courseName(rs.getString("courseName"))
						.openCoStartDate(openCoStartDate.format(dateFormat))
						.openCoCloseDate(openCoCloseDate.format(dateFormat))
						.className(rs.getString("className"))
						.number_of_student(rs.getInt("number_of_student"))
						.build();
				return i;
			}
			
		});
		return subjectListByInstructor;
	}

	@Override
	public Instructor selectedSubjectByInstructor(String subCode) {
		/*
		 * CREATE OR REPLACE VIEW selectedSubjectByInstructor AS SELECT openSubCode ,
		 * subjectName , openSubStartDate , openSubCloseDate FROM subject_ sub ,
		 * openSubject_ openS , openCourse_ openC WHERE sub.subjectCode =
		 * openS.subjectCode GROUP BY openSubCode , subjectName , openSubStartDate ,
		 * openSubCloseDate ORDER BY openSubCode ASC;
		 */
		
		// 과목코드 / 과목명 / 과목시작일 / 과목종료일
		String sql = "SELECT openSubCode, subjectName, openSubStartDate, openSubCloseDate FROM selectedSubjectByInstructor WHERE openSubCode = ?";
		
		Instructor ins = this.jdbcTemplate.queryForObject(sql, new Object[] {subCode}, new RowMapper<Instructor>() {

			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate openSubStartDate = rs.getDate("openSubStartDate").toLocalDate();
				LocalDate openSubCloseDate = rs.getDate("openSubCloseDate").toLocalDate();
				
				Instructor i = Instructor.builder()
						.openSubCode(rs.getString("openSubCode"))
						.subjectName(rs.getString("subjectName"))
						.openSubStartDate(openSubStartDate.format(dateFormat))
						.openSubCloseDate(openSubCloseDate.format(dateFormat))
						.build();
				return null;
			}
			
		});
		return ins;
	}

	@Override
	public List<Instructor> studentListBySubject(String subCode) {
		/*
		 * CREATE OR REPLACE VIEW studentListBySubjectView AS SELECT m.mid, m.name_
		 * ,m.phone, s.sstudentRegDate, openS.openSubCode ,openS.openSubStartDate ,
		 * openS.openSubCloseDate, dropO.failureCode, dropO.failureDate FROM member_ m ,
		 * student_ s, studentHistory_ sh , openCourse_ openC , openSubject_ openS ,
		 * dropOut_ dropO WHERE m.mid = s.mid AND s.mid = sh.mid AND openC.openCoCode =
		 * sh.openCoCode AND openC.openCoCode = openS.openCoCode AND sh.openCoCode =
		 * dropO.openCoCode(+) AND sh.mid = dropO.mid(+) GROUP BY m.mid, m.name_
		 * ,m.phone, s.sstudentRegDate, openS.openSubCode ,openS.openSubStartDate ,
		 * openS.openSubCloseDate, dropO.failureCode ,dropO.failureDate;
		 */
		// 회원코드 / 이름 / 전화번호 / 등록일 / 개설과목시작일 / 개설과목종료일 / 탈락코드 / 탈락 날짜 / 수료
		String sql = "SELECT mid, name_, phone, studentRegDate, openSubStartDate, openSubCloseDate, NVL(failureCode, 'noFailureCode') finalFailureCode, NVL(failureDate, '1901-01-01') finalFailureDate FROM studentListBySubjectView Where openSubCode = ?";
		List<Instructor> studentListBySubject = this.jdbcTemplate.query(sql, new Object[] {subCode}, new RowMapper<Instructor>() {
			
		@Override
		public Instructor mapRow(ResultSet rs, int row) throws SQLException {
			LocalDate studentRegDate = rs.getDate("studentRegDate").toLocalDate();
			LocalDate openSubStartDate = rs.getDate("openSubStartDate").toLocalDate();
			LocalDate openSubCloseDate = rs.getDate("openSubCloseDate").toLocalDate();
			LocalDate finalFailureDate = rs.getDate("finalFailureDate").toLocalDate();
			Instructor i = Instructor.builder()
					.mid(rs.getString("mid"))
					.name_(rs.getString("name_"))
					.phone(rs.getString("phone"))
					.studentRegDate(studentRegDate.format(dateFormat))
					.openSubStartDate(openSubStartDate.format(dateFormat))
					.openSubCloseDate(openSubCloseDate.format(dateFormat))
					.failureCode(rs.getString("failureCode"))
					.finalFailureDate(finalFailureDate.format(dateFormat))
					.build();
				return i;
			}
		
		});
		return studentListBySubject;
	}

	@Override
	public List<Instructor> subjectListWithTestInfo(String mid) {
		
		 /*CREATE OR REPLACE VIEW subjectListByInstructorView AS
		 SELECT inst.mid, openS.openSubCode , subj.subjectName ,
		 openS.openSubStartDate , openS.openSubCloseDate , books.bookName ,
		 openC.openCoCode , course.courseName , openC.openCoStartDate ,
		 openC.openCoCloseDate , clas.className
		 FROM subject_ subj , openSubject_ openS , books_ books , course_ course ,
		 openCourse_ openC , class_ clas , instructor_ inst
		 WHERE subj.subjectCode = openS.subjectCode
		 AND books.bookCode = openS.bookCode
		 AND course.courseCode = openC.courseCode
		 AND clas.classCode = openC.classCode
		 AND openC.openCoCode = openS.openCoCode
		 AND inst.mid = openS.mid
		 AND openS.openSubCloseDate < TO_CHAR(SYSDATE,'YYYY-MM-DD');*/
		
		//개설 과목 코드, 과목명, 과목 시작일, 과목 종료일, 교재명, 개설 과정 코드, 과정명, 과정 시작일, 과정 종료일, 강의실명
		String sql = "SELECT openSubCode, subjectName, openSubStartDate, openSubCloseDate, bookName, openCoCode, courseName, openCoStartDate, openCoCloseDate, className FROM subjectListByInstructorView WHERE mid = ?";
		List<Instructor> subjectListWithTestInfo = this.jdbcTemplate.query(sql, new Object[] {mid}, new RowMapper<Instructor>() {

			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate openSubStartDate = rs.getDate("openSubStartDate").toLocalDate();
				LocalDate openSubCloseDate = rs.getDate("openSubCloseDate").toLocalDate();
				LocalDate openCoStartDate = rs.getDate("openCoStartDate").toLocalDate();
				LocalDate openCoCloseDate = rs.getDate("openCoCloseDate").toLocalDate();
				
				Instructor i = Instructor.builder()
						.openSubCode(rs.getString("openSubCode"))
						.subjectName(rs.getString("subjectName"))
						.openSubStartDate(openSubStartDate.format(dateFormat))
						.openSubCloseDate(openSubCloseDate.format(dateFormat))
						.bookName(rs.getString("bookName"))
						.openCocode(rs.getString("openCoCode"))
						.courseName(rs.getString("courseName"))
						.openCoStartDate(openCoStartDate.format(dateFormat))
						.openCoCloseDate(openCoCloseDate.format(dateFormat))
						.className(rs.getString("className"))
						.build();
					return i;
			}
			
		});
		return subjectListWithTestInfo;
	}

	@Override
	public List<Instructor> testListBySubject(String openSubCode) {
		/* CREATE OR REPLACE VIEW testsBySubjectView
		 AS
		SELECT os.openSubCode, s.subjectName, t.testCode, t.testDate, t.testFile,
		d.attDistribution, d.wriDistribution, d.pracDistribution
		FROM subject_ s, openSubject_ os, test_ t, distribution_ d
		WHERE s.subjectCode = os.subjectCode
		AND os.openSubCode = t.openSubCode
		AND t.testCode = d.testCode;*/
		String sql = "SELECT openSubCode, subjectName, testCode, testDate, attDistribution, wriDistribution, pracDistribution, testFile FROM testsBySubjectView WHERE openSubCode=?";
		List<Instructor> testListBySubject = this.jdbcTemplate.query(sql, new Object[] {openSubCode}, new RowMapper<Instructor>() {

			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate testDate = rs.getDate("testDate").toLocalDate();
				Instructor i = Instructor.builder()
						.openSubCode(rs.getString("openSubCode"))
						.subjectName(rs.getString("subjectName"))
						.testCode(rs.getString("testCode"))
						.testDate(testDate.format(dateFormat))
						.attDistribution(rs.getInt("attDistribution"))
						.wriDistribution(rs.getInt("wriDistribution"))
						.pracDistribution(rs.getInt("pracDistribution"))
						.build();
				return i;
			}
			
		});
		
		return testListBySubject;
	}

	@Override
	public int addDistribution(Instructor i) throws DataAccessException {
		String sql0 = "SELECT NVL(LPAD(SUBSTR(MAX(testCode),4,3)+1, 6, 'TES000'), 'TES001') finalTestCode FROM test_";
		String sql1 = "INSERT INTO test_ (testCode,openSubCode,testDate,testFile) VALUES (?,?,?,?)";
		String sql2 = "INSERT INTO distribution_ (disCode , testCode , attDistribution , wriDistribution , pracDistribution) VALUES ((SELECT NVL(LPAD(SUBSTR(MAX(disCode),4,3)+1, 6, 'DIV000'), 'DIV001') FROM distribution_), ?,?,?,?)";
		
		String finalTestCode = this.jdbcTemplate.queryForObject(sql0, String.class);
		
		int ret1 = this.jdbcTemplate.update(sql1, new Object[] {finalTestCode, i.getAttDistribution(), i.getWriDistribution(), i.getPracDistribution()});
		int ret2 = this.jdbcTemplate.update(sql2, new Object[] {finalTestCode, i.getAttDistribution(), i.getWriDistribution(), i.getPracDistribution()});
		return ret1 + ret2;
	}

	@Override
	public int deleteTest(String testCode) throws DataAccessException {
		
		String sql = "DELETE test_ WHERE testCode = ?";
		int result = this.jdbcTemplate.update(sql, new Object[] {testCode});
		
		return result;
	}

	@Override
	public List<Instructor> subjectListByNumberOfStudent(String mid) {
				/* CREATE OR REPLACE VIEW testView AS
				 SELECT ins.mid
				 ,tes.testCode , tes.testDate
				 ,dist.attDistribution , dist.wriDistribution , dist.pracDistribution
				 ,openS.openSubCode
				 ,sub.subjectName
				 ,openS.openSubStartDate , openS.openSubCloseDate
				 ,bok.bookName
				 ,openC.openCoCode
				 ,cou.courseName
				 ,openC.openCoStartDate , openC.openCoCloseDate
				 ,cla.className
				 ,COUNT(sco.testCode) AS studentNumber
				 FROM test_ tes , distribution_ dist , openSubject_ openS , subject_ sub ,
				 books_ bok , openCourse_ openC , course_ cou , class_ cla , score_ sco ,
				 instructor_ ins
				 WHERE tes.testCode = dist.testCode
				 AND tes.testCode = sco.testCode
				 AND tes.openSubCode = openS.openSubCode
				 AND sub.subjectCode = openS.subjectCode
				 AND bok.bookCode = openS.bookCode
				 AND openC.courseCode = cou.courseCode
				 AND cla.classCode = openC.classCode
				 AND openS.openCoCode = openC.openCoCode
				 AND ins.mid = openS.mid
				 GROUP BY ins.mid
				 ,tes.testCode , tes.testDate
				 ,dist.attDistribution , dist.wriDistribution , dist.pracDistribution
				 ,openS.openSubCode
				 ,sub.subjectName
				 ,openS.openSubStartDate , openS.openSubCloseDate
				 ,bok.bookName
				 ,openC.openCoCode
				 ,cou.courseName
				 ,openC.openCoStartDate , openC.openCoCloseDate
				 ,cla.className
				 ORDER BY tes.testCode ASC;*/
		// 과목코드 / 과목명 / 과목 시작일 / 과목 종료일 / 교재명/ 과정코드 / 과정명 / 과정 시작일 / 과정 종료일 / 강의실 / 등록인원 / 상태
		String sql = "SELECT testcode, testdate, attDistribution, wriDistribution, pracDistribution, openSubCode, subjectName, openSubStartDate, openSubCloseDate, bookName, openCoCode, courseName, openCoStartDate, openCoCloseDate, className, studentnumber FROM testView WHERE mid = ?";
		List<Instructor> subjectListByNumberOfStudent = this.jdbcTemplate.query(sql, new Object[] {mid}, new RowMapper<Instructor>() {

			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate testdate = rs.getDate("testdate").toLocalDate();
				LocalDate openSubStartDate = rs.getDate("openSubStartDate").toLocalDate();
				LocalDate openSubCloseDate = rs.getDate("openSubCloseDate").toLocalDate();
				LocalDate openCoStartDate = rs.getDate("openCoStartDate").toLocalDate();
				LocalDate openCoCloseDate = rs.getDate("openCoCloseDate").toLocalDate();
				
				Instructor i = Instructor.builder()
						.testCode(rs.getString("testCode"))
						.testDate(testdate.format(dateFormat))
						.attDistribution(rs.getInt("attDistribution"))
						.wriDistribution(rs.getInt("wriDistribution"))
						.pracDistribution(rs.getInt("pracDistribution"))
						.openSubCode(rs.getString("openSubCode"))
						.subjectName(rs.getString("subjectName"))
						.openSubStartDate(openSubStartDate.format(dateFormat))
						.openSubCloseDate(openSubCloseDate.format(dateFormat))
						.bookName(rs.getString("bookName"))
						.openCocode(rs.getString("openCocode"))
						.courseName(rs.getString("courseName"))
						.openCoStartDate(openCoStartDate.format(dateFormat))
						.openCoCloseDate(openCoCloseDate.format(dateFormat))
						.className(rs.getString("className"))
						.studentnumber(rs.getInt("studentnumber"))
						.build();
				return i;
			}
			
		});
		
		return subjectListByNumberOfStudent;
	}

	@Override
	public List<Instructor> scoreInfoByStudents(String testCode) {
		/* CREATE OR REPLACE VIEW testStudentView AS
				 SELECT tes.testCode,stu.mid , mem.name_ , mem.phone ,
				 mem.memberRegDate,dro.failureCode ,dro.failureDate , sco.attendanceScore ,
				 sco.writingScore , sco.practiceScore
				 FROM member_ mem , student_ stu , studentHistory_ sh , dropOut_ dro ,score_
				 sco , test_ tes
				 WHERE mem.mid = stu.mid
				 AND stu.mid = sco.mid
				 AND stu.mid = sh.mid
				 AND sh.mid = dro.mid(+)
				 AND sco.testCode = tes.testCode
				 GROUP BY tes.testCode,stu.mid , mem.name_ , mem.phone ,
				 mem.memberRegDate,dro.failureCode, dro.failureDate , sco.attendanceScore ,
				 sco.writingScore , sco.practiceScore;*/
		
		// 회원코드 / 이름 / 전화번호 / 등록일 / 수료 / 출결점수 / 필기점수 / 실기점수 / 총점"
		String sql = "SELECT mid, name_, phone, memberRegDate, NVL(failureCode, 'noFailureCode') failureCode, NVL(failureDate, '1901-01-01') finalFailureDate, attendanceScore, writingScore, practiceScore FROM testStudentView WHERE testCode = ?";
		
		List<Instructor> scoreInfoByStudents = this.jdbcTemplate.query(sql, new Object[] {testCode}, new RowMapper<Instructor>() {

			@Override
			public Instructor mapRow(ResultSet rs, int row) throws SQLException {
				LocalDate memberRegDate = rs.getDate("memberRegDate").toLocalDate();
				LocalDate finalFailureDate = rs.getDate("finalFailureDate").toLocalDate();
				Instructor i = Instructor.builder()
						.mid(rs.getString("mid"))
						.name_(rs.getString("name_"))
						.phone(rs.getString("phone"))
						.memberRegDate(memberRegDate.format(dateFormat))
						.failureCode(rs.getString("failureCode"))
						.finalFailureDate(finalFailureDate.format(dateFormat))
						.attendanceScore(rs.getInt("attendanceScore"))
						.writingScore(rs.getInt("writingScore"))
						.practiceScore(rs.getInt("practiceScore"))
						.build();
				return i;
			}
			
		});
		
		return scoreInfoByStudents;
	}

	@Override
	public int addScore(Instructor i) throws DataAccessException {
		String sql = "INSERT INTO score_ (scoreCode , mid , testCode , attendanceScore , writingScore, practiceScore) VALUES ((SELECT NVL(LPAD(SUBSTR(MAX(scoreCode),4,3)+1,6,'GRA000'),'GRA001') FROM score_),?,?,?,?,?)";
		int ret = this.jdbcTemplate.update(sql, new Object[] {i.getMid(),i.getTestCode(), i.getAttendanceScore(), i.getWritingScore() , i.getPracticeScore()});
		return ret;
	}

	@Override
	public int deleteScore(String mid, String testCode) throws DataAccessException {
		String sql = "DELETE FROM score_ WHERE testCode = ? AND mid = ?";
		int ret = this.jdbcTemplate.update(sql, new Object[] {mid, testCode});
		return ret;
	}

}
