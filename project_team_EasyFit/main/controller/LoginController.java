package com.easyfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyfit.domain.join.LoginJoinVO;
import com.easyfit.service.LoginService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
public class LoginController {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	// trainerPage 월별 PT 현황 막대 그래프 출력에 활용(JHR)
	@Setter(onMethod_ = @Autowired)
	private LoginService loginService;
	

	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호를 잘못 입력했습니다.");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {}
	
	@PostMapping("/customLogout")
	public void logoutPost() {}
	

	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("message", "접근 불가.");
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/adminPage")
	public void loginAdmin() {
	}
	
	@GetMapping("/trainerPage")
	public void loginTrainer(LoginJoinVO vo, Model model) {		
		//trainerPage 월별 PT 현황 막대 그래프 출력 (JHR)
		log.info("trainerPage(get)");
		model.addAttribute("monthlyPT", loginService.getPrCountSum(vo));
	}
	
	@ResponseBody
	@PostMapping(value = "/trainerPage", consumes="application/json")
	public Long[] loginTrainer2(@RequestBody LoginJoinVO vo, @RequestParam("tid") String tid, Model model) {		
		// trainerPage 월별 PT 현황 막대 그래프 출력 (JHR)
		log.info("trainerPage(post) : " + vo.getPrcountSum());
		
		Long[] prcountSumList = new Long[2];
		
		for(int i = 0; i < 2; i++) {
			
			prcountSumList[i] = vo.getPrcountSum();
		}		
		return prcountSumList;
	}
	
	@GetMapping("/trainerSample")
	public void loginSample() {		
	}
	
	
}
	
	
	
