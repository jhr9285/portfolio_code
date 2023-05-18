package com.easyfit.service;

import com.easyfit.domain.ReplyCriteria;
import com.easyfit.domain.ReplyPageDTO;
import com.easyfit.domain.ReplyVO;
import com.easyfit.domain.join.ReplyJoinVO;

public interface ReplyService {
	public Long register(ReplyVO vo);

	public ReplyJoinVO get(Long rno);

	public Long modify(ReplyVO vo);

	public Long remove(Long rno);

//	public List<ReplyVO> getList(Criteria cri, Long tbno);
	
	public ReplyPageDTO getListPage(ReplyCriteria cri, Long tbno);
}
