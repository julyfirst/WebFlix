package com.project.webflix.mapper;

import java.util.List;

import com.project.webflix.domain.MemberVO;
import com.project.webflix.domain.OrderDTO;

public interface OrderMapper {
		
	// 영화 구매하기
	public void insert(OrderDTO orderDTO);
	
	// 영화 구매목록
	public List<OrderDTO> getList(long id); 
	
	// 영화 구매목록
	public List<OrderDTO> getAllList(); 
	
	// 삭제
	public List<OrderDTO> delete(long id);
}
