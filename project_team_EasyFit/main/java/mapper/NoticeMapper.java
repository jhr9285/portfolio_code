package com.easyfit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;
import com.easyfit.domain.NoticeVO;
import com.easyfit.domain.join.NoticeJoinVO;

public interface NoticeMapper {
	
	//공지사항 목록
	public List<NoticeJoinVO> list(Criteria cri);
	
	
	//글 세기
	public long count(Criteria cri);
	
	//공지사항 상세보기
	public NoticeJoinVO get(Long nno);

	//공지 등록
	public void registerSelectKey(NoticeVO notice);

	//공지사항 수정
	public void modify(NoticeVO notice);

	//공지사항 삭제
	public void remove(Long nno);

}
