package com.project.webflix.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.webflix.domain.MemberVO;
import com.project.webflix.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;



/**
 * 
 * @author lsh
 * @date 20-05-26
 *  service-> 가장 중요 비즈니스 영역을 담당
 */
@Service // 가장 중요 계층구조상 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용 -> 정상적으로 작동하기 위해서는 BoardMapper객체 필요
@AllArgsConstructor
@Log4j2
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_= @Autowired)
	private PasswordEncoder pwencoder;
	
	// spring 4.3이상에서는 자동처리
	// 정상적으로 작동하기 위해서는 BoardMapper 객체 필요함
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	// 회원추가
	@Override
	public void create(MemberVO memberVo) {
		log.info("memberVo .........." + memberVo);
		mapper.insert(memberVo);
	}
	
	// 전체 회원 목록 조회
	@Override
	public List<MemberVO> getList() {
		log.info("getList............");
		return mapper.getList();
	}

	// 아이디 찾기
	@Override
	public String find_id(String email) {
		log.info("find_id............");
		return mapper.find_id(email);
	}

	// 비밀번호 찾기
	@Override
	public int update_pw(MemberVO memberVo) {
		log.info("find_pw....");
		return mapper.update_pw(memberVo);
		//return sqlsession.update("member.update_pw", member);
	}

	@Override
	public void send_mail(MemberVO memberVo, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "practicelee@naver.com";
		String hostSMTPpwd = "";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "practicelee@naver.com";
		String fromName = "Spring WebFlix";
		String subject = "";
		String msg = "";
		
		
		if(div.equals("join")) {
			// 회원가입 메일 내용
			subject = "Spring WebFlix 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVo.getUserid() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8080/homepage/member/approval_member.do'>";
			msg += "<input type='hidden' name='email' value='" + memberVo.getEmail() + "'>";
		/*	msg += "<input type='hidden' name='approval_key' value='" + memberVo.getApproval_key() + "'>";*/
			msg += "<input type='submit' value='인증'></form><br/></div>";
			
		}else if(div.equals("find_pw")) {
			subject = "Spring WebFlix 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVo.getUserid()+ "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberVo.getUserpw() ;
			msg += "<p>웹플릭 로그인하기 : ";
			msg += "http://localhost:8080/customLogin"+ "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = memberVo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비밀번호 찾기
		@Override
		public void find_pw(HttpServletResponse response, MemberVO memberVo) throws IOException  {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				
				memberVo.setUserpw(pw);
				
				// 비밀번호 변경 메일 발송
				send_mail(memberVo, "find_pw");
				
				String inputpwd = memberVo.getUserpw();
				String encryption = pwencoder.encode(inputpwd);
				memberVo.setUserpw(encryption);
				
				// 비밀번호 변경
				mapper.update_pw(memberVo);
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
		}
	
	/*
	// 전체 회원목록 조회
	// /rp/list를 할때 처음 페이지수와 첫페이지에 뜨는 갯수를 보여줌 (1, 10)
	@Override
	public List<MemberVO> getList(MemberCriteria cri) {
		log.info("get List with MemberCriteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 전체 회원수
	@Override
	public int getTotal(MemberCriteria cri) {
		log.info("getTotalCount....." + cri);
		return mapper.getTotalCount(cri);
	}
*/
}
	
