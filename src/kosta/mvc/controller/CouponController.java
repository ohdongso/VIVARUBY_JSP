package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.CouponDTO;
import kosta.mvc.service.CouponService;
import kosta.mvc.service.CouponServiceImpl;

public class CouponController implements Controller {
	private CouponService couponService = new CouponServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 발급받은 쿠폰조회
	 * */
	public ModelAndView selectAllCoupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String id = String.valueOf(session.getAttribute("loginUser"));
		
		List<CouponDTO> couponList = couponService.selectAllCoupon(id);
		
		request.setAttribute("couponList", couponList);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("v_coupon/coupon.jsp");
		return mv;
	}
	
	/**
	 * 발급받은 쿠폰삭제
	 * */
	public ModelAndView deleteCoupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int couponCode = Integer.parseInt(request.getParameter("couponCode"));
		couponService.deleteCoupon(couponCode);
		
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("loginUser"));
		
		List<CouponDTO> couponList = couponService.selectAllCoupon(id);
		request.setAttribute("couponList", couponList);
		
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("v_coupon/coupon.jsp");
		
		return mv;
	}
	
}