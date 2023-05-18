package com.easyfit.service;

import java.util.List;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerBoardVO;
import com.easyfit.domain.join.TrainerBoardJoinVO;

public interface TrainerBoardService {//변수앞에 get을 붙여서 카멜표기법을 사용합니다.

	
	//공지사항 목록
	public List<TrainerBoardJoinVO> getList(Criteria cri);
	
	//글 수
	public long getCount(Criteria cri);

	//공지사항 등록
	public void getRegister(TrainerBoardVO trainerboard);

	//공지사항 상세보기
	public TrainerBoardJoinVO getGet(Long tbno);

	//공지사항 수정
	public void getModify(TrainerBoardVO trainerboard);

	//공지사항 삭제
	public void getRemove(Long tbno);



}
