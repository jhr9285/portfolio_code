package com.easyfit.service;

import java.util.List;

import com.easyfit.domain.ClientVO;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.PTRecordVO;
import com.easyfit.domain.join.ClientJoinVO;

public interface ClientService {//변수앞에 get을 붙여서 카멜표기법을 사용합니다.	
	//회원 목록
	public List<ClientJoinVO> getList(Criteria cri, Long tno);
	//회원 수
	public long getCount(Criteria cri, long tno);
	//모든 회원 목록
	//public List<ClientJoinVO> getAllList(Criteria cri, Long tno);
	public List<ClientVO> getAllList(Criteria cri);
	//모든 회원 수
	public long getAllCount(Criteria Cri);
	
	
	
	//회원 등록
	public void getRegisterSelectKey(ClientVO client);	
	//회원 정보
	//public ClientJoinVO getGet(Long mno);
	public ClientVO getGet(Long mno);
	//회원 수정
	public void getModify(ClientVO client);	
	//회원 삭제
	public void getRemove(Long mno);
	
	
	//PT 목록
	public List<PTRecordVO> getPrList(Long mno, Long tno);	
	//PT 등록
	public long getPrRegister(PTRecordVO ptrecord);
	// PT 상세보기
	public PTRecordVO getPrGet(Long prno);
	// PT 수정하기
	public long getPrModify(PTRecordVO ptrecord);
	// PT 삭제하기
	public long getPrRemove(Long prno);
	
	// 스케쥴 등록
	public long getScheduleRegister(ExerciseRecordVO exerciseRecord);
}
