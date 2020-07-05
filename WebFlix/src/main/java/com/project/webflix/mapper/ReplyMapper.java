package com.project.webflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.webflix.domain.ReplyVO;
import com.project.webflix.service.domain.Criteria;

/**
 * 
 * @author lsh
 * @Date 20-05-22
 * ReplyMapper 인터페이스를 처리
 */
public interface ReplyMapper {

	// 댓글 추가
	public int insert(ReplyVO replyVO);
	
	public ReplyVO read(Long bno);
	
	public int delete (Long bno);
	
	public int update(ReplyVO reply);

	//MyBatis는 두 개 이상의 데이터를 파라미터로 전달하기 위해서는 1) 별도의 객체로 구성, 2) map을 이용, 3) @param을 이용 
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	// 댓글 숫자파악
	public int getCountByBno(Long bno);
	
}
