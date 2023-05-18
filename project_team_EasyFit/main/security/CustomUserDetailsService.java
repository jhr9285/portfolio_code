package com.easyfit.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.easyfit.domain.TrainerVO;
import com.easyfit.mapper.LoginMapper;
import com.easyfit.security.domain.CustomUser;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class CustomUserDetailsService implements UserDetailsService{
	private LoginMapper loginMapper;	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		TrainerVO trainerVO = loginMapper.get(username);
		return trainerVO == null ? null : new CustomUser(trainerVO);
	}

}
