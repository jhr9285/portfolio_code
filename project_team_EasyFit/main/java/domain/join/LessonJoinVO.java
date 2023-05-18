package com.easyfit.domain.join;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LessonJoinVO {

	private Long rn;	
	
	private Long mno; // 회원번호
	private String mname; // 회원이름

	private Date mbirth; // 생년월일
	private String mgen; // 성별
	private String mtel; // 전화번호
	private String memail; // 이메일
	private String maddress; // 주소
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mjoindate; // 가입일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mdeldate; // 탈퇴일
	private String misacivity; // 회원계정활동여부 
	private String mmemo; // 회원비고
	
	private Long ergroup; // 운동묶음번호
	private Long erno; // 운동기록번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edate; // 운동일자
	private Long erset; // 운동 세트 회차
	private Long erweight; // 1세트에 사용된 운동 중량(무게가 없는 운동의 경우 null 허용)
	private Long ernumber; // 1세트당 운동 횟수
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date erdate; // 운동기록일자(작성일자)
//↓ 새로운 변수
	private Date maxerdate;//최근 운동기록일자(작성일자)
//↑	새로운 변수
	private String ermemo; // 운동기록 관련 코멘트
	
	private Long prno; // PT기록번호
	private Long tno; // 담당트레이너번호
	private Long prturn; // PT계약회차
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prstartdate; // PT시작일자(계약회차 1회차 당)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prenddate; // PT종료일자(계약회차 1회차 당)
	private Long prcount; // PT수업 진행회차 (계약회차 1회차 당)
	private Long prcountall; // PT수업회 전체회차 (계약회차 1회차 당)
	private String prmemo; // PT기록 관련 코멘트
	
	private Long eno; // 운동종목번호
	private String ename; // 운동종목이름
	private Date emgr; // 상위운동종목번호
	private String ememo; // 운동 관련 메모
	private long max; // TrainerMapper.xml의 MAX(prturn)
}
