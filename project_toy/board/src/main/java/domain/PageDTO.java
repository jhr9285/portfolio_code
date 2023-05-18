package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10; // 올림 계산 - 10으로 시작
		this.startPage = this.endPage - 9; // startPage : 페이징 처리된 영역의 첫 페이지
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount())); // realEnd : 총 페이지 갯수
		
		if(realEnd < this.endPage) { // 총 페이지 갯수가 endPage보다 적으면
			this.endPage = realEnd; // endPage를 realEnd로 치환
		}
		
		this.prev = this.startPage > 1; // prev는 startPage가 1보다 크면 무조건 true
		this.next = this.endPage < realEnd; // next는 endPage가 realEnd보다 작으면 무조건 true
	}
	
	
}
