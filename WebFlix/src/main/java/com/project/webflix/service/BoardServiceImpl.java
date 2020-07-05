package com.project.webflix.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.webflix.domain.BoardVO;
import com.project.webflix.mapper.BoardMapper;
import com.project.webflix.service.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Service // 가장 중요 계층구조상 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용 -> 정상적으로 작동하기 위해서는 BoardMapper객체 필요
@AllArgsConstructor
@Log4j2
/**
 * 
 * @author lsh
 * @date 20-05-15
 *  service-> 가장 중요 비즈니스 영역을 담당
 */
public class BoardServiceImpl implements BoardService {

	// spring 4.3이상에서는 자동처리
	// 정상적으로 작동하기 위해서는 BoardMapper 객체 필요함
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	// 데이터 추가
	@Override
	public void register(BoardVO board) {
		log.info("register .........." + board);
		mapper.insertSelectKey(board);
	}
	
	/* 전체 목록조회
	@Override
	public List<BoardVO> getList() {
		log.info("getList............");
		return mapper.getList();
	}*/
	
	// 전체 목록조회 
	// /bb/list를 할때 처음 페이지수와 첫페이지에 뜨는 갯수를 보여줌 (1, 10)
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 게시판
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalCount....." + cri);
		return mapper.getTotalCount(cri);
	}
		
	@Override
	public BoardVO get(Long bno) {
		log.info("get bno..........."+ bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify......." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove......." + bno);
		return mapper.delete(bno) == 1;
	}
	
	

}
