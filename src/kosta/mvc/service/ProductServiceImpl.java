package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.ProductDAO;
import kosta.mvc.dao.ProductDAOImpl;
import kosta.mvc.dto.ProductDTO;

public class ProductServiceImpl implements ProductService {
	
	private ProductDAO productDAO = new ProductDAOImpl();
	
	/**
	 * 전체 상품 검색
	 * */
	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		return productDAO.selectAll();
	}
	
	/**
	 * 배스트 상품 조회
	 * */
	@Override
	public List<ProductDTO> selectMaxPrice() throws SQLException {
		return productDAO.selectMaxPrice();
	}
	
	/**
	 * 상품상세보기
	 * */
	@Override
	public ProductDTO productDetail(int productCode) throws SQLException {
		ProductDTO productDTO = productDAO.productDetail(productCode);
		
		return productDTO;
	}

	/**
	 * 카테고리별 제품 검색.
	 */
	@Override
	public List<ProductDTO> selectProCategory(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectProCategory(category);
		return productList;
	}
	
	
	
	
	
}