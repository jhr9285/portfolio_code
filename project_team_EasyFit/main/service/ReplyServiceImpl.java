package com.easyfit.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyfit.domain.ReplyCriteria;
import com.easyfit.domain.ReplyPageDTO;
import com.easyfit.domain.ReplyVO;
import com.easyfit.domain.join.ReplyJoinVO;
import com.easyfit.mapper.ReplyMapper;
import com.easyfit.mapper.TrainerBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {	

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private TrainerBoardMapper trainerboardMapper;

	@Transactional
	@Override
	public Long register(ReplyVO vo) {

		return mapper.insert(vo);

	}

	@Override
	public ReplyPageDTO getListPage(ReplyCriteria cri, Long tbno) {
		return new ReplyPageDTO(mapper.getCountByTbno(tbno), mapper.getListWithPaging(cri, tbno));
	}

	@Override
	public ReplyJoinVO get(Long rno) {
		return mapper.read(rno);
	}
	 
	@Override
	public Long modify(ReplyVO vo) {

		log.info("modify......" + vo);

		return mapper.update(vo);

	} 
	
	@Transactional
	@Override
	public Long remove(Long rno) {
		

	
		return mapper.delete(rno);

	}
	 


}
