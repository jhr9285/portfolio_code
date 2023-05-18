package com.mycom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycom.domain.Criteria;
import com.mycom.domain.PageDTO;
import com.mycom.domain.ToDoListVO;
import com.mycom.service.ToDoListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/todolist/*")
@Log4j
@AllArgsConstructor
public class ToDoListController {
	
	private ToDoListService service; // ★@AllArgsConstructor 가 ToDoListService 주입
	
	@GetMapping("")
	public void home() {}
	
	// 목록보기 - 페이징 처리 X
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}

	// 목록보기 - 페이징 처리 O
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("list: " + cri);
		
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		// PageDTO에 총 글 갯수 전달 ==> PageDTO에서 계산한 데이터를 pageMaker 라는 이름으로 list에 전송
	}
	
	@GetMapping("/write")
	public void writer() {}
	
	@PostMapping("/write")
	public String write(ToDoListVO vo, RedirectAttributes rttr) {
		
		log.info("write : " + vo);
		service.write(vo);
		rttr.addFlashAttribute("result", vo.getNo());
		
		return "redirect:/todolist/list";
	}
	
	// get과 modify가 get은 service의 get을 동일하게 사용하기 때문에 같이 코딩
	@GetMapping({"/get", "/modify"})
	public void get(Long no, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("get or modify : " + cri);
		
		model.addAttribute("vo", service.get(no));
		// bno로 service 호출, service는 mapper 호출, mapper는 interface -> xml 순으로 적용
	}
	
	@PostMapping("/modify")
	public String modify(ToDoListVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify : " + vo);
		
		if(service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("no", vo.getNo());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		
		return "redirect:/todolist/get";
	}
	
	@PostMapping("/remove")
	public String remove(Long no, RedirectAttributes rttr) {
		
		log.info("delete : " + no);
		
		if(service.remove(no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/todolist/list";
	}

}
