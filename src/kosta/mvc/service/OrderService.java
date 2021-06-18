package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dto.ProductDTO;

public interface OrderService {
	/**
	 * 주문페이지 이동시 하나의 제품 주문
	 * */
	ProductDTO oneOrder(int productCode) throws SQLException; 
	
	/**
	 * 주문페이지 이동시 모든 제품을 들고 페이지 이동
	 * */
//	ProductDTO totalOrder(int productCode) throws SQLException; 
	
}