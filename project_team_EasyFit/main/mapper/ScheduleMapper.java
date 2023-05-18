package com.easyfit.mapper;

import java.util.ArrayList;

import com.easyfit.domain.DateData;
import com.easyfit.domain.ScheduleVO;

public interface ScheduleMapper {
	
	public int register(ScheduleVO schedule);
	public int before_schedule_add_search(ScheduleVO schedule);
	public ArrayList<ScheduleVO> list(DateData dateData);
	
	/* 수정, 삭제를 위한 리스트 불러오기 */
	/* 조회하기 */
	public ScheduleVO get(int idx);
	
	/* 수정하기 */
	public int update(ScheduleVO schedule);
	
	/* 삭제하기 */
	public int remove(ScheduleVO schedule);
	

}
