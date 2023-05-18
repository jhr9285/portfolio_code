package com.easyfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;

import com.easyfit.domain.PageDTO;
import com.easyfit.domain.TrainerBoardVO;

import com.easyfit.service.TrainerBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/easyfit/*")
@AllArgsConstructor
public class TrainerBoardController {
	
	
	private TrainerBoardService trainerBoardService;

	
	//목록
	@GetMapping("/trainerBoardList")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", trainerBoardService.getList(cri));
		
		long total = trainerBoardService.getCount(cri);
		log.info(cri);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
	}
	
	//공지사항 작성
	@GetMapping("/trainerBoardRegister")
	public void register() {
		log.info("getRegister");
	}
	
	
	//공지사항 작성
	@PostMapping("/trainerBoardRegister")
	public String register(TrainerBoardVO trainerboard,RedirectAttributes rttr) {
		log.info("register : " + trainerboard.getTbno());

		trainerBoardService.getRegister(trainerboard);
		
		rttr.addFlashAttribute("result", trainerboard.getTbno());
		
		return "redirect:/easyfit/trainerBoardList?tno="+trainerboard.getTno();
	}
	
	
	//공지사항 조회
	@GetMapping({"/trainerBoardGet", "/trainerBoardModify"})
	public void get(@RequestParam("tbno") Long tbno, Model model) {
		log.info("get or modify" + tbno);
		model.addAttribute("trainerboard", trainerBoardService.getGet(tbno));
	}
	
	
	
	//공지사항 수정
	@PostMapping("/trainerBoardModify")
	public String modify(TrainerBoardVO trainerboard, RedirectAttributes rttr) {
		log.info("modify : " + trainerboard.getTbno());
		
		trainerBoardService.getModify(trainerboard);
		
		rttr.addFlashAttribute("trainerboard", trainerboard.getTbno());
		return "redirect:/easyfit/trainerBoardGet?tbno="+trainerboard.getTbno();

	}
	
	
	

	

	
	// 공지 삭제
	@PostMapping("/trainerBoardRemove")
	public String trainerBoardRemove(@RequestParam("tbno") Long tbno, Model model) {
		log.info("remove : ");
		trainerBoardService.getRemove(tbno);
		
		
		return "redirect:/easyfit/trainerBoardList";

	}
}
