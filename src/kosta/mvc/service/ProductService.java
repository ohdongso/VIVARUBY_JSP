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
	 * 상품상세보기
	 * */
	ProductDTO productDetail(int productCode) throws SQLException;
	
	
	
	
	
}