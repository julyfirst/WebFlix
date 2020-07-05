package com.project.webflix.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.webflix.domain.BoardVO;
import com.project.webflix.service.domain.Criteria;
/**
 * 
 * @author lsh
 * @Date 20-05-30
 * 
 * <pre>
 * 		20-06-24
 * 		댓글수 보이게 수정  updateReplyCnt 메소드 추가
 * </pre>
 * 
 */
public interface BoardMapper {
	
	// @Select("select * from tbl_board where bno>0")
	// 전체 테이블 조회
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	// int type 이유 -> 몇개의 데이터가 수정되었는가를 처리할 수 있도록  int 타입 메서드 설계
	// void도 가능
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	// updateReplyCnt는 해당 게시물의 번호인 bno와 증가나 감소를 의미하는 amount 변수에 파라미터를 받을 수 있도록 처리
	// 댓글이 등록되면 1이 증가하고 댓글이 삭제되면 1이감소 mybatis의 sql을 처리하기 위해선
	// 기본적으로 하나의 파라미터 타입을 사용하기 때문에 위와 같이 2개이상의 데이터를 전달하려면 @Param이라는 어노테이션 사용
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	
	
}
