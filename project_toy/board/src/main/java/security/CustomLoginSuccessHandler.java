package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication auth) throws IOException, ServletException {
		
		log.warn("Login Success");
		
		// 이하 내용은 필수가 아니라 선택임(optional)
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> { // 권한(admin, manager 등)을 하나씩 꺼내서 authority에 넣음
			
			roleNames.add(authority.getAuthority()); // 로그인 user의 권한을 구함
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		// roleName이 ROLE_ADMIN이면 /sample/admin (관리자 페이지)으로 이동
		if(roleNames.contains("ROLE_ADMIN")) { 
			
			response.sendRedirect("/sample/admin");
			return;
		}
		
		// roleName이 ROLE_MANAGER이면 /sample/member (회원 페이지)으로 이동
		if(roleNames.contains("ROLE_MANAGER")) {
			
			response.sendRedirect("/sample/member");
			return;
		}
		
		response.sendRedirect("/");
	}
}
