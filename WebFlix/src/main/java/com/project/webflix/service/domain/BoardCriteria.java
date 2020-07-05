package com.project.webflix.service.domain;


import org.springframework.web.util.UriComponentsBuilder;

import lombok.ToString;

/**
 * 
 * @author lsh
 * @date 20-05-21
 * @ BoardCriteria 검색기능 
 *  type = 작성자, 제목, 내용
 *  keyword = 해당되는 단어
 *  
 */
@ToString
public class BoardCriteria extends Criteria{

	// type : 내용, 제목, 작성자 
	// keyword : 단어 키워드
	private String type;
	private String keyword;

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
