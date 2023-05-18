package com.easyfit.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.easyfit.domain.TrainerVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1;
	private TrainerVO trainerVO;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	public CustomUser(TrainerVO vo) {
		super(vo.getTid(), vo.getTpassword(), vo.getTrainerAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.trainerVO = vo;
	}
}
