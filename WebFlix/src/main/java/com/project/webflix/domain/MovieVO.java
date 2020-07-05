package com.project.webflix.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 
 * @author lsh
 * @Date 20-05-25
 * 회원
 *
 */
@Data
public class MovieVO {
	
	private Long movie_id;
	private String movie_name;
	private String movie_genre;
	private String movie_price1;
	private String movie_price2;
	private Date movie_releasedate;
	private Date movie_regdate;
	private String enabled;


}
