package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.SampleVO;

import lombok.extern.log4j.Log4j;

//@RestController
@Controller
@RequestMapping("/sample")
@Log4j
public class SampleController {
	
//	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
//	public String getText() {
//		
//		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
//		
//		return "안녕하세요";
//	}
//	
//	// 주소만 입력하면 xml 형식이 기본으로 출력되고, 주소 뒤에 .json 붙이면 json 형식으로 출력된다.
//	// xml 형식의 메인 태그 : SampleVO (클래스명), 그 다음 태그 : mno, firstName, lastName (SampleVO 클래스 내의 변수이름)
//	@GetMapping(value = "/getSample", 
//				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
//	public SampleVO getSample() {
//		
//		return new SampleVO(112, "스타", "로드");
//	}
//	
//	
//	@GetMapping(value = "/getSample2")
//	public SampleVO getSample2() {
//		
//		return new SampleVO(113, "로켓", "라쿤");
//	}
//	
//	@GetMapping(value = "/getList")
//	public List<SampleVO> getList() {
//		// ★ 람다식 코딩 (최신 트렌드)  ==> map : $.each 기능과 동일 / toList() : List로 변환
//		// 아래 코드는 SampleVO를 10개 만들어서 List에 넣는 코드다.
//		return IntStream.range(1,  10).mapToObj(i -> new SampleVO(i, i + "First", i + " Last")).collect(Collectors.toList());
//	}
//	
//	@GetMapping(value = "/getMap")
//	public Map<String, SampleVO> getMap() {
//		
//		Map<String, SampleVO> map = new HashMap<>();
//		map.put("First",  new SampleVO(111, "그루트", "주니어"));
//		
//		return map;
//	}
//	
	
	
	// spring security -------------------------------------------------------
	@GetMapping("/all")
	public void doAll() {
		log.info("do all can access everybody");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("logined member");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin only");
	}
}
