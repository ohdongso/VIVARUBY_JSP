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
		
		String sql = "SELECT * FROM PRODUCT ORDER BY PRODUCT_RDATE";
		
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
	 * 배스트 상품 조회
	 * */
	@Override
	public List<ProductDTO> selectMaxPrice() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM PRODUCT ORDER BY PRODUCT_SELL DESC";
		
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

	/**
	 * 카테고리별 제품 검색.
	 */
	@Override
	public List<ProductDTO> selectProCategory(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? ORDER BY PRODUCT_CODE DESC";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	/**
	 * 용량 30~49
	 * */
	@Override
	public List<ProductDTO> selectProductCapacity(int category, int min, int max) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? AND PRODUCT_CAPACITY BETWEEN ? AND ?";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			ps.setInt(2, min);
			ps.setInt(3, max);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	/**
	 * 최신상품 검색
	 * */
	@Override
	public List<ProductDTO> selectNewProduct(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? ORDER BY PRODUCT_RDATE";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
			
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	/**
	 * 최신상품 검색
	 * */
	@Override
	public List<ProductDTO> selectProductName(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? ORDER BY PRODUCT_NAME ASC";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	/**
	 * 상품명 인기순 검색
	 * */
	
	@Override
	public List<ProductDTO> selectQtySell(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? ORDER BY PRODUCT_SELL DESC";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	
	/**
	 * 낮은가격 상품검색
	 * */
	@Override
	public List<ProductDTO> selectMinPrice(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? ORDER BY PRODUCT_PRICE ASC";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	
	/**
	 * 높은가격 상품검색
	 * */
	@Override
	public List<ProductDTO> selectMaxPrice(int category) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? ORDER BY PRODUCT_PRICE DESC";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
		
	/**
	 * 삼품명 검색
	 * */
	@Override
	public List<ProductDTO> selectProName(int category, String productName) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = ? AND PRODUCT_NAME LIKE '%" + productName + "%'";
		ProductDTO productDTO = null;
		List<ProductDTO> list = new ArrayList<>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			
				list.add(productDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
		
	}
	
}