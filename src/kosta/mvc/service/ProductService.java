package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.ProductDTO;

public interface ProductService {
	/**
	 * 전체 상품 검색
	 * */
	List<ProductDTO> selectAll() throws SQLException;
	
	/**
	 * 배스트 상품 조회
	 * */
	List<ProductDTO> selectMaxPrice() throws SQLException;
	
	/**
	 * 상품상세보기
	 * */
	ProductDTO productDetail(int productCode) throws SQLException;
	
	/**
	 * 카테고리별 제품 검색.
	 */
	List<ProductDTO> selectProCategory(int category) throws SQLException;
	
	
}
