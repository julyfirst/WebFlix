package com.project.webflix.service;

import java.util.List;

import com.project.webflix.domain.OrderDTO;

public interface OrderService {
	
	// 구매
	public void insert(OrderDTO orderDTO);
	
	// 구매 목록 회원 조회
	public List<OrderDTO> getList(Long id);
	
	// 구매 목록 조회
	public List<OrderDTO> getAllList();
	
}
