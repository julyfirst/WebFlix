package com.project.webflix.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j2
public class BoardControllerTests {
	
	@Setter(onMethod_= @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	// 전체 게시글 목록 불러오기
	
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/bb/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	//@Test
	public void testListPaging() throws Exception{
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/bb/list")
				.param("pageNum", "2")
				.param("amount", "50"))				
				.andReturn().getModelAndView().getModelMap());
	}
	
	// 데이터 추가
	//@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/bb/register")
				.param("title", "테스트 새글 제목입니당ㅇㅇ")
				.param("content", "테스트 새글 내용입니당ㅇ")
				.param("writer", "user00")
		).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	// 데이터 조회
	// @Test
	public void testGet() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/bb/get")
				.param("bno", "12"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	// 수정처리
	//@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc.
				perform(MockMvcRequestBuilders.post("/bb/modify")
				.param("bno", "12")
				.param("title", "mock수정된 테스트 새글 제목")
				.param("content", "mock수정된 테스트 새글 내용")
				.param("writer", "나플라"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	
	// 삭제처리
	//@Test
	public void testRemove() throws Exception{
			String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/bb/remove")
					.param("bno", "14"))
					.andReturn().getModelAndView().getViewName();
			log.info(resultPage);
	}
}
