package com.project.webflix.mapper.BoardMapperTests;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.project.webflix.domain.ReplyVO;
import com.project.webflix.mapper.ReplyMapper;
import com.project.webflix.service.domain.BoardCriteria;
import com.project.webflix.service.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	
	private Long[] bnoArr = {5302L, 5301L, 5284L, 5283L};
	
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	// 댓글추가 (성공)
	//@Test
	public void testCreate() {
		IntStream.rangeClosed(1,10).forEach(i -> {
			ReplyVO replyVO = new ReplyVO();
			
			replyVO.setBno(bnoArr[i % 4]);
			replyVO.setReply("댓글 테스트" + i);
			replyVO.setReplyer("replyer" + i);
			
			mapper.insert(replyVO);
		});
	}
	// 댓글 조회 (성공)
	//@Test
	public void testRead() {
		Long targetRno = 14L;
		ReplyVO replyVO = mapper.read(targetRno);
		log.info(replyVO);
	}
	
	@Test
	public void testList() {
		BoardCriteria cri = new BoardCriteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
	
	// 댓글 삭제 (성공)
	//@Test
	public void testDelete() {
		Long targetRno = 14L;
		mapper.delete(targetRno);
	}
	
	// 댓글 수정 (성공)
	// @Test
	public void testUpdate() {
		Long targetRno = 13L;
		ReplyVO replyVO = mapper.read(targetRno);
		replyVO.setReply("아니 연락!!!!");
		int count = mapper.update(replyVO);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2, 10);
		List<ReplyVO> rp = mapper.getListWithPaging(cri, 5302L);
		rp.forEach(reply -> log.info(reply));
	} 
	
	
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	
}
