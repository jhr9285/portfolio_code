package com.easyfit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ExerciseRecordArrayVO {
	
	public Long[] ergroup; // 운동그룹번호
	public Long[] erno; // 운동기록번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date[] edate; // 운동일자
	public Long[] eno; // 운동종목번호
	public Long[] erset; // 운동 세트 회차
	public Long[] erweight; // 1세트에 사용된 운동 중량(무게가 없는 운동의 경우 null 허용)
	public Long[] ernumber; // 1세트당 운동 횟수
	public Long[] prno; // PT기록번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date[] erdate; // 운동기록일자(작성일자)
	public String[] ermemo; // 운동기록 관련 코멘트
	
	public String[] insertValue; // modify 시 새로 추가한 데이터만 모아두는 배열 변수
	public String[] updateValue; // modify 시 기존 데이터 변경한 데이터만 모아두는 배열 변수
	
}
