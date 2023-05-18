package com.easyfit.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.ReplyCriteria;
import com.easyfit.domain.ReplyVO;
import com.easyfit.domain.join.ReplyJoinVO;

public interface ReplyMapper {
	//등록
	public Long insert(ReplyVO vo);
	//상세보기
	public ReplyJoinVO read(Long tbno);
	//삭제
	public Long delete(Long tbno);
	//수정
	public Long update(ReplyVO reply);
	//목록
	public List<ReplyJoinVO> getListWithPaging(@Param("cri") ReplyCriteria cri, @Param("tbno") Long tbno);
	//댓글갯수
	public int getCountByTbno(Long tbno);
	
}
