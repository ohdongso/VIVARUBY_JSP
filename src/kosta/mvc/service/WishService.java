package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.WishDTO;

public interface WishService {
	/**
	 * 아이디에 해당하는 관심상품 전체 검색.
	 * */
	List<WishDTO> selectAllWish(String id) throws SQLException;
	
	/**
	 * 관심상품 상제
	 * */
	void deleteWish(int productCode) throws SQLException;
	
	
	
}