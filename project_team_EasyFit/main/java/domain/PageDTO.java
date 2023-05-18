package com.easyfit.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private long startPage;
	private long endPage;
	private boolean prev, next;
	
	private long total;
	private Criteria cri;
	
	public PageDTO(long total, Criteria cri) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (long)(Math.ceil(cri.getPageNum() / 10.0)) * 10; 
		this.startPage = this.endPage - 9; 
		
		long realEnd = (long)(Math.ceil((total * 1.0) / cri.getAmount())); 
		
		if(realEnd < this.endPage) { 
			this.endPage = realEnd; 
		}
		
		this.prev = this.startPage > 1; 
		this.next = this.endPage < realEnd;
	}
	
	
}
