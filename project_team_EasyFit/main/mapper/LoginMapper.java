package com.easyfit.mapper;

import java.util.List;

import com.easyfit.domain.TrainerVO;
import com.easyfit.domain.join.LoginJoinVO;

public interface LoginMapper {
	
	public TrainerVO get(String tid);
	
	// trainerPage 월별 PT 현황 막대 그래프 출력 (JHR)
	public List<LoginJoinVO> prCountSum(String tid);
}
