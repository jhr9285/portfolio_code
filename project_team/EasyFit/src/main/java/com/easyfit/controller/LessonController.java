package com.easyfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.PageDTO;
import com.easyfit.service.LessonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/easyfit/*")
@AllArgsConstructor
public class LessonController {
	
private LessonService lessonService;

	// 뷰 페이지(jsp 파일) CRUD

	// Home
	@GetMapping("")
	public void basic() {}
	
	// SELECT - LIST (PT기록)
	@GetMapping("/lessonList")
	public void lessonList(@ModelAttribute("cri") Criteria cri, Long tno, Model model) {		
		
		model.addAttribute("ptRecordList", lessonService.getTripleList(cri, tno));
		long total = lessonService.getMyPTRecordTotalCount(cri, tno); 
		
		log.info("list : " + cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		model.addAttribute("tno", tno);
	}
	
	// SELECT - LIST (운동기록)
	@GetMapping("/lessonDetailList")
	public void lessonDetailList(@RequestParam("prno") Long prno, @RequestParam("tno") Long tno, Model model, Long mno) {		

		model.addAttribute("exerciseRecordList", lessonService.getDoubleList(prno, tno));	
		
		model.addAttribute("prnoTransfer", prno);	
		model.addAttribute("mnoTransfer", mno);
		log.info("mno :" + mno);
	}
	
	// SELECT - GET
	@GetMapping("/lessonGet")
	public void get(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, @RequestParam("tno") Long tno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("lessonGet : " + prno + " , " + edate + " , " + tno);
		model.addAttribute("vo", lessonService.getGet(prno, edate, tno));
		log.info(lessonService.getGet(prno, edate, tno));
	}
	
	
	// INSERT
	@GetMapping("/lessonRegister")
	public void lessonRegister(@RequestParam("prno") Long prno, @RequestParam("tno") Long tno, Model model, Long mno) {
		
		log.info("lessonRegister(get) : " + prno + " , " + tno + "," + lessonService.getLessonRegisterMNAME(tno, mno));
		model.addAttribute("exerciseRecordList", lessonService.getDoubleListNotPaging(prno, tno));
		model.addAttribute("prnoTransfer", prno);
		model.addAttribute("mnoValue", mno);
		model.addAttribute("mnameTransfer", lessonService.getLessonRegisterMNAME(tno, mno));
		log.info(lessonService.getLessonRegisterMNAME(tno, mno));
		
	}
	
	// INSERT
	@Transactional
	@ResponseBody
	@PostMapping(value = "/lessonRegister", consumes="application/json") 
	public void lessonRegister(@RequestBody ExerciseRecordVO vo, @RequestParam("tno") Long tno) {
		
		log.info("lessonRegister(post) : " + vo);
	    lessonService.getRegister(vo); 
		lessonService.getPrcountUpdate(vo.getPrno());
	}
	
	
	// UPDATE
	@GetMapping("/lessonModify")
	public void lessonModify(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, @RequestParam("tno") Long tno, Model model) {
		
		log.info("lessonModify(get) : " + prno + " , " + edate + " , " + tno);
		log.info("check : " + lessonService.getGet(prno, edate, tno));
		model.addAttribute("vo", lessonService.getGet(prno, edate, tno));
	}
	
	// UPDATE - 기입력 내용은 modify, 새로운 입력 내용은 register
	@ResponseBody
	@PostMapping(value = "/lessonModify", consumes="application/json") 
	public void lessonModify(@RequestBody ExerciseRecordVO vo, @RequestParam("tno") Long tno) {
										
		log.info("lessonModify(post) : " + vo);
		lessonService.getModify(vo);
	}
	
	@ResponseBody
	@PostMapping(value = "/lessonModifyEno", consumes="application/json") 
	public void lessonModifyEno(@RequestBody ExerciseRecordVO vo, @RequestParam("tno") Long tno) {
										
		log.info("lessonModify(post_eno) : " + vo);
		lessonService.getModifyEno(vo);
	}
	
	@ResponseBody
	@PostMapping(value = "/lessonModifyRegister", consumes="application/json") 
	public void lessonModifyRegister(@RequestBody ExerciseRecordVO vo, @RequestParam("tno") Long tno) {
		
		log.info("lessonModifyRegister(post) : " + vo);
		lessonService.getRegister(vo);
	}

	
	// DELETE
	@Transactional
	@PostMapping("/lessonRemove")
	public String lesonRemove(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, @RequestParam("tno") Long tno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("lessonRemove : " + prno + " , " + edate) ;
		
		if(lessonService.getRemove(prno, edate)) {
			rttr.addFlashAttribute("result", "삭제");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		lessonService.getPrcountUpdate(prno);
		
		return "redirect:/easyfit/lessonDetailList?prno=" + prno + "&tno=" + tno;
	}
}
