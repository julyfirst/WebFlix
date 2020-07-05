package com.project.webflix.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthVO {
	
	private long id;
	private String userid;
	private String authorities;
	
	
}
