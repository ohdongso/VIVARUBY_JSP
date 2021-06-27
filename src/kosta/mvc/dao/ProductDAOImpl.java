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
	 * 상품삭제
	 * */
	@Override
	public int delete(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql ="DELETE FROM PRODUCT WHERE PRODUCT_CODE = ?";
		int result=0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, productCode);
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;	
	}
	
	/**
	 * 상품등록
	 * */
	@Override
	public int insertProduct(ProductDTO productDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL,?,?,?,0,?,?,?,?,?,null,default)";

		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, productDTO.getProductCategory());
			ps.setInt(2, productDTO.getProductPrice());
			ps.setInt(3, productDTO.getProductStock());
			ps.setInt(4, productDTO.getProductGender());
			ps.setInt(5, productDTO.getProductCapacity());
			ps.setString(6, productDTO.getProductName());
			ps.setString(7, productDTO.getProductContent());
			ps.setString(8, productDTO.getProductImg());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	/**
	 * 전체 상품 검색
	 * */
	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = 1 ORDER BY PRODUCT_CODE DESC";
		
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
		
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CATEGORY = 1 ORDER BY PRODUCT_SELL DESC";
		
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
	
	/**
	 * 상품구매수량 증가.
	 * */
	@Override
	public void upQty(int productCode) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "UPDATE PRODUCT SET PRODUCT_SELL = (PRODUCT_SELL + 1) WHERE PRODUCT_CODE = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCode);
			
			ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
	}
	
	/**
	 * 상품재고 감소
	 * */
	@Override
	public void downStock(int productCode) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "UPDATE PRODUCT SET PRODUCT_STOCK = (PRODUCT_STOCK - 1) WHERE PRODUCT_CODE = ?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productCode);
			
			ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
	}
	
	
}