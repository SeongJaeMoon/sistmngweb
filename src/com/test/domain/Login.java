package com.test.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Login {

	// 로그인 전용 이름, 주민번호
	@Getter @Setter
	private String name_, ssn_;
}
