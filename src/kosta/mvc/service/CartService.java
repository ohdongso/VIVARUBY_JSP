package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.CartDTO;

public interface CartService {
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	void insertCart(CartDTO cartDTO) throws SQLException;
	
	/**
	 * cart테이블에 있는 모든 정보 가져오기
	 * */
	List<CartDTO> selectAllCart(String id) throws SQLException;
	
	/**
	 * 장바구니 상품 삭제, deleteWish
	 * */
	void deleteCart(int productCode) throws SQLException;
	
	
}
