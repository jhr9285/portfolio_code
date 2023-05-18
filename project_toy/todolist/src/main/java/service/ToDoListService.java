package com.mycom.service;

import java.util.List;

import com.mycom.domain.Criteria;
import com.mycom.domain.ToDoListVO;

public interface ToDoListService {
	
	public void write(ToDoListVO vo);
	
	public ToDoListVO get(Long no);
	
	public boolean modify(ToDoListVO vo);
	
	public boolean remove(Long no);
	
	//public List<ToDoListVO> getList(); // 페이징 처리 없이 목록 구하는 메소드
	
	public List<ToDoListVO> getList(Criteria cri); // 페이징 처리 하여 목록 구하는 메소드
	
	public int getTotal(Criteria cri);
}
