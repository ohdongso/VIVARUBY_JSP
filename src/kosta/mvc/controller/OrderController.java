package kosta.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dao.CartDAO;
import kosta.mvc.dao.CartDAOImpl;
import kosta.mvc.dao.CouponDAO;
import kosta.mvc.dao.CouponDAOImpl;
import kosta.mvc.dao.MemberDAO;
import kosta.mvc.dao.MemberDAOImpl;
import kosta.mvc.dao.ProductDAO;
import kosta.mvc.dao.ProductDAOImpl;
import kosta.mvc.dto.CouponDTO;
import kosta.mvc.dto.MemberDTO;
import kosta.mvc.dto.ProductDTO;
import kosta.mvc.service.CouponService;
import kosta.mvc.service.OrderService;
import kosta.mvc.service.OrderServiceImpl;

public class OrderController implements Controller{
	
	private OrderService orderService = new OrderServiceImpl();
	private MemberDAO memberDAO = new MemberDAOImpl();
	private CouponDAO couponDAO = new CouponDAOImpl();
	private CartDAO cartDAO = new CartDAOImpl();
	private ProductDAO productDAO = new ProductDAOImpl();
	
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
		
		// 쿠폰 가져오기
		List<CouponDTO> couponList = couponDAO.selectAllCoupon(id);
		
		ModelAndView mv = new ModelAndView();
		
		ServletContext application = request.getServletContext();
		application.setAttribute("productList", productList);
		
		request.setAttribute("productList", productList);
		request.setAttribute("memberDTO", memberDTO);
		request.setAttribute("couponList", couponList);
		
		mv.setViewName("v_order/order.jsp");
		
		return mv;
	}
	
	
	/**
	 * 무통장입금 메인페이지 이동
	 * */
	public ModelAndView cashOne(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 사용한 쿠폰 삭제.
		int couponCode = Integer.parseInt(request.getParameter("couponCode"));
		couponDAO.deleteCoupon(couponCode);
	
		// 장바구니에서 상품 삭제.
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		cartDAO.deleteCart(productCode);
		
		// 구매수량 증가
		productDAO.upQty(productCode);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setRedirect(true);
		mv.setViewName("Main.jsp");
		return mv;
	}
	
	
	/**
	 * 주문페이지 이동시 모든 제품을 들고 페이지 이동
	 * */
	public ModelAndView totalOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
}