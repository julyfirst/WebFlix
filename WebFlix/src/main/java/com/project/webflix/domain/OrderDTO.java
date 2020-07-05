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
public class OrderDTO {
	
	private Long id; // 주문번호
	private Long movie_id; // 영화코드에 대한 fk 
	private Long  member_id; // 회원에 대한 fk
	private Date purchase_date; // 구입한 날짜
	private String deal_price; // 거래 금액
	private boolean delivery_complete; // download 등의 각종 수단으로 배달 / 배송 완료 여부
	
	private MemberVO member;
	private MovieVO movie;
}
