package com.project.webflix.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.webflix.domain.ReplyPageDTO;
import com.project.webflix.domain.ReplyVO;
import com.project.webflix.mapper.BoardMapper;
import com.project.webflix.mapper.ReplyMapper;
import com.project.webflix.service.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
/**
 * 
 * @author Administrator
 * @Date 20-05-22
 * 댓글 CRUD
 * <pre>
 * 		BoardMapper boardMapper 주입
 * 		ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는 @Transactional의 처리 필요
 * </pre>
 *
 */
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_=@Autowired)
	private ReplyMapper replymapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO replyVO) {
		log.info("삽입"+replyVO);
		boardMapper.updateReplyCnt(replyVO.getBno(), 1);
		return replymapper.insert(replyVO);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("조회" + rno);
		return replymapper.read(rno);
	}

	// 수정
	@Override
	public int modify(ReplyVO replyVO) {
		log.info("modify...." + replyVO);
		return replymapper.update(replyVO);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("삭제" + rno);
		ReplyVO vo = replymapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return replymapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("댓글목록 or 게시글 " + bno);
		return replymapper.getListWithPaging(cri, bno);
		
	}

	// 댓글 페이징 처리
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(
				replymapper.getCountByBno(bno),
				replymapper.getListWithPaging(cri, bno));
	}
}
