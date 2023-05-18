package com.easyfit.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.NoticeVO;
import com.easyfit.domain.PageDTO;
import com.easyfit.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/easyfit/*")
@AllArgsConstructor
public class NoticeController {
	
	
	private NoticeService noticeService;

	
	//목록
	@GetMapping("/noticeList")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", noticeService.getList(cri));
		
		long total = noticeService.getCount(cri);
		log.info(cri);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
	}
	
	//공지사항 작성
	@GetMapping("/noticeRegister")
	public void register(NoticeVO notice, Model model) {
		model.addAttribute("result", notice.getNno());
		log.info("getRegister");
	}
	
	
	//공지사항 작성
	@PostMapping("/noticeRegister")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		noticeService.getRegisterSelectKey(notice);		
		rttr.addFlashAttribute("result", notice.getNno());		
		return "redirect:/easyfit/noticeList";
	}
	
	
	//공지사항 조회
	@GetMapping({"/noticeGet", "/noticeModify"})
	public void get(@RequestParam("nno") Long nno, Model model) {
		log.info("get or modify : " + nno);
		model.addAttribute("notice", noticeService.getGet(nno));
	}
	
	
	
	//공지사항 수정
	@PostMapping("/noticeModify")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		log.info("modify : " + notice.getNno());
		
		noticeService.getModify(notice);
		
		rttr.addFlashAttribute("notice", notice.getNno());
		return "redirect:/easyfit/noticeList";

	}
	
	
	

	

	
	// 공지 삭제
	@GetMapping("/noticeRemove")
	public String noticeRemove(@RequestParam("nno") Long nno, Model model) {
		log.info("remove : ");
		noticeService.getRemove(nno);
		
		
		return "redirect:/easyfit/noticeList";

	}
}
