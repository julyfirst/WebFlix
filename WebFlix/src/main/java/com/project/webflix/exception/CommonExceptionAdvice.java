package com.project.webflix.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j2;

@ControllerAdvice // 해당 객체가 스프링의 컨트롤러에서 발생하는 예외처리하는 존재임을 명시하는 용도
@Log4j2
public class CommonExceptionAdvice {
	
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		ex.printStackTrace();
		model.addAttribute("exception", ex);
		return "error_page";
	}
	
}
