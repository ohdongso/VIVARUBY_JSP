package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.WishDTO;

public interface WishDAO {
	/**
	 * 관심상품 전체검색
	 * */
	
	/**
	 * id에 해당하는 wish가 있는지 검색
	 * */
	WishDTO selectWish(String id) throws SQLException; 
	
	
	/**
	 * 관심상품 등록
	 * */
    
	/**
	 * 관심상품 삭제
	 * */
	
	/**
	 * 관심상품 장바구니에 담기
	 * */
	
}