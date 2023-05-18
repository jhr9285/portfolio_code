package com.easyfit.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerBoardVO;
import com.easyfit.domain.join.TrainerBoardJoinVO;
import com.easyfit.mapper.TrainerBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TrainerBoardServiceImpl implements TrainerBoardService {
	
	private TrainerBoardMapper trainerBoardMapper;

	//공지사항 목록
	@Override
	public List<TrainerBoardJoinVO> getList(Criteria cri) {
		log.info("trainerBoardGet");
		return trainerBoardMapper.list(cri);
	}

	
	//글 세기
	@Override
	public long getCount(Criteria cri) {
		return trainerBoardMapper.count(cri);
	}
	//공지사항 상세보기
	@Override
	public TrainerBoardJoinVO getGet(Long tbno) {
		return trainerBoardMapper.get(tbno);
	}

	
	//새로운 공지사항 등록
	@Override
	public void getRegister(TrainerBoardVO trainerboard) {
		log.info("trainerBoardRegister");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		
		trainerBoardMapper.register(trainerboard, tid);
		
		
	}
	
	//공지내용 삭제
	@Override
	public void getRemove(Long tbno) {
		log.info("Delete");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		trainerBoardMapper.remove(tbno, tid);
		
	}

	
	
	//공지사항 수정
	@Override
	public void getModify(TrainerBoardVO trainerboard) {
		log.info("getModify");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		trainerBoardMapper.modify(trainerboard, tid);
	}


}
