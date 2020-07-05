package com.project.webflix.movie;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.webflix.mapper.MovieMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MovieMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private MovieMapper mapper;
	
	@Test
	public void testgetList() {
		mapper.getList().forEach(movie -> log.info(movie));
	}
	

	
}
