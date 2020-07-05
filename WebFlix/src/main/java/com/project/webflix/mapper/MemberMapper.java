package com.project.webflix.mapper;

import java.util.List;

import com.project.webflix.domain.MemberVO;

public interface MemberMapper {
	
	// 읽기
	public MemberVO read(String userid);
	
	// 회원추가
	public void insert(MemberVO memberVo);
	
	// 회원정보 출력
	public List<MemberVO> getList(); 
	
	// 이메일로 아이디찾기
	public String find_id(String email);
	
	// 이메일로 비밀번호찾기
	public int update_pw(MemberVO memberVo);
	
	
	 /*public List<MemberVO> getListWithPaging(MemberCriteria cri);
	
	public int getTotalCount(MemberCriteria cri);*/
}
