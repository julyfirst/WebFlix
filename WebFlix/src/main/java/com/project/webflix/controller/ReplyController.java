package com.project.webflix.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.webflix.domain.ReplyPageDTO;
import com.project.webflix.domain.ReplyVO;
import com.project.webflix.service.ReplyService;
import com.project.webflix.service.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/rp/*")
@RestController
@Log4j2
@AllArgsConstructor
/**
 * 
 * @author lsh
 * @Date 20-05-22
 * 댓글 처리 
 * 
 */
public class ReplyController {
	
	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	/* 
	 * REST 방식으로 처리할 떄 주의해야 하는 점은 브라우저나 외부에서 서버를 호출할 떄 데이터 포맷과
	 * 서버에서 보내주는 데이터의 타입을 명확히 설계해야 함
	 * 
	 * 댓글을 등록의 경우 브라우저에서는 json타입으로 된 데이터를 전송하고
	 *  서버에서는 댓글의 처리 결과가 정상적으로 되었는지 문자열로 결과를 알려 주도록 함
	 */
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json",	produces = {MediaType.TEXT_PLAIN_VALUE})	
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO){
		log.info("ReplyVO : " + replyVO);
		int insertCount = service.register(replyVO);
		log.info("Reply Insert count : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	/**
	 *  특정 게시물의 댓글 목록을 확인하는 작업
	 *  리플라이 컨트롤러의 getList()메소드는 BoardCriteria를 이용해서 파리미터를 수집하는데
	 *  /{bno}/{page}의 page값은Criteria를 생성해서 직접 처리해야함 
	 *  게시물 번호는 @pathvariable을 이용해서 파라미터로 처리 
	 * @param page
	 * @param bno
	 * @return
	 *  
	 *  
	 */
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
					})	
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		log.info("getList");
		
		Criteria cri = new Criteria(page,10);
		log.info("get Reply list bno : " + bno);
		log.info(cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	/**
	 * 댓글 조회
	 * @param rno
	 * @return
	 */
	@GetMapping(value= "/{rno}", 
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})	
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		log.info("get 조회" + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	/**
	 * 댓글 삭제
	 * @param rno
	 * @return
	 */
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value= "/{rno}", 
			produces = {
					MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno){
		log.info("remove 삭제" + rno);
		log.info("replyer" + vo.getReplyer());
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/**
	 * 댓글 수정 
	 * 댓글 수정은 JSON 형태로 전달되는 데이터와 파라미터로 전달되는 댓글 번호(rno)를 처리함
	 * PUT방식이나 PATCH 방식을 이용하도록 처리하고 실제 수정되는 데이터는 JSON포맷이므로 @RequestBody를 이용해서 처리함
	 * @RequestBody로 처리되는 데이터는 일반 파라미터나 @PathVariable 파라미터를 처리할 수 없기 때문에 직접ㅈ 처리해주는 부분 주의`	
	 * 
	 * @param replyVO
	 * @param rno
	 * @return
	 */
	@PreAuthorize("principal.username == #vo.replyer")
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value= "/{rno}",
			consumes ="application/json")
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO replyVO,
			@PathVariable("rno") Long rno){
		replyVO.setRno(rno);
		log.info("rno : " + rno);
		log.info("modify: " + replyVO);
			
		return service.modify(replyVO) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
			
}
