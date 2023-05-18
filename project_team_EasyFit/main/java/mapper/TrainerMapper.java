package com.easyfit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerAuthVO;
import com.easyfit.domain.TrainerVO;
import com.easyfit.domain.join.LessonJoinVO;
import com.easyfit.domain.join.TrainerJoinVO;

public interface TrainerMapper {
	public List<TrainerJoinVO> list(@Param("cri") Criteria cri);
	public long count(@Param("cri") Criteria cri);
	public TrainerVO get(Long tno);
	public void registerSelectKey(TrainerVO trainer);
	public void modify(TrainerVO trainer);
	
	public void authRegister(TrainerAuthVO trainerAuth);
	public void authRemove(long tno);
	public void authModify(long tno);
	
	// 담당트레이너의 회원 목록
	public List<LessonJoinVO> trList(Long tno);
}
