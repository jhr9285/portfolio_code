package org.zerock.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zerock.domain.BoardAttachVO;
import org.zerock.mapper.BoardAttachMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
@AllArgsConstructor
public class FileCheckTask {
	
	private BoardAttachMapper attachMapper;
	
	private String getFolderYesterday() { // 어제 날짜의 폴더 구하는 메소드 만듦
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance(); // 캘린더 객체 생성
		
		cal.add(Calendar.DATE, -1); // Calendar.add() : 날짜를 증가/감소 시키는 메소드. -1 : 하루를 뺀다 ==> 어제
		
		String str = sdf.format(cal.getTime()); // 어제 날짜를 format에 맞게 수정
		
		return str.replace("-", File.separator); // 하이픈을 파일 구분자로 변경
	}
	
	// * batch 처리 : 일괄처리. 여러 작업을 모았다가 한번에 처리. 일반적으로 scheduled를 지정해서 처리.
	// cron 설정 : _ _ _ _ _ _ (_) ==> 초(0~59) 분(0~59) 시(0~23) 일(1~31) 월(1~12) 요일(1~7) (연/필수입력값X, 선택적으로 사용)
	
	@Scheduled(cron = "0 30 14 * * *")
	public void checkFiles() throws Exception {
		
		log.warn("File Check Task run...............");
		log.warn(new Date());
		
		List<BoardAttachVO> fileList = attachMapper.getOldFiles(); // 어제의 데이터를 모아서 List에 넣음
		
		// ready for check file in directory with database file list
		// map 함수로 데이터를 모아서 List에 넣음 => List 타입의 결과값에 Path가 들어감
		// fileListPaths : DB에 등록된 파일들의 경로 List
		List<Path> fileListPaths = fileList.stream()
			.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
			.collect(Collectors.toList());
		
		// image file has thumnail file
		// filter : 걸러내는 역할 (이미지인 경우만 map)
		// fileList에서 하나 꺼내서 vo에 넣고, vo가 true면 map() 안의 vo에 적용,
		// Path 만드는 데에 va 활용되고, 그 결과 만들어진 p(Path)를 fileListPaths에 넣음
		fileList.stream().filter(vo -> vo.isFileType() == true) 
			.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
			.forEach(p -> fileListPaths.add(p));
		
		log.warn("=======================================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		// files in yesterday directory (어제 날짜의 파일 디렉토리 구하기)
		File targetDir = Paths.get("C:\\upload", getFolderYesterday()).toFile();
		
		// listFiles에서 하나 꺼내서 file에 넣고, 위에서 만든 fileListPaths에 file.toPath()가 들어있는지 체크, false면 removeFiles(삭제할 파일 목록)에 넣음
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("----------------------------------------");
		
		for(File file : removeFiles) { // 삭제할 파일 목록의 파일을 하나씩 꺼내서
			
			log.warn(file.getAbsolutePath());
			
			file.delete(); // 삭제
		}
	}			
}
