package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kosta.mvc.dto.CouponDTO;
import kosta.mvc.util.DbUtil;

public class CouponDAOImpl implements CouponDAO{
	/**
	 * 회원가입시 자동 등록되는 쿠폰
	 * */
	@Override
	public void insertCoupon(CouponDTO couponDTO) {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO COUPON VALUES(COUPON_SEQ.NEXTVAL,?,?,?,?,default,default,default)";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, couponDTO.getId());
			ps.setString(2, couponDTO.getCouponName());		
			ps.setInt(3, couponDTO.getCouponDrate());
			ps.setInt(4, couponDTO.getCouponDprice());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(ps, con);
		}
	}
	
	
	
	
	
	
	
}
