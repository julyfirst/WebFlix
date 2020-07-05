package com.project.webflix.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.webflix.domain.OrderDTO;
import com.project.webflix.service.MemberService;
import com.project.webflix.service.MovieService;
import com.project.webflix.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/pages/*")
//@AllArgsConstructor
// SignUpController는 하나의 클래스 내에서 여러 메서드를 작성하고 request mapping등을 이용해 url을 분기하는 구조로 작성할 수 있음
// 원하는 기능을 호출
public class MovieController {
	
	@Setter(onMethod_= @Autowired)
	private MovieService service;
	
	@Setter(onMethod_= @Autowired)
	private OrderService o_service;
	
	@Setter(onMethod_= @Autowired)
	private MemberService m_service;
	
	// @AllArgsConstructor 같은의미
	public MovieController(MovieService service) {
		this.service = service;
	}

	// 액션차트
	@GetMapping("/chart/action")
	public void chartAction() {
	}
	
	// 멜로차트
	@GetMapping("/chart/dramas")
	public void chartDramas() {
	
	}
	
	// 공포차트
	@GetMapping("/chart/horror")
	public void chartHorror() {
		
	}
	
	// 애니메이션차트
	@GetMapping("/chart/animation")
	public void chartAnimation() {
	}
	
	
	/*
	 * 액션영화 
	 */
	
	// 액션영화 루키스
	@GetMapping("detail/action/rookies")
	public void detailActionRookies(Model model) {
		log.info("detail/action/rookies......");
		model.addAttribute("rookies", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 액션영화 루키스 구매
	@PostMapping("detail/action/rookies")
	public String detailActionRookies(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
			
	}
	
	
	// 액션영화 리벤지
	@GetMapping("detail/action/revenge")
	public void detailActionRevenge(Model model) {
		log.info("detail/action/revenge......");
		model.addAttribute("revenge", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 액션영화 리벤지 구매
	@PostMapping("detail/action/revenge")
	public String detailActionRevenge(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	// 액션영화 킬러보디가드
	@GetMapping("detail/action/killer_bodyguard")
	public void detailActionKillerBodyguard(Model model) {
		log.info("detail/action/killer_bodyguard......");
		model.addAttribute("killer", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 액션영화 킬러보디가드 구매
	@PostMapping("detail/action/killer_bodyguard")
	public String detailActionKillerBodyguard(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	/*
	 * 멜로영화 
	 */
	
	
	// 멜로영화 비커밍 제인
	@GetMapping("detail/dramas/becoming_jane")
	public void detaildramasBecoming_jane(Model model) {
		log.info("detail/action/becoming_jane......");
		model.addAttribute("jane", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 멜로영화 비커밍제인 구매
	@PostMapping("detail/dramas/becoming_jane")
	public String detaildramasBecoming_jane(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	// 멜로영화 동감
	@GetMapping("detail/dramas/diffo")
	public void detail_diffo(Model model) {
		log.info("detail/action/diffo......");
		model.addAttribute("diffo", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 멜로영화 동감 구매
	@PostMapping("detail/dramas/diffo")
	public String detail_diffo(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	// 멜로영화 레이니
	@GetMapping("detail/dramas/rainy_newyork")
	public void detail_rainy_newyork(Model model) {
		log.info("detail/action/rainy_newyork......");
		model.addAttribute("newyork", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 멜로영화 레이니 구매
	@PostMapping("detail/dramas/rainy_newyork")
	public String detail_rainy_newyork(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	/*
	 * 애니메이션 
	 */
	
	
	// 애니메이션 루팡
	@GetMapping("detail/animation/lupin3_the_first")
	public void detail_lupin(Model model) {
		log.info("detail/action/lupin3_the_first......");
		model.addAttribute("lupin3_the_first", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 애니 루팡 구매
	@PostMapping("detail/animation/lupin3_the_first")
	public String detail_lupin(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	// 애니메이션 모닝플라워
	@GetMapping("detail/animation/morning_flower")
	public void detail_morning_flower(Model model) {
		log.info("detail/action/morning_flower......");
		model.addAttribute("flower", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 애니 모닝플라워 구매
	@PostMapping("detail/animation/morning_flower")
	public String detail_morning_flower(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	// 애니메이션 차일드
	@GetMapping("detail/animation/weater_child")
	public void detail_weater_child(Model model) {
		log.info("detail/action/weater_child......");
		model.addAttribute("child", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 애니 차일드 구매
	@PostMapping("detail/animation/weater_child")
	public String detail_weater_child(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	/*
	 * 공포영화
	 */
	
	// 공포영화 호텔레이크
	@GetMapping("detail/horror/hotel_lake")
	public void detail_hotel_lake(Model model) {
		log.info("detail/action/hotel_lake......");
		model.addAttribute("hotel", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
		
	// 공포영화 호텔레이크 구매
	@PostMapping("detail/horror/hotel_lake")
	public String detail_hotel_lake(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	// 공포영화 오픈더 도어
	@GetMapping("detail/horror/open_door")
	public void detail_open_door(Model model) {
		log.info("detail/action/open_door......");
		model.addAttribute("door", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 공포영화 오픈더 도어구매
	@PostMapping("detail/horror/open_door")
	public String detail_open_door(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	// 공포영화 그집
	@GetMapping("detail/horror/this_house")
	public void detail_this_house(Model model) {
		log.info("detail/action/this_house......");
		model.addAttribute("house", service.getList());
		model.addAttribute("member", m_service.getList());
		
	}
	
	// 공포영화 그집 구매
	@PostMapping("detail/horror/this_house")
	public String detail_this_house(OrderDTO orderDTO, RedirectAttributes rttr) {
		log.info("addmovie"+ orderDTO);
		
		o_service.insert(orderDTO);		
		rttr.addFlashAttribute("result", orderDTO.getId());
		return "redirect:/pages/chart/action"; //리다이렉트 하는이유는 도배방지를 위하여
		
	}
	
	

	
}
