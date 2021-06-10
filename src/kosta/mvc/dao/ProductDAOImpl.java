package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.ProductDTO;
import kosta.mvc.util.DbUtil;

public class ProductDAOImpl implements ProductDAO {
	/**
	 * 전체 상품 검색
	 * */
	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM PRODUCT";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductDTO product = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
			    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
				list.add(product);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	/**
	 * 상품상세보기
	 * */
	@Override
	public ProductDTO productDetail(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductDTO productDTO = null;
		
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CODE = ?";
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
