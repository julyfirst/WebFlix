package com.project.webflix.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.webflix.domain.BoardVO;
import com.project.webflix.domain.PageDTO;
import com.project.webflix.service.BoardService;
import com.project.webflix.service.domain.BoardCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/bb/*")
//@AllArgsConstructor
// BoardController는 하나의 클래스 내에서 여러 메서드를 작성하고 request mapping등을 이용해 url을 분기하는 구조로 작성할 수 있음
// 원하는 기능을 호출
public class BoardController {

	@Setter(onMethod_= @Autowired)	
	private BoardService service;
	
	// @AllArgsConstructor 같은의미
	public BoardController(BoardService service) {
		this.service = service;
	}

	// 전체목록 조회
	// controller는 Model 객체를 이용하여 데이터를 가져오고 view에 데이터를 넘겨 적절한 view를 생성하는 역활
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}
	
	// 전체목록 조회
	// controller는 Model 객체를 이용하여 데이터를 가져오고 view에 데이터를 넘겨 적절한 view를 생성하는 역활	
	@GetMapping("/list")
	public void list(BoardCriteria cri, Model model) {
		
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total)); //전체 게시글
	}
	                         
	// 게시판 입력페이지 보여주는 역활
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	// 데이터 추가
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register"+ board);
		
		service.register(board);
		rttr.addFlashAttribute("result",board.getBno());
		return "redirect:/bb/list"; //리다이렉트 하는이유는 도배방지를 위하여
	}
	
	// 특정번호 조회, 수정페이지 이동
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno")Long bno, @ModelAttribute("cri") BoardCriteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	// 수정처리
	// 아이디 인증 과정 ->
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, BoardCriteria cri, RedirectAttributes rttr) {
		log.info("modify 모디파이:" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/bb/list" + cri.getListLink();
	}
	
	// 삭제처리
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, BoardCriteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove....."+ bno);
		
		if(service.remove(bno)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/bb/list" + cri.getListLink();
	}
	

}
