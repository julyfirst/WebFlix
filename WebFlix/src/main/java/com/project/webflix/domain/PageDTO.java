package com.project.webflix.domain;

import com.project.webflix.service.domain.Criteria;

import lombok.Data;

@Data
/**
 * 
 * @author lsh
 * @Date 20-05-21
 * @ PageDTO는 생성자를 정의, Criteria와 전체 데이터수(total)를 파리미터로 지정
 * Criteria안에는 페이지에서 보여주는 데이터 수 (amount)와 현재 페이지 번호(pageNum)를 가지고 있기 때문에 
 * 이를 이용해서 필요한 모든 내용을 계싼할 수 있음
 * 
 * 
 */
public class PageDTO {
	// 데이터를 전달하는용도
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	// 셋팅
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil(total * 1.0) / cri.getAmount());
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
