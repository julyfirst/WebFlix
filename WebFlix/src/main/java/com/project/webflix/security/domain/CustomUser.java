package com.project.webflix.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.project.webflix.domain.MemberVO;

import lombok.Getter;

/**
 * 
 * @author lsh
 * @Date 20-05-25
 * MemverVO를 파라미터로 전달해서 user클래스에 맞게 생성자를 호출
 * 이과장에서 MemberVO를 파라미터로 전달해서 User클래스에 맞게 생성자를 호출함
 *  AuthVO 인스턴스는 GrantedAuthority 객체로 변환해야 하므로 stream()과 map()을 이용해서 처리합니다.
 *  
 *  변경 후에는 customuserDetailsservice custom user를 반환 하도록 수정 하기!
 *  이클래스는 memberVO의 인스턴스를 스프링 시큐리티의 UserDetails 타입으로 변환하는 작업을 처리해야함
 *
 */
@Getter
public class CustomUser extends User{
	
	private static long serialVersionUID = 1L;
	
	private MemberVO member;
	
	
	// 상속이므로 부모 클래스의 생성자를 호출해야만 정상적인 객체를 생성할 수 있음
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
			super(username, password, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthorities())).collect(Collectors.toList()));
		this.member = vo;
	}
}
