package com.easyfit.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.easyfit.domain.ReplyCriteria;
import com.easyfit.domain.ReplyPageDTO;
import com.easyfit.domain.ReplyVO;
import com.easyfit.domain.join.ReplyJoinVO;
import com.easyfit.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	//자동주입
	private ReplyService service;
	
	//등록
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {

		log.info("ReplyVO: " + vo);

		Long insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);
		
		//대글갯수구하기
		

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//목록 with paging
	@GetMapping(value = "/pages/{tbno}/{page}", 
			produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("tbno") Long tbno) {

		ReplyCriteria cri = new ReplyCriteria(page, 5);
		
		log.info("get Reply List tbno: " + tbno);

		log.info("cri:" + cri);

		return new ResponseEntity<>(service.getListPage(cri, tbno), HttpStatus.OK);
	}
	//댓글상세보기
	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyJoinVO> get(@PathVariable("rno") Long rno) {

		log.info("get: " + rno);

		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	//댓글수정
	@RequestMapping(method = { RequestMethod.PUT,RequestMethod.PATCH }, value = "/{rno}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {
		
		vo.setRno(rno);
		
		log.info("rno: " + rno);
		log.info("modify: " + vo);
		
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	//댓글삭제
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

		log.info("remove: " + rno);

		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	

}
