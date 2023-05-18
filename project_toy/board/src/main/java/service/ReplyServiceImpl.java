package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service // ServiceImpl 클래스 생성 시 반드시 입력해야 됨! 
@Log4j
@AllArgsConstructor // 이 키워드가 있으면 setter 입력하지 않아도 됨. 자동 주입!
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	private BoardMapper boardMapper;

	@Transactional // boardMapper.update~, mapper.insert 둘 중 하나만 실패해도 rollback 해주고, 둘 다 성공하면 commit 해주는 좋은 annotation
	@Override
	public int register(ReplyVO vo) {
		
		boardMapper.updateReplyCnt(vo.getBno(), 1); // 댓글수 1 증가
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		
		log.info("get......." + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify....." + vo);
		
		return mapper.update(vo);
	}
	
	@Transactional // boardMapper.update~, mapper.delete 둘 중 하나만 실패해도 rollback 해주고, 둘 다 성공하면 commit 해주는 좋은 annotation
	@Override
	public int remove(Long rno) {
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1); // 댓글수 1 감소
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
	
	
}
