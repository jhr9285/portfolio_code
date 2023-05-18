package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data를 쓰면 아래의 여러 가지 기능을 모두 사용할 수 있지만,
//아래처럼 필요한 것들만 코딩하는 것을 권장
@ToString
@Setter
@Getter
public class Criteria {
	
	private int pageNum; // 페이지 넘버
	private int amount; // 페이지 영역의 총 페이지 갯수
	
	private String type; // 검색 유형
	private String keyword; // 검색어
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	public String getListLink() { // BoardController remove에 적용
		// UriComponentsBuilder : 파라미터를 생성하는 클래스
		// .fromPath() - 선행주소 지정하는 메소드 (url 주소에서 물음표(?) 앞부분에 오는 주소)	
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
										.queryParam("pageNum", this.pageNum)
										.queryParam("amount", this.getAmount())
										.queryParam("type", this.getType())
										.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}

}
