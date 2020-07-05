package com.project.webflix.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j2;


/**
 * 
 * @author lsh
 * @Date 20-05-25
 * 테스트
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@Log4j2
public class MemberTests {
	
	@Setter(onMethod_= @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_= @Autowired)
	private DataSource ds;
	
	// 회원생성후 비밀번호 암호화
	@Test
	public void testInsertMember() {
		String sql = "insert into tbl_member(id, userid, userpw, username, email) values(seq_member.nextval,?,?,?,?)";
		
		for(int i = 0; i < 100 ; i++) {
			Connection con = null;	
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				//pstmt.setLong(1, i+1);
				// 암호화
				pstmt.setString(3, pwencoder.encode("pw" + i));
				pstmt.setString(5, "spring" + i + "naver.com");
				
				if(i < 80) {
					pstmt.setString(2, "user" + i);
					pstmt.setString(4, "일반사용자" + i);
				} else if(i<90) {
					pstmt.setString(2, "manger" + i);
					pstmt.setString(4, "운영자" + i);
				} else {
					pstmt.setString(2, "admin" + i);
					pstmt.setString(4, "관리자" + i);
				}
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {}}
				if(con != null) {try {con.close();} catch(Exception e) {}}
			}
		}
	}
	// 권한 설정
	//@Test
	public void testInsertAuth() {
		String sql = "insert into tbl_member_authorities(id,userid, authorities) values(?, ?,?)";
		
		for(int i = 0; i < 100 ; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, i+1);
				
				if(i < 80) {
					pstmt.setString(2, "user" + i);
					pstmt.setString(3, "ROLE_USER");
				} else if(i<90) {
					pstmt.setString(2, "manger" + i);
					pstmt.setString(3, "ROLE_MEMBER");
				} else {
					pstmt.setString(2, "admin" + i);
					pstmt.setString(3, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {}}
				if(con != null) {try {con.close();} catch(Exception e) {}}
			}
		}
	}
	
	// 회원생성후 비밀번호 암호화22
	//@Test
	public void testInsertMember2() {
		String sql = "insert into tbl_member(userid, userpw, username) values(?,?,?)";
		
		for(int i = 0; i < 100 ; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				// 암호화
				pstmt.setString(2, pwencoder.encode("pw" + i));
				
				if(i < 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "일반사용자" + i);
				} else if(i<90) {
					pstmt.setString(1, "manger" + i);
					pstmt.setString(3, "운영자" + i);
				} else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(3, "관리자" + i);
				}
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {}}
				if(con != null) {try {con.close();} catch(Exception e) {}}
			}
		}
	}
	// 권한 설정
	//@Test
	public void testInsertAuth2() {
		String sql = "insert into tbl_member_auth(userid, auth) values(?,?)";
		
		for(int i = 0; i < 100 ; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i < 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if(i<90) {
					pstmt.setString(1, "manger" + i);
					pstmt.setString(2, "ROLE_MEMBER" );
				} else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();} catch(Exception e) {}}
				if(con != null) {try {con.close();} catch(Exception e) {}}
			}
		}
	}
	


	
	
	
	
	
}
