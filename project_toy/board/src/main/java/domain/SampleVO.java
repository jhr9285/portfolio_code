package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor // 파라미터 "모두 쓰는" 생성자를, 코딩하지 않아도 만들어준다! 
@NoArgsConstructor // 파라미터 "없는" 생성자를, 코딩하지 않아도 만들어준다! 
public class SampleVO {
	
	private Integer mno; // wrapper 클래스로 생성한 것 (객체)
	private String firstName;
	private String lastName;

}
