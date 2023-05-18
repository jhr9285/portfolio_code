package com.easyfit.domain.join;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CalendarJoinVO {
	private String mname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edate;
}
