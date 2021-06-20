package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String sql = "INSERT INTO COUPON VALUES(COUPON_SEQ.NEXTVAL,?,?,?,?,default,default,sysdate+20)";
		
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

	/**
	 * 발급받은 쿠폰조회
	 * */
	@Override
	public List<CouponDTO> selectAllCoupon(String id) {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CouponDTO> list = new ArrayList<>();
		String sql ="SELECT * FROM COUPON WHERE ID = ?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new CouponDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), 
						rs.getString(6), rs.getString(7), rs.getString(8)));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	
	/**
	 * 발급받은 쿠폰삭제
	 * */
	@Override
	public int deleteCoupon(int couponCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "DELETE FROM COUPON WHERE COUPON_CODE = ?";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, couponCode);
	
			result = ps.executeUpdate();		
		} finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
}