package com.project.webflix.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.webflix.domain.MovieVO;
import com.project.webflix.domain.OrderDTO;
import com.project.webflix.mapper.MovieMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;



/**
 * 
 * @author lsh
 * @date 20-06-08
 *  service-> 가장 중요 비즈니스 영역을 담당
 */
@Service // 가장 중요 계층구조상 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용 -> 정상적으로 작동하기 위해서는 MovieMapper객체 필요
@AllArgsConstructor
@Log4j2
public class MovieServiceImpl implements MovieService {
	
	// spring 4.3이상에서는 자동처리
	// 정상적으로 작동하기 위해서는 BoardMapper 객체 필요함
	@Setter(onMethod_= @Autowired)
	private MovieMapper mapper;
	
	// 영화구매
	@Override
	public void insert(MovieVO movieVO) {
		log.info("movieVO .........." + movieVO);
		mapper.insert(movieVO);
	}
	
	// 구매목록
	@Override
	public List<MovieVO> getList() {
		log.info("MovieVO getList............");
		return mapper.getList();
	}


}
	
	
