package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.CartDTO;

public interface CartDAO {
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	int insertCart(CartDTO cartDTO) throws SQLException;
	
	/**
	 * cart테이블에 있는 모든 정보 가져오기
	 * */
	List<CartDTO> selectAllCart(String id) throws SQLException;
	
	/**
	 * 장바구니 상품 삭제
	 * */
	int deleteCart(int productCode) throws SQLException;
	
	
}
