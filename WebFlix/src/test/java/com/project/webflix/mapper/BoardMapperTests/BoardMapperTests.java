package com.project.webflix.mapper.BoardMapperTests;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.webflix.domain.BoardVO;
import com.project.webflix.mapper.BoardMapper;
import com.project.webflix.service.domain.BoardCriteria;
import com.project.webflix.service.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	//@Test
	public void testGetList() {
		mapper.getList().forEach(board-> log.info(board));
	}
	
	// @Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로작성하는글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("이상현");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	//@Test
	public void testInsertSelectKey() {

		BoardVO board = new BoardVO();
		board.setTitle("새로작성하는글 Select key");
		board.setContent("새로 작성하는 내용 Select key");
		board.setWriter("이상현 22222");
		
		mapper.insertSelectKey(board);
	}
	
	//@Test
	public void testRead() {
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);
		log.info(board);
		
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE COUNT : "  + mapper.delete(3L));
	}
	
	//@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("이상현이 수정");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
		
	}
	//@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		// 페이지수와 데이터갯수
		cri.setPageNum(14);
		cri.setAmount(10);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getBno()));
	}
	// 검색
	@Test
	public void testSearch() {
		BoardCriteria cri = new BoardCriteria();
		cri.setKeyword("이상현");
		cri.setType("TCW");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board));
		
	}
	
	
}
