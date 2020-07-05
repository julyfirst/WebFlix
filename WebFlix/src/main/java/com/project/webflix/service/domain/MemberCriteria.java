package com.project.webflix.service.domain;


import org.springframework.web.util.UriComponentsBuilder;

import lombok.ToString;

/**
 * 
 * @author lsh
 * @date 20-05-27
 * @ MemberCriteria 검색의 기준
 *  페이지번호와, 데이터값을 전달하는 용도  (getter, setter)
 *  생성자를 통해서 기본값을 1페이지 10개로도 지정
 *  
 *  
 *  
 */
@ToString
public class MemberCriteria {

	private int PageNum; // 페이지번호
	private int amount; // 데이터 수
	
	// type : 내용, 제목, 작성자 
	// keyword : 단어 키워드
	private String type;
	private String keyword;

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
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	// 한페이지당 몇 개의 데이터를 보여줄 것인가
	public MemberCriteria() {
		// pageNum, amount
		this(1,10);
	}
	
	// 한페이지당 10개씩
	public MemberCriteria(int pageNum, int amount) {
		this.PageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		// type값이 null 이면 비어있는 문자열배열 반환, null이 아니라면 한글자  
		return type == null ? new String[] {}:type.split("");
	}
	
	// 웹페이지에서 매번 파라미터를 유지하는 일이 번거로우면 UriCmponentsBuilder라는 클래스 이용
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.PageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
				return builder.toUriString();
	}
}