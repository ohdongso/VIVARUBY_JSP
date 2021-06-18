package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dao.OrderDAO;
import kosta.mvc.dao.OrderDAOImpl;
import kosta.mvc.dto.ProductDTO;

public class OrderServiceImpl implements OrderService {
	OrderDAO orderDAO = new OrderDAOImpl();
	
	/**
	 * 주문페이지 이동시 하나의 제품 주문
	 * */
	@Override
	public ProductDTO oneOrder(int productCode) throws SQLException {
		ProductDTO productDTO = orderDAO.oneOrder(productCode);
		
		if(productDTO == null) {
			throw new SQLException("상품이 조회되지 않았습니다.");
		}
		
		return productDTO;
	}
	
	
	
	
	
}
