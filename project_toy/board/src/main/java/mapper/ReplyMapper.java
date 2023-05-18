package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ReplyVO reply);
	
	// mapper interface에는 파라미터가 2개 이상일 때는 @ Param("~") 을 무조건 써야 된다. (mybatis 문법)
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno); // 댓글 목록 페이징 처리
	
	public int getCountByBno(Long bno); // 댓글 조회수
	
}
