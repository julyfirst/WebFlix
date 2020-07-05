package com.project.webflix.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.webflix.domain.OrderDTO;
import com.project.webflix.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/mv/*")
//@AllArgsConstructor
// SignUpController는 하나의 클래스 내에서 여러 메서드를 작성하고 request mapping등을 이용해 url을 분기하는 구조로 작성할 수 있음
// 원하는 기능을 호출
public class OrderController {
	
	@Setter(onMethod_= @Autowired)
	private OrderService service;
	
	// @AllArgsConstructor 같은의미
	public OrderController(OrderService service) {
		this.service = service;
	}

	/*
	// 영화 구매 목록 페이지
	@GetMapping("/purchaselist")
	public void purchaselist(Model model) {
		log.info("purchaselist...,,");
		List<OrderDTO> orderDTO = service.getAllList();
		model.addAttribute("purchaselist", orderDTO);
	}
	*/
	// 영화 구매 목록 페이지
	@GetMapping("/purchaselist")
	public void purchaselist(@RequestParam("id") Long id, Model model) {
		log.info("id....");
		List<OrderDTO> orderDTO = service.getList(id);
		model.addAttribute("purchaselist", orderDTO);
	}

	 

	
}
