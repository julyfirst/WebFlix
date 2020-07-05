package com.project.webflix.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
/**
 * 
 * @author lsh
 * @Date 20-05-24
 * CustomLoginSuccessHandler는 로그인 한 사용자에게 부여된 권한 Authentication 객체를 이용해
 * 사용자가 가진  모든 권한을 문자열로 체크합니다.
 * 만일 사용자가 ROLE_ADMIN 권한을 가졌다면 로그인 후에 바로 /sample/admin으로 이동하게 됨
 *  
 */
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override	
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("Login Success");
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : " + roleNames);
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/sample/member");
			return;
		}
		response.sendRedirect("/");
	}
	
}
