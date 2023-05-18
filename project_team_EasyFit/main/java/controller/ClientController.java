package com.easyfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.ClientVO;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.PTRecordVO;
import com.easyfit.domain.PageDTO;
import com.easyfit.service.ClientService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/easyfit/*")
public class ClientController {
	private ClientService clientService;	
	
	@GetMapping("/clientList")//회원 목록	
	public void list(Criteria cri, Long tno, Model model) {
		long total = clientService.getCount(cri, tno);
		model.addAttribute("list", clientService.getList(cri, tno));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	} 

	@GetMapping("/clientRegister")//회원 등록(GET)
	public void register(ClientVO client, Model model) {
		model.addAttribute("result", client.getMno());
	}
	
	@PostMapping("/clientRegister")//회원 등록(POST)
	public String register(ClientVO client, long tno, RedirectAttributes rttr) {
		clientService.getRegisterSelectKey(client);
		rttr.addFlashAttribute("result", client.getMno());
		return "redirect:/easyfit/clientList?tno="+tno;
	}
	
	@GetMapping("/clientGet")//회원 정보, 회원 수정(GET), PT 목록
	public void get(@RequestParam("mno") Long mno, PTRecordVO ptRecord, Model model, Long tno) {
		model.addAttribute("client", clientService.getGet(mno));
		model.addAttribute("ptRecordList", clientService.getPrList(mno, tno));
	}
	
	@GetMapping("/clientModify")//회원 정보, 회원 수정(GET), PT 목록
	public void get(@RequestParam("mno") Long mno, Model model) {
		model.addAttribute("client", clientService.getGet(mno));
	}
	
	@PostMapping("/clientModify")//회원 수정(POST)
	public String modify(ClientVO client, Long tno, RedirectAttributes rttr) {
		clientService.getModify(client);
		rttr.addFlashAttribute("client", client.getMno());
		return "redirect:/easyfit/clientList?tno="+tno;
	}
	
	@GetMapping("/clientRemove")//회원 삭제
	public String remove(@RequestParam("mno") Long mno, Long tno, Model model) {
		clientService.getRemove(mno);
		return "redirect:/easyfit/clientList?tno="+tno;
	}
	
	
	@GetMapping("/allClientList")//전체 회원 목록	
	public void allList(Criteria cri, Model model) {
		long total = clientService.getAllCount(cri);
		model.addAttribute("allList", clientService.getAllList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}	
	
	@GetMapping("/allClientRegister")//전체 회원 등록(GET)
	public void allRegister(ClientVO client, Model model) {
		model.addAttribute("result", client.getMno());
	}
	
	@PostMapping("/allClientRegister")//전체 회원 등록(POST)
	public String allRegister(ClientVO client, RedirectAttributes rttr) {
		clientService.getRegisterSelectKey(client);
		rttr.addFlashAttribute("result", client.getMno());
		return "redirect:/easyfit/allClientList";
	}
	
	@GetMapping("/allClientGet")//회원 정보, PT 목록
	public void allGet(@RequestParam("mno") Long mno, PTRecordVO ptRecord, Model model, Long tno) {
		model.addAttribute("client", clientService.getGet(mno));
		model.addAttribute("ptRecordList", clientService.getPrList(mno, tno));
	}
	
	@GetMapping("/allClientModify")//회원 정보, 회원 수정(GET), PT 목록
	public void allGet(@RequestParam("mno") Long mno, Model model) {
		model.addAttribute("client", clientService.getGet(mno));
	}
	
	@PostMapping("/allClientModify")//회원 수정(POST)
	public String allModify(ClientVO client, RedirectAttributes rttr) {
		clientService.getModify(client);
		rttr.addFlashAttribute("client", client.getMno());
		return "redirect:/easyfit/allClientList";
	}
	
	@GetMapping("/allClientRemove")//회원 삭제
	public String allRemove(@RequestParam("mno") Long mno, Model model) {
		clientService.getRemove(mno);
		return "redirect:/easyfit/allClientList";
	}
	
}
