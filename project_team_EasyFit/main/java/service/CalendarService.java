package com.easyfit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.easyfit.domain.ClientVO;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.mapper.CalendarMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class CalendarService {
	@Autowired
	private CalendarMapper calendarMapper;
	//일정 목록
	public List<Map<String, Object>> list() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		return calendarMapper.list(tid);
	}
	
	//일정 등록
	public int register(ExerciseRecordVO exerciseRecord, String mname) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		log.info(exerciseRecord);
		log.info("######## : " + mname);

		return calendarMapper.register(exerciseRecord, tid, mname);
	}
	
	//#{tid}의 회원 목록
	public List<String> mnameList(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		return calendarMapper.mnameList(tid);
	}

	public boolean getPrcountUpdate(String mname) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		return calendarMapper.prcountUpdate(mname, tid) == 1;
	}
	
	public List<Map<String, Object>> chartData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		return calendarMapper.chartData(tid);
	}
	
	public List<Map<String, Object>> smallNotice(){
		return calendarMapper.smallNotice();
	}
	
	public List<Map<String, Object>> log(){
		return calendarMapper.log();
	}
	
	public List<Map<String, Object>> totalPTData(){
		return calendarMapper.totalPTData();
	}
}
