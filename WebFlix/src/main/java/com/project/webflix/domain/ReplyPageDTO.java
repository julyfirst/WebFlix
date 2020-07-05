package com.project.webflix.domain;

import java.util.List;

import lombok.Getter;
import lombok.ToString;


/**
 * 
 * @author lsh
 * @Date 20-05-24
 * 댓글 과 댓글수 처리
 */
@Getter
@ToString
public class ReplyPageDTO {
	
	private int replyCnt;
	private List<ReplyVO> list;
	
	
	// replyCnt와 list를 생성자의 파라미터로 처리
	public ReplyPageDTO(int replyCnt, List<ReplyVO> list) {
		super();
		this.replyCnt = replyCnt;
		this.list = list;
	}

	

	
}
