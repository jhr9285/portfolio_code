package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper { // BoardMapper.xml 파일의 id 값과 동일한 이름으로 메소드 생성
	
	public List<BoardVO> getList();  // 페이징 처리 없이 목록 구하는 메소드
	
	public List<BoardVO> getListWithPaging(Criteria cri); // 페이징 처리 하여 목록 구하는 메소드
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
