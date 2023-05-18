package com.easyfit.domain.join;

import java.util.Date;

import lombok.Data;

@Data
public class TrainerBoardJoinVO {
	
	private String tid;
	
	private Long tbno; //트레이너게시글 글번호
	private Long tno; //트레이너게시글 게시자
	private String tbtitle; //트레이너게시글 글제목
	private String tbcontent; //공지 내용

	private Date tbdate; //트레이너게시글 날짜
	
	private Date tbupdatedate; //트레이너게시글 업뎃날짜
	private String tname;
	
}
