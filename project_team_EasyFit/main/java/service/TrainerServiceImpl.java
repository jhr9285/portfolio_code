package com.easyfit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerAuthVO;
import com.easyfit.domain.TrainerVO;
import com.easyfit.domain.join.LessonJoinVO;
import com.easyfit.domain.join.TrainerJoinVO;
import com.easyfit.mapper.TrainerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class TrainerServiceImpl implements TrainerService {
	private TrainerMapper trainerMapper;

	@Override
	public List<TrainerJoinVO> getList(Criteria cri) {
		return trainerMapper.list(cri);
	}
	@Override
	public long getCount(Criteria cri) {
		return trainerMapper.count(cri);
	}
	@Override
	public TrainerVO getGet(Long tno) {
		return trainerMapper.get(tno);
	}
	@Override
	public void getRegisterSelectKey(TrainerVO trainer) {
		trainerMapper.registerSelectKey(trainer);		
	}
	@Override
	public void getModify(TrainerVO trainer) {
		trainerMapper.modify(trainer);		
	}

	@Override
	public void getAuthRegister(TrainerAuthVO trainerAuth) {
		trainerMapper.authRegister(trainerAuth);		
	}
	@Override
	public void getAuthRemove(long tno) {
		trainerMapper.authRemove(tno);
	}
	@Override
	public void getAuthModify(long tno) {
		trainerMapper.authModify(tno);
		
	}
	// 담당트레이너 회원 목록
	@Override
	public List<LessonJoinVO> getTrList(Long tno) {
		return trainerMapper.trList(tno);
	}
}
