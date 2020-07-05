package com.project.webflix.mapper.OrderMapperTest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.project.webflix.domain.OrderDTO;
import com.project.webflix.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {
	
		
	@Setter(onMethod_= @Autowired)
	private OrderMapper mapper;

	// 선택된 아이디 조회
	//@Test
	public void testList() {
		List<OrderDTO> orderDTO = mapper.getList(2);
		log.info(orderDTO);
	}
	
	// 전체조회
	@Test
	public void testList2() {
		List<OrderDTO> orderDTO = mapper.getAllList();
		log.info(orderDTO);
	}
	
	// @Test
	public void delete() {
		List<OrderDTO> orderDTO = mapper.delete(6);
		log.info(orderDTO + "삭제완료-------------");
	}
		
}
