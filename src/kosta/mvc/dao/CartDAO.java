package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.CartDTO;

public interface CartDAO {
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	int insertCart(CartDTO cartDTO) throws SQLException;
}
