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

import com.easyfit.domain.PTRecordVO;
import com.easyfit.service.ClientService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/ptrecord/")
@RestController
@Log4j
@AllArgsConstructor
public class PtRecordController {
	private ClientService clientService;
  
	@PostMapping(value= "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE}) 
	public ResponseEntity<String> create(@RequestBody PTRecordVO ptrecord){ 
		log.info("LessonJoinVO : " + ptrecord);
		long insertCount = clientService.getPrRegister(ptrecord);
		log.info("ptRecord INSERT COUNT : " + insertCount); 
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
  	}
  
	//PT 이력 상세보기
	@GetMapping(value = "/{prno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE }) 
	public ResponseEntity<PTRecordVO> get(@PathVariable("prno") Long prno) { 
		log.info("get : " + prno);
		return new ResponseEntity<>(clientService.getPrGet(prno), HttpStatus.OK); 
	}
	
	// PT 수정하기
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value = "/{prno}", consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody PTRecordVO ptrecord, @PathVariable("prno") Long prno) {

		log.info("prno: " + prno);
		log.info("modify: " + ptrecord);

		return clientService.getPrModify(ptrecord) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	// PT 삭제하기
	@DeleteMapping(value = "/{prno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("prno") Long prno) {
		
		log.info("remove: " + prno);
		
		return clientService.getPrRemove(prno) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}

}
