package com.project.webflix.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.webflix.domain.MemberVO;
import com.project.webflix.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/sp/*")
//@AllArgsConstructor
// SignUpController는 하나의 클래스 내에서 여러 메서드를 작성하고 request mapping등을 이용해 url을 분기하는 구조로 작성할 수 있음
// 원하는 기능을 호출
public class MemberController {
	
	@Setter(onMethod_= @Autowired)
	private MemberService service;
	
	@Setter(onMethod_= @Autowired)
	private PasswordEncoder pwencoder;
	
	// @AllArgsConstructor 같은의미
	public MemberController(MemberService service) {
		this.service = service;
	}

	// 회원가입 입력페이지 보여주는 역활
	@GetMapping("/signUp")
	public void signUp() {
	}
	
	// 회원가입
	@PostMapping("/signUp")
	public String signUp(MemberVO memberVO, RedirectAttributes rttr) {
		log.info("create"+ memberVO);
		
		String inputpwd = memberVO.getUserpw();
		String encryption = pwencoder.encode(inputpwd);
		memberVO.setUserpw(encryption);
		
		service.create(memberVO);
		rttr.addFlashAttribute("result",memberVO.getId());
		return "redirect:/"; 
	}

	// 가입된 회원 리스트 불러오기
	@GetMapping("/memberList")
	public void memberList(Model model) {
		log.info("memberList......");
		model.addAttribute("memberList", service.getList());
	}
	
	// 아이디찾기
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "/sp/findIdForm";
	}
	
	// 아이디찾기
	@PostMapping("/findIdForm")
		public void findIdForm(@RequestParam("email") String email, Model model) {
			log.info("findIdForm....");
			model.addAttribute("msg", "고객님의 회원 아이디는"); 
			model.addAttribute("findId", service.find_id(email));
	}
	
	// 비밀번호 찾기 페이지만 나타남
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "/sp/findPwForm";
	}
	
	// 비밀번호 찾기
	@PostMapping("/findPwForm")
	public void findPwForm(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		log.info("findIdForm....");
		service.find_pw(response, memberVO);
	}
	
	
	/*
	// 전체목록 조회
	// controller는 Model 객체를 이용하여 데이터를 가져오고 view에 데이터를 넘겨 적절한 view를 생성하는 역활	
	@GetMapping("/memberList")
	public void list(MemberCriteria cri, Model model) {
		
		log.info("memberList" + cri);
		model.addAttribute("memberList", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total)); //전체 게시글
	}*/
	
}
