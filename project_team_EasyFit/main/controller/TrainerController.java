package com.easyfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.PageDTO;
import com.easyfit.domain.TrainerAuthVO;
import com.easyfit.domain.TrainerVO;
import com.easyfit.service.TrainerService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/easyfit/*")
public class TrainerController {
	private TrainerService trainerService;
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder bcrypt;
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/trainerList")//트레이너 목록
	public void list(Criteria cri, Model model) {
		long total = trainerService.getCount(cri);
		model.addAttribute("trainerList", trainerService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	@GetMapping({"/trainerGet", "/trainerModify"})//트레이너 정보, 트레이너 수정(GET)
	public void get(@RequestParam("tno") Long tno, Model model) {
		model.addAttribute("trainer", trainerService.getGet(tno));
		model.addAttribute("trList", trainerService.getTrList(tno));
	}
	
	@GetMapping("/trainerRegister")//트레이너 등록(GET)
	public void register(TrainerVO trainer, Model model) {
		model.addAttribute("result", trainer.getTno());
	}
	
	@PostMapping("/trainerRegister")//트레이너 등록(POST)
	public String register(TrainerVO trainer, TrainerAuthVO trainerAuth, RedirectAttributes rttr) {
		String bcryptPassword = bcrypt.encode(trainer.getTpassword());
		trainer.setTpassword(bcryptPassword);
		trainerService.getRegisterSelectKey(trainer);
		trainerService.getAuthRegister(trainerAuth);
		rttr.addFlashAttribute("result", trainer.getTno());
		return "redirect:/easyfit/trainerList";
	}
	
	@PostMapping("/trainerModify")//트레이너 수정(POST)
	public String modify(TrainerVO trainer, TrainerAuthVO trainerAuth, RedirectAttributes rttr) {
		trainerService.getAuthRemove(trainer.getTno());
		trainerService.getModify(trainer);
		trainerService.getAuthRegister(trainerAuth);
		rttr.addFlashAttribute("trainer", trainer.getTno());
		return "redirect:/easyfit/trainerList";
	}
	
	@GetMapping("/trainerRemove")//트레이이너 권한 수정
	public String remove(Long tno, Model model) {
		trainerService.getAuthModify(tno);
		return "redirect:/easyfit/trainerList";
	}
	

	
}
