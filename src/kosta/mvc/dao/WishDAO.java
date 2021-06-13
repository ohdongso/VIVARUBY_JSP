package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.WishDTO;

public interface WishDAO {
	/**
	 * 아이디에 해당하는 관심상품 전체 검색.
	 * */
	List<WishDTO> selectAllWish(String id) throws SQLException;
	
	/**
	 * id에 해당하는 wish가 있는지 검색
	 * */
	WishDTO selectWish(String id, int productCode); 
	
	
	/**
	 * 관심상품 등록
	 * */
    int insertWish(int productCode, String id);
	
	/**
	 * 관심상품 삭제
	 * */
    int deleteWish(int productCode) throws SQLException;
    
	/**
	 * 관심상품 장바구니에 담기
	 * */
	
}