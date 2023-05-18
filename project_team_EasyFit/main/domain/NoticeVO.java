package com.easyfit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	
	/*
	SELECT
	    nno, ntitle, ncontent, tno, ndate
	FROM
	    notice
	;
	 */

	private Long rn;//글번호
	private Long nno; //공지 글번호
	private String ntitle; //공지 글제목
	private String ncontent; //공지 내용
	private long tno; //공지글 게시자
	private Date ndate; //공지 날짜
}
