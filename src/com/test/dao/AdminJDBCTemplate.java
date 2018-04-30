package com.test.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class AdminJDBCTemplate implements AdminDAO {


	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
}
