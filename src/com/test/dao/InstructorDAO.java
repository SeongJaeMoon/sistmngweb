package com.test.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.test.domain.*;

public interface InstructorDAO {
	public List<Instructor> instructorInfo(String mid);
	public List<Instructor> subjectListByInstructor(String mid);
	public Instructor selectedSubjectByInstructor(String subCode);
	public List<Instructor> studentListBySubject(String subCode);
	public List<Instructor> subjectListWithTestInfo(String mid);
	public List<Instructor> testListBySubject(String openSubCode);
	public int addDistribution(Instructor i) throws DataAccessException;
	public int deleteTest(String testCode) throws DataAccessException;
	public List<Instructor> subjectListByNumberOfStudent(String mid);
	public List<Instructor> scoreInfoByStudents(String testCode);
	public int addScore(Instructor i) throws DataAccessException;
	public int deleteScore(String mid, String testCode) throws DataAccessException;
}
