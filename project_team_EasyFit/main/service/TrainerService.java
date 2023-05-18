package com.easyfit.service;

import java.util.List;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerAuthVO;
import com.easyfit.domain.TrainerVO;
import com.easyfit.domain.join.LessonJoinVO;
import com.easyfit.domain.join.TrainerJoinVO;

public interface TrainerService {//get 앞에 붙이기
	public List<TrainerJoinVO> getList(Criteria cri);
	public long getCount(Criteria cri);
	public TrainerVO getGet(Long tno);
	public void getRegisterSelectKey(TrainerVO trainer);
	public void getModify(TrainerVO trainer);
	
	public void getAuthRegister(TrainerAuthVO trainerAuth);
	public void getAuthRemove(long tno);
	public void getAuthModify(long tno);

	// 담당트레이너의 회원 목록
	public List<LessonJoinVO> getTrList(Long tno);
}
