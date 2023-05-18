package com.easyfit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.ClientVO;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.PTRecordVO;
import com.easyfit.domain.join.ClientJoinVO;

public interface ClientMapper {
	//회원 목록
	public List<ClientJoinVO> list(@Param("cri") Criteria cri, @Param("tno") long tno);
	//회원 수
	public long count(@Param("cri") Criteria cri, @Param("tno") long tno);
	
	//모든 회원 목록
	public List<ClientVO> allList(@Param("cri") Criteria cri);
	//모든 회원 수
	public long allCount(@Param("cri") Criteria cri);		
	
	//회원 등록
	public void registerSelectKey(ClientVO client);		
	//회원 정보
	//public ClientJoinVO get(Long mno);
	public ClientVO get(Long mno);
	//회원 수정
	public void modify(ClientVO client);
	//회원 삭제
	public void remove(Long mno);
	
	//PT 목록
	public List<PTRecordVO> prList(@Param("mno") long mno, @Param("tno") long tno);	
	//PT 등록
	public long prRegister(PTRecordVO ptrecord);	
	// PT 상세보기
	public PTRecordVO prGet(Long prno);
	// PT 수정하기
	public long prModify(PTRecordVO ptrecord);
	// PT 삭제하기
	public long prRemove(Long prno);

	// 스케쥴 등록
	public 	long scheduleRegister(ExerciseRecordVO exerciseRecord);
	
	

}
