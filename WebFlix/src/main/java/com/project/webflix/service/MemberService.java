package com.project.webflix.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.project.webflix.domain.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void create(MemberVO memberVo);	

	// 전체 회원목록
	public List<MemberVO> getList();
	
	// 아이디 찾기
	public String find_id(String email);
	
	// 비밀번호 찾기
	public int update_pw(MemberVO memberVo);

	// 이메일 발송
	public void send_mail(MemberVO memberVo, String div);
	
	// 이메일 비밀번호
	public void find_pw(HttpServletResponse response, MemberVO memberVo) throws IOException;
	
	
	
	/*
	// 전체 회원목록 조회
	public List<MemberVO> getList(MemberCriteria cri);
		
	// 전체데이터 개수 처리 (회원수)
	public int getTotal(MemberCriteria cri);*/

}
