package com.easyfit.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data를 쓰면 아래의 여러 가지 기능을 모두 사용할 수 있지만,
//아래처럼 필요한 것들만 코딩하는 것을 권장
@ToString
@Setter
@Getter
public class Criteria {	
	private long pageNum; 
	private long amount;	
	private String type;
	private String keyword; 	
	public Criteria() {
		this(1, 10);
	}
	public Criteria(long pageNum, long amount) {
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

}
