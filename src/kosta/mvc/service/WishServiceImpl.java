package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.WishDAO;
import kosta.mvc.dao.WishDAOImpl;
import kosta.mvc.dto.WishDTO;

public class WishServiceImpl implements WishService {
	
	private WishDAO wishDAO = new WishDAOImpl();
	
	/**
	 * 아이디에 해당하는 관심상품 전체 검색.
	 * */
	@Override
	public List<WishDTO> selectAllWish(String id) throws SQLException {
		List<WishDTO> wishList = wishDAO.selectAllWish(id);
		
		return wishList;
	}
	
	/**
	 * 관심상품 삭제
	 * */
	@Override
	public void deleteWish(int productCode) throws SQLException {
		int result = wishDAO.deleteWish(productCode);
	
		if(result == 0) {
			throw new SQLException("관심상품이 삭제 되지 않았습니다.");
		}	
	}
	
	
	
}