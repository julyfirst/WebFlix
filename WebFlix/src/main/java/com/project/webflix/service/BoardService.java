package com.project.webflix.service;

import java.util.List;

import com.project.webflix.domain.BoardVO;
import com.project.webflix.service.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);	
	
	// 특정게시물 가져오는 get 리턴타입은 BoardVO
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	/*
	 여러개의 전체 게시물조회 리턴 타입은 List<BoardVO> 
	public List<BoardVO> getList();
	*/
	// 전체 게시물 조회
	public List<BoardVO> getList(Criteria cri);
	
	// 전체데이터 개수 처리 (게시판글수)
	public int getTotal(Criteria cri);
}
