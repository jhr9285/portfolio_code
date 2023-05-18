package com.easyfit.domain;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ScheduleVO {
	
	int schedule_idx;
	int schedule_num;
	String schedule_subject;
	String schedule_desc;
	Date schedule_date;
	
	//---------------
	String schedule_share;
	String schedule_mycolor;
	
	@Override
	public String toString() {
		return "ScheduleVO [schedule_idx=" + schedule_idx + ", schedule_num=" + schedule_num + ", schedule_subject="
				+ schedule_subject + ", schedule_desc=" + schedule_desc + ", schedule_date=" + schedule_date + ", schedule_share="+schedule_share
				+", schedule_mycolor="+schedule_mycolor +"]";
	}
}
