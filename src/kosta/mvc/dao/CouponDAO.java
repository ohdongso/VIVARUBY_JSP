package kosta.mvc.dao;

import kosta.mvc.dto.CouponDTO;

public interface CouponDAO {
	/**
	 * 회원가입시 자동 등록되는 쿠폰
	 * */
	void insertCoupon(CouponDTO couponDTO); 
	
	
}