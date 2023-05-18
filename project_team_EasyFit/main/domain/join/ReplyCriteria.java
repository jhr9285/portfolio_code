package com.easyfit.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data를 쓰면 아래의 여러 가지 기능을 모두 사용할 수 있지만,
//아래처럼 필요한 것들만 코딩하는 것을 권장
@ToString
@Setter
@Getter
public class ReplyCriteria {	
	private long pageNum; 
	private long amount;	
	private String type;
	private String keyword; 	
	public ReplyCriteria() {
		this(1, 5);
	}
	public ReplyCriteria(long pageNum, long amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}	
/* 이성연 코드
	public String[] getTypeArr() {	    
		return type == null? new String[] {}: type.split("");
	 }
*/	
	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();

	}
}
