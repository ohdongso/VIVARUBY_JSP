package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dto.CartDTO;

public interface CartService {
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	void insertCart(CartDTO cartDTO) throws SQLException;
	
	
}
