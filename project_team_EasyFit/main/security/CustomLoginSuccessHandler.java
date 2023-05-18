package com.easyfit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		//ADMIN일 경우 관리자 페이지로 이동
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/adminPage");
			return;
		}
		if(roleNames.contains("ROLE_MANAGER")) {
			response.sendRedirect("/trainerPage");
		}
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/accessError");
		}	
	}
}
