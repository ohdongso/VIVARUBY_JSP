package kosta.mvc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dao.CartDAO;
import kosta.mvc.dao.CartDAOImpl;
import kosta.mvc.dao.ProductDAO;
import kosta.mvc.dao.ProductDAOImpl;
import kosta.mvc.dao.WishDAO;
import kosta.mvc.dao.WishDAOImpl;
import kosta.mvc.dto.CartDTO;
import kosta.mvc.dto.ProductDTO;

public class CartServiceImpl implements CartService {
	
	private CartDAO cartDAO = new CartDAOImpl();
	private WishDAO wishDAO = new WishDAOImpl();
	private ProductDAO productDAO = new ProductDAOImpl();
	
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	@Override
	public void insertCart(CartDTO cartDTO) throws SQLException {
		int result = cartDAO.insertCart(cartDTO);
		
		if(result == 0) {
			throw new SQLException("장바구니에 등록되지 않았습니다.");
		} else {
			wishDAO.deleteWish(cartDTO.getProductCode());
		}
		
	}
	
	/**
	 * cart테이블에 있는 모든 정보 가져오기
	 * */
	@Override
	public List<CartDTO> selectAllCart(String id) throws SQLException {
		List<CartDTO> cartList = cartDAO.selectAllCart(id);
			
			return cartList;
	}
	
	/**
	 * 장바구니 상품 삭제, deleteWish
	 * */
	@Override
	public void deleteCart(int productCode) throws SQLException {
		int result = cartDAO.deleteCart(productCode);
		
		if(result == 0) {
			throw new SQLException("상품이 삭제 되지않았습니다.");
		}	
	}
	

	
	
} // CartService끝.
	

	
	
	
	
	
	
	
