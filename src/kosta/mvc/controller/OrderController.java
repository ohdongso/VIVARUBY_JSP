package kosta.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dao.MemberDAO;
import kosta.mvc.dao.MemberDAOImpl;
import kosta.mvc.dto.MemberDTO;
import kosta.mvc.dto.ProductDTO;
import kosta.mvc.service.OrderService;
import kosta.mvc.service.OrderServiceImpl;

public class OrderController implements Controller{
	
	private OrderService orderService = new OrderServiceImpl();
	private MemberDAO memberDAO = new MemberDAOImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 주문페이지 이동시 하나의 제품 주문
	 * */
	public ModelAndView oneOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		ProductDTO productDTO = orderService.oneOrder(productCode);
		
		// productDTO에 수량, 총가격 저장
		int cartQty = Integer.parseInt(request.getParameter("qty")) ;
		productDTO.setCartQty(cartQty);
		productDTO.setTotalPrice(cartQty * productDTO.getProductPrice());
		
		// 제품
		List<ProductDTO> productList = new ArrayList<>();
		productList.add(productDTO);
		
		// 회원정보
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("loginUser"));
		MemberDTO memberDTO = memberDAO.myInform(id);
		
		ModelAndView mv = new ModelAndView();
		
		request.setAttribute("productList", productList);
		request.setAttribute("memberDTO", memberDTO);
		
		
		mv.setViewName("v_order/order.jsp");
		
		return mv;
	}
		
	/**
	 * 주문페이지 이동시 모든 제품을 들고 페이지 이동
	 * */
	public ModelAndView totalOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return null;
	}
	
}