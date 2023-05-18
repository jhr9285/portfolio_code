package com.easyfit.domain.join;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyJoinVO {

		private String tid;
		private Long rno;
		private Long tbno;
		private String rcontent;
		private Long tno; //트레이너번호, 트레이너가 작성자.
		private Date rdate;
		private Date rupdateDate;

		private String tname;
}
