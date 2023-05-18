package com.easyfit.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.service.LessonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/exercisetype/*")
@RestController
@Log4j
@AllArgsConstructor
public class ExerciseTypeController {
	
	private LessonService lessonService;
	
	// 운동기록 모달 CRUD (JHR)
	// SELECT - LIST
	@GetMapping(value = "/{type}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ExerciseTypeVO>> getList(@PathVariable("type") String type, Criteria cri) {
		
		cri.setType(type);
		log.info("getList(et) : " + lessonService.getExerciseTypeList(cri));
		return new ResponseEntity<>(lessonService.getExerciseTypeList(cri), HttpStatus.OK);
	}
	
	// SELECT - GET
	@GetMapping(value = "/eno/{ename}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ExerciseTypeVO> getEno(@PathVariable("ename") String ename, ExerciseTypeVO et) {
		
		log.info("getEno(et) : " + lessonService.getEno(et));
		return new ResponseEntity<>(lessonService.getEno(et), HttpStatus.OK);
	}

}
