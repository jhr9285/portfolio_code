package com.mycom.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.domain.Criteria;
import com.mycom.domain.ToDoListVO;
import com.mycom.mapper.ToDoListMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ToDoListServiceImpl implements ToDoListService {
	
	private ToDoListMapper mapper;

	@Override
	public void write(ToDoListVO vo) {
		
		log.info("register............." + vo);
		
		mapper.insertSelectKey(vo);
	}

	@Override
	public ToDoListVO get(Long no) {
		
		log.info("get : " + no);
		
		return mapper.read(no);
	}

	@Override
	public boolean modify(ToDoListVO vo) {
		
		log.info("modify : " + vo);
		
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long no) {
		
		log.info("remove : " + no);
		
		return mapper.delete(no) == 1;
	}

//	@Override // 목록보기 - 페이징 처리 X
//	public List<ToDoListVO> getList() {
//		
//		log.info("getList............");
//		
//		return mapper.getList();
//	}
	
	@Override
	public List<ToDoListVO> getList(Criteria cri) {
		
		log.info("get List with criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}
	
}
