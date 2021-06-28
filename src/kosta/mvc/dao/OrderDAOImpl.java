package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.OrderDTO;
import kosta.mvc.dto.ProductDTO;
import kosta.mvc.util.DbUtil;

public class OrderDAOImpl implements OrderDAO {
	/**
	 * 결제시 주문한 상품 주문테이블에 등록
	 * */
	@Override
	public int insertOrder(OrderDTO orderDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO ORDERS VALUES(ORDERS_SEQ.NEXTVAL,?,?,?,?,?, null, null,?,?,?,?,default)";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, orderDTO.getProductCode());
			ps.setString(2, orderDTO.getId());
			ps.setString(3, orderDTO.getOrderName());
			ps.setString(4, orderDTO.getOrderPhone());
			ps.setString(5, orderDTO.getOrderAddr1());
			ps.setInt(6, orderDTO.getOrderPayment());
			ps.setInt(7, orderDTO.getOrderAmount());
			ps.setString(8, orderDTO.getOrderContent());
			ps.setString(9, orderDTO.getOrderDepositor());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 주문테이블에 있는 주문목록 가져오기
	 * */
	@Override
	public List<OrderDTO> selectAllOrderList() throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<OrderDTO> orderList = new ArrayList<>();
		String sql = "SELECT * FROM ORDERS ORDER BY ORDER_CODE";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderDTO orderDTO = new OrderDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),		
				rs.getString(6), rs.getString(7), rs.getString(8),  rs.getInt(9), rs.getInt(10), rs.getString(11),
				rs.getString(12), rs.getString(13));
				
				orderList.add(orderDTO);
			}
			
			
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return orderList;
	}
	
	
	/**
	 * 주문페이지 이동시 하나의 제품 주문
	 * */
	@Override
	public ProductDTO oneOrder(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_CODE = ?";
		ProductDTO productDTO = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, productCode);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				productDTO = new ProductDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), 
					    rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return productDTO;
	}



}