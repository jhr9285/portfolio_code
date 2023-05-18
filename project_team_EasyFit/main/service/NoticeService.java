package com.easyfit.service;

import java.util.List;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;
import com.easyfit.domain.NoticeVO;
import com.easyfit.domain.join.NoticeJoinVO;

public interface NoticeService {//변수앞에 get을 붙여서 카멜표기법을 사용합니다.

	
	//공지사항 목록
	public List<NoticeJoinVO> getList(Criteria cri);
	
	//글 수
	public long getCount(Criteria cri);

	//공지사항 등록
	public void getRegisterSelectKey(NoticeVO notice);

	//공지사항 상세보기
	public NoticeJoinVO getGet(Long nno);

	//공지사항 수정
	public void getModify(NoticeVO notice);

	//공지사항 삭제
	public void getRemove(Long nno);



}
