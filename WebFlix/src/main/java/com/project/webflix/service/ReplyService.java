package com.project.webflix.service;

import java.util.List;

import com.project.webflix.domain.ReplyPageDTO;
import com.project.webflix.domain.ReplyVO;
import com.project.webflix.service.domain.Criteria;

/**
 * 
 * @author lsh
 * @Date 20-05-23
 */
public interface ReplyService {
	
	public int register(ReplyVO replyVO);	
	
	// 특정게시물 가져오는 get 리턴타입은 ReplyVo
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO replyVO);
	
	public int remove(Long rno);

	// 전체 게시물 조회
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	
}
