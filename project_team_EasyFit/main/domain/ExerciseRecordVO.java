package com.easyfit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ExerciseRecordVO {//변수는 DB에 있는것과 맞춰서 작성하세요.

	private Long ergroup; // 운동그룹번호
	private Long erno; // 운동기록번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edate; // 운동일자
	private Long eno; // 운동종목번호
	private Long erset; // 운동 세트 회차
	private Long erweight; // 1세트에 사용된 운동 중량(무게가 없는 운동의 경우 null 허용)
	private Long ernumber; // 1세트당 운동 횟수
	private Long prno; // PT기록번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date erdate; // 운동기록일자(작성일자)
	private String ermemo; // 운동기록 관련 코멘트
	
	
	public ExerciseRecordVO() {}

	
}
