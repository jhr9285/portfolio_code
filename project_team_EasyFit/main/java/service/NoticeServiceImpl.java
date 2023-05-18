package com.easyfit.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;
import com.easyfit.domain.NoticeVO;
import com.easyfit.domain.join.NoticeJoinVO;
import com.easyfit.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeMapper noticeMapper;

	//공지사항 목록
	@Override
	public List<NoticeJoinVO> getList(Criteria cri) {
		log.info("noticeGet");
		return noticeMapper.list(cri);
	}
	
	//글 세기
	@Override
	public long getCount(Criteria cri) {
		return noticeMapper.count(cri);
	}
	//공지사항 상세보기
	@Override
	public NoticeJoinVO getGet(Long nno) {
		System.out.println(nno);
		return noticeMapper.get(nno);
	}

	
	//새로운 공지사항 등록
	@Override
	public void getRegisterSelectKey(NoticeVO notice) {
		log.info("noticeRegister");
		noticeMapper.registerSelectKey(notice);
		
		
	}
	
	//공지내용 삭제
	@Override
	public void getRemove(Long nno) {
		log.info("Delete");
		noticeMapper.remove(nno);
		
	}

	
	
	//공지사항 수정
	@Override
	public void getModify(NoticeVO notice) {
		log.info("getModify");
		noticeMapper.modify(notice);
	}


}
