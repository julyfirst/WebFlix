package com.project.webflix.service;

import java.util.List;

import com.project.webflix.domain.MovieVO;

public interface MovieService {
	
	// 구매
	public void insert(MovieVO movieVO);
	
	// 구매 목록 조회
	public List<MovieVO> getList();
	
}
