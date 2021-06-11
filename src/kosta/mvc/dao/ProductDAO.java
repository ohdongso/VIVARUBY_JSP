package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.ProductDTO;

public interface ProductDAO {
	/**
	 * 작품 전체 검색
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
}
