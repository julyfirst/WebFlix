package com.project.webflix.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 
 * @author lsh
 * @Date 20-05-25
 * 회원
 *
 */
@Data
public class MemberVO {
	
	private Long id;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String phonenumber;
	private String birth_date;
	private boolean enabled;
	
	private Date regdate;
	private Date updatedate;
	private List<AuthVO> authList;

}
