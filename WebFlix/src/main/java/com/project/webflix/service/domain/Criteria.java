package com.project.webflix.service.domain;


import lombok.ToString;

/**
 * 
 * @author lsh
 * @date 20-05-21
 * @ Criteria 검색의 기준
 *  페이지번호와, 데이터값을 전달하는 용도  (getter, setter)
 *  생성자를 통해서 기본값을 1페이지 10개로도 지정
 *  
 *  - 자식 클래스 - BoardCriteria
 *  
 */
@ToString
public class Criteria {

	protected int PageNum; // 페이지번호
	protected int amount; // 데이터 수
	

	public int getPageNum() {
		return PageNum;
	}
	public void setPageNum(int pageNum) {
		PageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	// 한페이지당 몇 개의 데이터를 보여줄 것인가
	public Criteria() {
		// pageNum, amount
		this(1,10);
	}
	
	// 한페이지당 10개씩
	public Criteria(int pageNum, int amount) {
		this.PageNum = pageNum;
		this.amount = amount;
	}
	
	
}
