package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kosta.mvc.dto.CartDTO;
import kosta.mvc.util.DbUtil;

public class CartDAOImpl implements CartDAO {
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	@Override
	public int insertCart(CartDTO cartDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, ?, ?, ?)";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, cartDTO.getId());
			ps.setInt(2, cartDTO.getProductCode());
			ps.setInt(3, cartDTO.getCartQty());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
	
		return result;
	}
	
	
	
	


}
