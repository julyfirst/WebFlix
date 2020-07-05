package com.project.webflix.mapper.BoardMapperTests;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.project.webflix.domain.MemberVO;
import com.project.webflix.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		MemberVO memberVO = mapper.read("admin90");
		log.info(memberVO);
		
		memberVO.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
