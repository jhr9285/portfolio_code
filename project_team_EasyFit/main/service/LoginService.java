package com.easyfit.service;

import java.util.List;

import com.easyfit.domain.join.LoginJoinVO;

public interface LoginService {
	

	// trainerPage 월별 PT 현황 막대 그래프 출력 (JHR)
	public List<LoginJoinVO> getPrCountSum(LoginJoinVO vo);

}
