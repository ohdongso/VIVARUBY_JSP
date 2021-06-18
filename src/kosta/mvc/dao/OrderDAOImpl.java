package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kosta.mvc.dto.ProductDTO;
import kosta.mvc.util.DbUtil;

public class OrderDAOImpl implements OrderDAO {
	/**
	 * 주문페이지 이동시 하나의 제품 주문
	 * */
	@Override
	public ProductDTO oneOrder(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CODE = ?";
		ProductDTO productDTO = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, productCode);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return productDTO;
	}	
	
	
	
	
	
}