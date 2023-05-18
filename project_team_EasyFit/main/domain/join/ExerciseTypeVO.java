package com.easyfit.domain;

import lombok.Data;

@Data
public class ExerciseTypeVO {//변수는 DB에 있는것과 맞춰서 작성하세요.

	private Long eno; // 운동종목번호
	private String ename; // 운동종목이름
	private Long emgr; // 상위운동종목번호
	private String ememo; // 운동 관련 메모

}
