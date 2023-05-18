package com.easyfit.domain.join;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginJoinVO {
	
	private String tid;
	private String eMonth;
	private Long prcountSum;
	
}
