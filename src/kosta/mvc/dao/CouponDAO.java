package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.CouponDTO;

public interface CouponDAO {
	/**
	 * 회원가입시 자동 등록되는 쿠폰
	 * */
	void insertCoupon(CouponDTO couponDTO); 
	
	/**
	 * 발급받은 쿠폰조회
	 * */
	List<CouponDTO> selectAllCoupon(String id) throws SQLException;
	
	/**
	 * 발급받은 쿠폰삭제
	 * */
	int deleteCoupon(int couponCode) throws SQLException;

	
}