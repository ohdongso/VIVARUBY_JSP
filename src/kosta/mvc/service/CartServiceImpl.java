package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dao.CartDAO;
import kosta.mvc.dao.CartDAOImpl;
import kosta.mvc.dao.WishDAO;
import kosta.mvc.dao.WishDAOImpl;
import kosta.mvc.dto.CartDTO;

public class CartServiceImpl implements CartService {
	
	private CartDAO cartDAO = new CartDAOImpl();
	private WishDAO wishDAO = new WishDAOImpl();
	
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	@Override
	public void insertCart(CartDTO cartDTO) throws SQLException {
		int result = cartDAO.insertCart(cartDTO);
		
		if(result == 0) {
			throw new SQLException("장바구니에 등록되지 않았습니다.");
		} else {
			int result1 = wishDAO.deleteWish(cartDTO.getProductCode());
			if(result1 == 0) {
				throw new SQLException("관심상품에서 삭제되지 않았습니다.");
			}
		}
	}
	
	
	
	
	
	
	
}