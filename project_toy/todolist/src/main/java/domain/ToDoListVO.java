package com.mycom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ToDoListVO {
	
	private Long no;
	private String content;
	private String state;
	private Date wdate;
	
}
