package com.project.webflix.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
/**
 * 
 * @author LeeSangHyun
 * @date 20-07-14
 * 
 * 이메일 본인인증 추가 gmail 사용 
 *
 */
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
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
		log.info("create" + memberVO);

		String inputpwd = memberVO.getUserpw();
		String encryption = pwencoder.encode(inputpwd);
		memberVO.setUserpw(encryption);

		service.create(memberVO);
		rttr.addFlashAttribute("result", memberVO.getId());
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

	// 이메일 인증 페이지
	@GetMapping("/email")
	public String email() {
		return "/sp/email";
	}

	// 이메일 인증 보내기
	@PostMapping("/auth")
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int CertificationNumber = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "joolae200@gamil.com";
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 WebFlix를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + CertificationNumber + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/sp/emailAuth"); // 뷰의이름
		mv.addObject("CertificationNumber", CertificationNumber);

		System.out.println("mv : " + mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();

		
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}
	
	 /**
	  * 
	  * @param emailAuth
	  * @param CertificationNumber
	  * @param response_equals
	  * @return
	  * @throws IOException
	  * 
	  * 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    	내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
    	틀리면 다시 원래 페이지로 돌아오는 메소드
	  */
    @PostMapping(value = "/join_auth{CertificationNumber}")
    public ModelAndView join_auth(String emailAuth, @PathVariable String CertificationNumber, HttpServletResponse response_equals) throws IOException {
 
        System.out.println("emailAuth : "+emailAuth);
        
        System.out.println("CertificationNumber : "+CertificationNumber);
        
        
        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("/sp/signUp");
        
        mv.addObject("e_mail",emailAuth);
        
        if (emailAuth.equals(CertificationNumber)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
            
            mv.setViewName("/sp/signUp");            
          
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
            
            
        }else if (emailAuth != CertificationNumber) { // 인증번호가 맞지 않을경우
            
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("/sp/emailAuth");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
            
        }    
    
        return mv;
        
    }


	/*
	 * // 전체목록 조회 // controller는 Model 객체를 이용하여 데이터를 가져오고 view에 데이터를 넘겨 적절한 view를
	 * 생성하는 역활
	 * 
	 * @GetMapping("/memberList") public void list(MemberCriteria cri, Model model)
	 * {
	 * 
	 * log.info("memberList" + cri); model.addAttribute("memberList",
	 * service.getList(cri)); int total = service.getTotal(cri); log.info("total : "
	 * + total); model.addAttribute("pageMaker", new PageDTO(cri, total)); //전체 게시글
	 * }
	 */

}
