package com.damples.damdam.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TourDto {
	
	private String tour_code;	//	VARCHAR(5)
	private String tour_category;	//	VARCHAR(20)
	private String tour_name;	//	VARCHAR(50)
	private String tour_addr;	//	VARCHAR(125)
	private String tour_time;	//	VARCHAR(200)
	private String tour_rtime;	//	VARCHAR(23)
	private String tour_tel;	//	VARCHAR(15)
	private String tour_notic;	//	VARCHAR(200)
	private String tour_page;	//	VARCHAR(100)
	private String tour_fee;	//	VARCHAR(200)
	private String tour_info;	//	VARCHAR(300)
	private String tour_imgcode;	//	VARCHAR(5)


}
