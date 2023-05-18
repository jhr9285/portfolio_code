package com.mycom.mapper;

import java.util.List;

import com.mycom.domain.Criteria;
import com.mycom.domain.ToDoListVO;

public interface ToDoListMapper { // Mapper.interface에 Mapper.xml 파일의 id 값과 동일한 이름으로 메소드 생성

	public List<ToDoListVO> getList(); // 페이징 처리 없이 목록 구하는 메소드
	
	public List<ToDoListVO> getListWithPaging(Criteria cri);  // 페이징 처리 하여 목록 구하는 메소드
	
	public void insert(ToDoListVO vo);
	
	public void insertSelectKey(ToDoListVO vo);
	
	public ToDoListVO read(Long no);
	
	public int delete(Long no);
	
	public int update(ToDoListVO vo);
	
	public int getTotalCount(Criteria cri);
	
}
