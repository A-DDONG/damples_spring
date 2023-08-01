package com.damples.damdam.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDto {

	private long b_seq;// long
	private String b_title;// varchar(125)
	private String b_ccode;// varchar(100)
	private String b_content;// varchar(1000)
	private String b_nickname;// varchar(125)
	private String b_password;// varchar(125)
	private String b_date;// varchar(10)
	private long b_viewcount;// long
	
	//대표 이미지
	private String b_image;// VARCHAR(125),

}
