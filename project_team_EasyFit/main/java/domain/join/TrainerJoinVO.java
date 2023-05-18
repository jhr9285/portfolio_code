package com.easyfit.domain.join;

import java.util.Date;

import lombok.Data;

@Data
public class TrainerJoinVO {
	private Long tno; //pk
	private String tname;
	private String tpassword;
	private String tgen;
	private String ttel;
	private String taddress;
	private boolean enabled;
	private String tmemo;
	private String tid;
	private Date tbirth;
	

	private String auth;
	
}
