package com.easyfit.domain.join;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeJoinVO {
	
	private Long rn;
	private Long nno; //공지 글번호
	private String ntitle; //공지 글제목
	private String ncontent; //공지 내용
	private Long tno; //트레이너 테이블의 기본키(PK)인 tno
	private Date ndate; //공지 날짜
	
	private String tname; //트레이너 이름
}
