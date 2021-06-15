package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.CouponDTO;

public interface CouponService {
	/**
	 * 발급받은 쿠폰조회
	 * */
	List<CouponDTO> selectAllCoupon(String id) throws SQLException;
	
	/**
	 * 발급받은 쿠폰삭제
	 * */
	void deleteCoupon(int couponCode) throws SQLException;

	
}