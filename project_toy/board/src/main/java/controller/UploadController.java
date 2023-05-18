package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm") // 여기로 접속해서 파일을 업로드하면 uploadFormPost 메소드에 의해 파일이 경로로 전송됨!!
	public void uploadForm() {
		
		log.info("upload form");
	}
	// end uploadForm
	
	@PostMapping("/uploadFormAction") // 이 주소를 입력해서 들어가는 것이 아님!!
	@PreAuthorize("isAuthenticated()") // 메소드 호출 전 로그인 되었는지 검사하는 annotation
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload";
		// C드라이브에 upload 폴더, upload 폴더에 temp 폴더 모두 만들어야 업로드 가능!!
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("-----------------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile); // transferTo() : upload 해주는 메소드 (매개변수는 File 객체)
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			// end catch
		}
		// end for
	}
	// end uploadFormAction
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() { // 업로드 화면으로 가는 메소드
		
		log.info("upload ajax");
	}
	// end uploadAjax
	
	// 연월일 이름 붙인 폴더 생성하는 메소드
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		String str = sdf.format(date);
		
		//어제 날짜로 해야 할 때 코드
		//Calendar date = Calendar.getInstance();
		//date.add(Calendar.DATE, -1); 
		//String str = sdf.format(date.getTime());
		
		return str.replace("-", File.separator);  // 하이픈을 경로 구분자로 바꿈
		// windows의 File.separator : \\, 호환을 위해 File.separator로 코딩하는 것이 바람직하다.
	}
	
	// 파일 타입 구하기
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath()); // ★ probeContentType() : 파일 타입 구해주는 메소드
			return contentType.startsWith("image"); // 파일 타입이 image면 true 반환
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PreAuthorize("isAuthenticated()") // 메소드 호출 전 로그인 되었는지 검사하는 annotation
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		
		// 폴더 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath); // uploadFolder 명 뒤에 getFolder() 명이 붙음
		
		if(uploadPath.exists() == false) { // ★ 그 경로가 존재하지 않으면 경로를 만든다!
			uploadPath.mkdirs(); // mkdir's' : 여러 개 만든다는 의미 (mkdir : 1개 생성) ==> 2023 폴더, 03 폴더, 06 폴더를 연속적으로 만들기 위함
		} // make yyyy/MM/dd folder
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID(); // UUID 생성
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;  // 업로드 파일명 앞에 UUID 붙임
			
		try {
			File saveFile = new File(uploadPath, uploadFileName); // 위의 이름으로 파일 객체 생성
			multipartFile.transferTo(saveFile);
			
			// 전달하기 위해 DTO에 담는다.
			attachDTO.setUuid(uuid.toString());
			attachDTO.setUploadPath(uploadFolderPath);
			
			// check image type file
			if(checkImageType(saveFile)) {
				
				attachDTO.setImage(true);
				
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				// 섬네일에는 s_를 접두어로 붙이겠다는 의미
				
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				// createThumbnail() : 섬네일 만드는 메소드, Thumbnailator : pom.xml에 라이브러리 추가 필요
				// 100, 100 : width, height ==> width는 100이 고정값이지만 원본 배율에 따라 height는 자동 조정된다.
				// ★ 가로가 긴 이미지 파일은 width를 100으로 고정, 세로가 긴 이미지 파일은 height를 100으로 고정 
				thumbnail.close();
			}
			// add to list
			list.add(attachDTO);
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		// end catch
		}
		// end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	} 
	// end uploadAjaxAction
	
	
	// 브라우저에 이미지 출력하기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("fileName: " + fileName);
		
		File file = new File("C:\\upload\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			// ★ FileCopyUtils.copyToByteArray(file) : file을 바이트 배열로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	// end display
	
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody					 // └→ 이미지나 pdf파일을 뷰어로 보여주지 않고 다운로드되게 하는 코드
	// @ResponseBody : jsp 페이지(뷰)로 이동시키는 게 아니고,
	// 				   ajax 방식으로 서버에서 클라이언트에 데이터를 전송할 때 사용하는 annotation
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		
		log.info(userAgent);
		
		Resource resource = new FileSystemResource("C:\\upload\\" + fileName); 
		
		if(resource.exists() == false) { // 파일이 없으면
			return new ResponseEntity<>(HttpStatus.NOT_FOUND); // not fount 404 error를 보낸다.
		}
		
		String resourceName = resource.getFilename();
		
		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1); // 언더바 뒷부분을 가져오는 코드
		
		HttpHeaders headers = new HttpHeaders(); 
		try {
			String downloadName = null;
			// 한글 깨짐 방지 if문
			if (userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			}else {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			log.info("downloadName: " + downloadName);
			// 다운로드 하는 파일명을 filename 붙여서 지정
			headers.add("Content-Disposition", "attachment; filename=" + downloadName); 
		
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	// end download
	
	
	@PostMapping("/deleteFile")
	@PreAuthorize("isAuthenticated()") // 메소드 호출 전 로그인 되었는지 검사하는 annotation
	@ResponseBody // ajax 방식이라는 의미 (jsp로 이동X), ResponseBody와 ResponseEntity는 set
	public ResponseEntity<String> deleteFile(String fileName, String type) { // register.jsp에서 ajax로 보낸 json 형태 데이터의 fileName, type 속성
		
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete(); // 섬네일 이미지 삭제
			
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", ""); // s_를 없애서 파일명을 원본명으로 변경
				
				log.info("largeFileName: " + largeFileName);
				
				file = new File(largeFileName);
				file.delete(); // 원본 이미지 삭제
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
