package com.easyfit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private Long tbno;
	private String rcontent;
	private String tno; //트레이너번호, 트레이너가 작성자.
	private Date rdate;
	private Date rupdateDate;

}
