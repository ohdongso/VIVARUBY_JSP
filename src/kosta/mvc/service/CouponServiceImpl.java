package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.CouponDAO;
import kosta.mvc.dao.CouponDAOImpl;
import kosta.mvc.dto.CouponDTO;

public class CouponServiceImpl implements CouponService{
	
	private CouponDAO couponDAO = new CouponDAOImpl();
	
	/**
	 * 발급받은 쿠폰조회
	 * */
	@Override
	public List<CouponDTO> selectAllCoupon(String id) throws SQLException {
		List<CouponDTO> list = couponDAO.selectAllCoupon(id);

		return list;
	}
	
	/**
	 * 발급받은 쿠폰삭제
	 * */
	@Override
	public void deleteCoupon(int couponCode) throws SQLException {
		int result = couponDAO.deleteCoupon(couponCode);
		if(result == 0) {
			throw new SQLException("쿠폰이 삭제되지 않았습니다.");
		}
	}
	
	
	
}