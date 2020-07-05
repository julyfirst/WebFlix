package com.project.webflix.mapper;

import java.util.List;

import com.project.webflix.domain.MovieVO;

public interface MovieMapper {
		
	// 영화 등록하기
	public void insert(MovieVO movieVO);
	
	// 등록된 영화목록
	public List<MovieVO> getList(); 
	

	


}
