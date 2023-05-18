package com.easyfit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TrainerBoardVO {
	
	private Long tbno; //트레이너게시글 글번호
	private long tno; //트레이너게시글 게시자
	private String tbtitle; //트레이너게시글 글제목
	private String tbcontent; //공지 내용

	private Date tbdate; //트레이너게시글 날짜
	
	private Date tbupdatedate; //트레이너게시글 업뎃날짜
	
}
