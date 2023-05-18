package com.easyfit.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.service.CalendarService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/easyfit/*")
public class CalendarController {	
	private final CalendarService calendarService;
	public CalendarController(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

  //@GetMapping(value= "/calendar", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
	@GetMapping("/calendarDisplay")
	@ResponseBody
	public List<Map<String, Object>> calenList(){
		List<Map<String, Object>> list = calendarService.list();

		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i = 0 ; i < list.size() ; i++) {
			hash.put("title", list.get(i).get("MNAME"));
			hash.put("start", list.get(i).get("EDATE"));
			hash.put("prno", String.valueOf(list.get(i).get("PRNO")));
		//	hash.put("prno", list.get(i).get("PRNO"));
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		log.info("jsonArrCheck: {}"+ jsonArr);


		return jsonArr;
	}
	
	@GetMapping("/chartDataDisplay")
	@ResponseBody
	public List<Map<String, Object>> chartDataList(){
		List<Map<String, Object>> chartData = calendarService.chartData();

		JSONObject chartJsonObj = new JSONObject();
		JSONArray chartJsonArr = new JSONArray();
		
		HashMap<String, Object> chartHash = new HashMap<>();
		
		for(int i = 0 ; i < chartData.size() ; i++) {
			chartHash.put("month", chartData.get(i).get("MONTH"));
			chartHash.put("count", chartData.get(i).get("COUNT"));

			chartJsonObj = new JSONObject(chartHash);
			chartJsonArr.add(chartJsonObj);
		}
		log.info("jsonArrCheck: {}"+ chartJsonArr);
		return chartJsonArr;
	}

	@GetMapping("/totalPTDisplay")
	@ResponseBody
	public List<Map<String, Object>> totalPTList(){
		List<Map<String, Object>> totalPTData = calendarService.totalPTData();

		JSONObject ptJsonObj = new JSONObject();
		JSONArray ptJsonArr = new JSONArray();
		
		HashMap<String, Object> ptHash = new HashMap<>();
		
		for(int i = 0 ; i < totalPTData.size() ; i++) {
			ptHash.put("month", totalPTData.get(i).get("MONTH"));
			ptHash.put("count", totalPTData.get(i).get("COUNT"));

			ptJsonObj = new JSONObject(ptHash);
			ptJsonArr.add(ptJsonObj);
		}
		log.info("jsonArrCheck: {}"+ ptJsonArr);
		return ptJsonArr;
	}
	
	
	
	
	
	
	@GetMapping("/noticeDisplay")
	@ResponseBody
	public List<Map<String, Object>> smallNoticeList(){
		List<Map<String, Object>> smallNotice = calendarService.smallNotice();
		
		JSONObject noticeJsonObj = new JSONObject();
		JSONArray noticeJsonArr = new JSONArray();
		
		HashMap<String, Object> noticeHash = new HashMap<>();
		
		for(int i = 0 ; i < smallNotice.size() ; i++) {
			noticeHash.put("rn", smallNotice.get(i).get("RN"));
			noticeHash.put("ntitle", smallNotice.get(i).get("NTITLE"));
			noticeHash.put("nno", smallNotice.get(i).get("NNO"));
			
			noticeJsonObj = new JSONObject(noticeHash);
			noticeJsonArr.add(noticeJsonObj);			
		}
		log.info("jsonArrCheck: {}"+ noticeJsonArr);


		return noticeJsonArr;
	}
	
	@GetMapping("/logDisplay")
	@ResponseBody
	public List<Map<String, Object>> logList(){
		List<Map<String, Object>> log = calendarService.log();
		
		JSONObject logJsonObj = new JSONObject();
		JSONArray logJsonArr = new JSONArray();
		
		HashMap<String, Object> logHash = new HashMap<>();
		
		for(int i = 0 ; i < log.size() ; i++) {
			logHash.put("tname", log.get(i).get("TNAME"));
			logHash.put("tid", log.get(i).get("TID"));
			logHash.put("log", log.get(i).get("LOG"));
			logHash.put("tno", log.get(i).get("TNO"));
			
			
			logJsonObj = new JSONObject(logHash);
			logJsonArr.add(logJsonObj);			
		}
		
		return logJsonArr;
	}
	
	
	
	
	
	@Transactional
	@PostMapping(value = "/calendarRegister", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> register(@RequestBody ExerciseRecordVO exerciseRecord, String mname){
		log.info("ExerciseRecordVO : " + exerciseRecord);
		
		int insertCount = calendarService.register(exerciseRecord, mname);
		calendarService.getPrcountUpdate(mname);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value= "/calendarClientName", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List <String> mnameList() {		
		List<String> mnameList = calendarService.mnameList();
		return mnameList;		
	}
}

 