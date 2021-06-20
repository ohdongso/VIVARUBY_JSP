package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.ProductDTO;

public interface OrderDAO {
	/**
	 * 주문페이지 이동시 하나의 제품 주문
	 * */
	ProductDTO oneOrder(int productCode) throws SQLException;
	
}