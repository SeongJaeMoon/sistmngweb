package com.test.dao;

import com.test.domain.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class StudentMapper implements RowMapper<Admin>{

	@Override
	public Admin mapRow(ResultSet rs, int row)  throws SQLException{
		Admin s = Admin.builder()
				.build();
		
		return s;
	}


}
