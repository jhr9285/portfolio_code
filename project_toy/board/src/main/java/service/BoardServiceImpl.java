package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // ★ xxxServiceImpl 클래스 만들 때 @Service를 반드시 붙여야 된다!! (없으면 500번 에러 발생)
@AllArgsConstructor // <== 이걸 붙이면 BoardMapper를 자동주입할 수 있다.
public class BoardServiceImpl implements BoardService {
	// 서비스 상속하는 클래스는 xxxSerciveImpl 이라고 네이밍한다.
	
	private BoardMapper mapper;
	private BoardAttachMapper attachMapper; // 첨부파일 맵퍼 추가

	// BoardService 인터페이스의 추상메소드 모두 오버라이딩
	
	@Transactional // 트랜잭션 하에 여러 개의 첨부파일 정보도 DB에 저장. 32행, 43행이 모두 이상 없어야 실행
	@Override // 등록하기
	public void register(BoardVO board) {
		
		log.info("register............." + board);
		
		mapper.insertSelectKey(board);
		
		// 첨부파일이 없으면 중지하는 코드
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		// board.getAttachList() ==> return List<BoardAttachVO>
		// 람다식 - attach = function(attach){..} ==> List에서 BoardAttachVO를 하나씩 꺼내서 attach에 담는다.
		board.getAttachList().forEach(attach -> {
			
			attach.setBno(board.getBno()); // 부모글 번호
			attachMapper.insert(attach);
		});
	}

	@Override // 상세보기
	public BoardVO get(Long bno) {
		
		log.info("get.........." + bno);
		
		return mapper.read(bno);
	}

	@Transactional
	@Override // 수정하기
	public boolean modify(BoardVO board) {
		
		log.info("modify.........." + board);
		
		attachMapper.deleteAll(board.getBno()); // 첨부파일을 일단 다 지운다
		
		boolean modifyResult = mapper.update(board) == 1; // 업데이트 영향받은 행의 수가 1이면 true => true를 modifyResult에 담음
		
		if(!modifyResult || board.getAttachList() == null) { // 영향받은 행이 없으면
			return modifyResult; // true 반환 (첨부파일이 없어도 1로 지정)
		}
		
		if (board.getAttachList().size() > 0) { // 첨부파일 갯수가 1개 이상이면 (0일 때도 1로 지정해둠)
			
			board.getAttachList().forEach(attach -> { // 람다식 - attachList 데이터를 attach에 하나씩 담음
				attach.setBno(board.getBno()); // attach의 bno를 불러온 board의 bno로 수정
				attachMapper.insert(attach); // 첨부파일 맵퍼에 다시 입력
			});
		}
		
		// return mapper.update(board) == 1; // 영향받은 행의 수가 1 ==> 1 = 1 이면 true 반환
		return modifyResult;
	}

	@Transactional // 게시글과 첨부파일 중 하나라도 정상적으로 삭제되지 않으면 트랜잭션 처리 X
	@Override // 삭제하기
	public boolean remove(Long bno) {
		
		log.info("remove...." + bno);
		
		attachMapper.deleteAll(bno) ; // 첨부파일도 삭제
		
		return mapper.delete(bno) == 1; // 영향받은 행의 수가 1 ==> 1 = 1 이면 true 반환
	}
	
//	@Override // 목록보기 - 페이징 처리 X
//	public List<BoardVO> getList() {
//		
//		log.info("getList............");
//		
//		return mapper.getList();
//	}
	
	@Override // 목록보기 - 페이징 처리 O
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override // 총 데이터 갯수 구하기
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

	@Override // 첨부파일 목록 구하기
	public List<BoardAttachVO> getAttachList(Long bno) { // 매개변수 : 부모글 번호
		
		log.info("get Attach List by bno" + attachMapper.findByBno(bno));
		
		return attachMapper.findByBno(bno);
	}
	
	
	
	
}
