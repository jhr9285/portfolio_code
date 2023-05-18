package com.easyfit.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.easyfit.domain.join.LoginJoinVO;
import com.easyfit.mapper.LoginMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	
	private LoginMapper loginMapper;

	@Override
	public List<LoginJoinVO> getPrCountSum(LoginJoinVO vo) {
		
		log.info("get prcount sum : " + vo);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		
		return loginMapper.prCountSum(tid);
	}

}
