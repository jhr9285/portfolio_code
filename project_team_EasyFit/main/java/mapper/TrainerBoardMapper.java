package com.easyfit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerBoardVO;
import com.easyfit.domain.join.TrainerBoardJoinVO;

public interface TrainerBoardMapper {
	
	//공지사항 목록
	public List<TrainerBoardJoinVO> list(Criteria cri);
	
	//글 세기
	public long count(Criteria cri);
	
	//공지사항 상세보기
	public TrainerBoardJoinVO get(Long tbno);


	//공지 입력
	public int register(@Param("trainerboard") TrainerBoardVO trainerboard, @Param("tid") String tid);

	//공지사항 수정
	public void modify(@Param("trainerboard") TrainerBoardVO trainerboard, @Param("tid") String tid);

	//공지사항 삭제
	public void remove(@Param("tbno") Long tbno, @Param("tid") String tid);

}
