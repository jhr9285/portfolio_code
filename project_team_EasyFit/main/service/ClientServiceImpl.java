package com.easyfit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.easyfit.domain.ClientVO;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.PTRecordVO;
import com.easyfit.domain.join.ClientJoinVO;
import com.easyfit.mapper.ClientMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClientServiceImpl implements ClientService {
	private ClientMapper clientMapper;
	
	@Override//회원 목록
	public List<ClientJoinVO> getList(Criteria cri, Long tno) {
		return clientMapper.list(cri, tno);
	}
	
	@Override//회원 수
	public long getCount(Criteria cri, long tno) {
		return clientMapper.count(cri, tno);
	}	
	
	@Override//모든 회원 목록
	//public List<ClientJoinVO> getAllList(Criteria cri, Long tno) {
	public List<ClientVO> getAllList(Criteria cri) {
		//return clientMapper.allList(cri, tno);
		return clientMapper.allList(cri);
	}

	@Override//모든 회원 수
	public long getAllCount(Criteria cri) {
		return clientMapper.allCount(cri);
	}

	@Override//회원 등록
	public void getRegisterSelectKey(ClientVO client) {
		log.info("getRegister");
		clientMapper.registerSelectKey(client);
	}
	
	@Override//회원 정보
	//public ClientJoinVO getGet(Long mno) {
	public ClientVO getGet(Long mno) {
		return clientMapper.get(mno);
	}

	@Override//회원 수정
	public void getModify(ClientVO client) {
		clientMapper.modify(client);
	}

	@Override//회원 삭제
	public void getRemove(Long mno) {
		clientMapper.remove(mno);
	}


	

	@Override//PT 목록
	public List<PTRecordVO> getPrList(Long mno, Long tno) { 
		return clientMapper.prList(mno, tno); 
	}
	
	@Override//PT 등록
	public long getPrRegister(PTRecordVO ptrecord) {
		log.info("getRegisterSelectKey success");
		return clientMapper.prRegister(ptrecord);
	}
	
	@Override//PT 정보
	public PTRecordVO getPrGet(Long prno) {
		//log.info("getPrGet : " + prno);
		System.out.println(prno);
		return clientMapper.prGet(prno);
	}
	
	@Override//PT 수정
	public long getPrModify(PTRecordVO ptrecord) {
		log.info("getPrModify : " + ptrecord);
		return clientMapper.prModify(ptrecord);
	}
	
	@Override//PT 삭제
	public long getPrRemove(Long prno) {
		log.info("getPrRemove : " + prno);
		//System.out.println(prno);
		return clientMapper.prRemove(prno);
	}
	
	
	@Override//스케쥴 등록
	public long getScheduleRegister(ExerciseRecordVO exerciseRecord) {
		log.info("getScheduleRegister");
		return clientMapper.scheduleRegister(exerciseRecord);
	}

}
