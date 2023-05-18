package com.easyfit.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PTRecordVO {
	private Long prno; // PT기록번호
	private Long mno; // 회원번호
	private Long tno; // 담당트레이너번호
	private Long prturn; // PT계약회차
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prstartdate; // PT시작일자(계약회차 1회차 당)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prenddate; // PT종료일자(계약회차 1회차 당)
	private long prcount; // PT수업 진행회차 (계약회차 1회차 당)
	private long prcountall; // PT수업회 전체회차 (계약회차 1회차 당)
	private String prmemo; // PT기록 관련 코멘트
}
