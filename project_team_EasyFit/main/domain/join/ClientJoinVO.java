package com.easyfit.domain.join;



import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ClientJoinVO {
	//순서
	private long rn;
	//트레이너번호
	private long tno;	
	//회원번호
	private long mno;	
	//회원이름
	private String mname;
	//생년월일
	private Date mbirth; 
	//성별
	private String mgen;	
	//전화번호
	private String mtel;	
	//주소
	private String maddress;	
	//가입일
	private Date mjoindate;	
	//탈퇴일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mdeldate;	
	//회원계정활동여부
	private String misacivity;	
	//회원비고
	private String mmemo;	
	//이메일
	private String memail;
}
