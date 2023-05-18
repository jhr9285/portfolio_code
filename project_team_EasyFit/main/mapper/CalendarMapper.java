package com.easyfit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.ClientVO;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.NoticeVO;
@Mapper
public interface CalendarMapper {
	//일정 목록
	public List<Map<String, Object>> list(@Param("tid") String tid);
	//일정 등록
	public int register(@Param("exerciseRecord") ExerciseRecordVO exerciseRecord, @Param("tid") String tid, @Param("mname") String mname);
	//#{tid}의 회원 목록
	public List<String> mnameList(@Param("tid") String tid);
	//prcount 증/감
	public long prcountUpdate(@Param("mname") String mname, @Param("tid") String tid);
	//chartData
	public List<Map<String, Object>> chartData(@Param("tid") String tid);
	//smallNotice
	public List<Map<String, Object>> smallNotice();
	//log
	public List<Map<String, Object>> log();
	//totalPTData
	public List<Map<String, Object>> totalPTData();
}
