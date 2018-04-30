package com.test.domain;

import lombok.Data;
import lombok.Builder;

@Data
@Builder
public class Member {
	
	//회원 번호, 이름, 주민번호, 전화번호, 회원구분, 회원 등록일
	private String mid, name_, ssn_, phone, memberStatus, memberRegDate;

}
