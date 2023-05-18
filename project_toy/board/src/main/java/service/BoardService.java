package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	// public List<BoardVO> getList(); // 페이징 처리 없이 목록 구하는 메소드

	public List<BoardVO> getList(Criteria cri); // 페이징 처리 하여 목록 구하는 메소드
	
	public int getTotal(Criteria cri);
	
	
	// 첨부파일 관련
	public List<BoardAttachVO> getAttachList(Long bno);
}
