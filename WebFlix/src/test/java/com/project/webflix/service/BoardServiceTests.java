package com.project.webflix.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.webflix.domain.BoardVO;
import com.project.webflix.service.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	//@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("서비스를 이용한 새로 작성하는 글");
		board.setContent("서비스를 이용한 새로 작성하는 내용");
		board.setWriter("서비스를 이용한 newbie");
		
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	
	
//	//@Test
//	public void testGetList() {
//		service.getList().forEach(board-> log.info(board));
//	}
	
	@Test
	public void testGetList() {
		// service.getList().forEach(board-> log.info(board));
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}
	
	//@Test
	public void testGet() {
		log.info(service.get(2L));
	}
	
	//@Test
	public void testUpdate() {
		BoardVO board = service.get(2L);
		
		if(board == null) {
			return ;
		}else {
			board.setTitle("제목 수정합니다.");
			log.info("Modify Result: " + service.modify(board));
		}
	}
	
	//@Test
	public void testDelete() {
		log.info("Remove ReSULT : " + service.remove(5L));
	}
	
}
