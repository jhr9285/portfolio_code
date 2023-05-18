package com.easyfit.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class TrainerVO {//변수는 DB에 있는것과 맞춰서 작성하세요.
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
	
	private List<TrainerAuthVO> trainerAuthList;
}
