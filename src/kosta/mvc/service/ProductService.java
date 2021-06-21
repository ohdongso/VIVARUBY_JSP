package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.controller.ModelAndView;
import kosta.mvc.dto.ProductDTO;

public interface ProductService {
	/**
	 * 상품삭제
	 * */
	void delete(int productCode) throws SQLException;
	
	/**
	 * 상품등록
	 * */
	void insertProduct(ProductDTO productDTO) throws SQLException; 
	
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
	
	/**
	 * 상품용량 검색
	 * */
	List<ProductDTO> selectProductCapacity(int category, int min, int max) throws SQLException;
	
	/**
	 * 최신상품 검색
	 * */
	List<ProductDTO> selectNewProduct(int category) throws SQLException;
	
	/**
	 * 상품명 검색
	 * */
	List<ProductDTO> selectProductName(int category) throws SQLException;
	
	/**
	 * 상품명 인기순 검색
	 * */
	List<ProductDTO> selectQtySell(int category) throws SQLException;
	
	/**
	 * 낮은가격 상품검색
	 * */
	List<ProductDTO> selectMinPrice(int category) throws SQLException;

	/**
	 * 높은가격 상품검색
	 * */
	List<ProductDTO> selectMaxPrice(int category) throws SQLException;
	
	/**
	 * 삼품명 검색
	 * */
	List<ProductDTO> selectProName(int category, String productName) throws SQLException;
	
}