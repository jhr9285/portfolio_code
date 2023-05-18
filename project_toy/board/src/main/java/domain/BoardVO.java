package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO { // VO = DTO (Model)
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	
	private int replyCnt; // reply 관련 (댓글수)
	
	private List<BoardAttachVO> attachList; // attach 관련 (첨부파일 목록)
}
