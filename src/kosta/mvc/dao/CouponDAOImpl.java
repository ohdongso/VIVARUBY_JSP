package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kosta.mvc.util.DbUtil;

public class CouponDAOImpl implements CouponDAO{
	/**
	 * 회원가입시 자동 등록되는 쿠폰
	 * */
	@Override
	public void insertCoupon(String id) {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO COUPON VALUES(COUPON_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
//			ps.setString(1, id);
//			ps.setString(2, "");		
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(ps, con);
		}
	}
	
	
	
	
}
