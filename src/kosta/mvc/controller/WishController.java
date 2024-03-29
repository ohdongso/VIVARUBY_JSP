package kosta.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dao.ProductDAO;
import kosta.mvc.dao.ProductDAOImpl;
import kosta.mvc.dto.ProductDTO;
import kosta.mvc.dto.WishDTO;
import kosta.mvc.service.WishService;
import kosta.mvc.service.WishServiceImpl;

public class WishController implements Controller {
	
	private WishService wishService = new WishServiceImpl();
	private ProductDAO productDao = new ProductDAOImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 아이디에 해당하는 관심상품 전체 검색.
	 * */
	public ModelAndView selectAllWish(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginUser");
		
		List<WishDTO> wishDTOList = wishService.selectAllWish(id);
		
		List<ProductDTO> productList = new ArrayList<>();
		for(int i = 0; i < wishDTOList.size(); i++) {
			productList.add(productDao.productDetail(wishDTOList.get(i).getProductCode())); 
		}
		
		request.setAttribute("wishDTOList", wishDTOList);
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_wish/wish.jsp");
		
		return mv;
	}
	
	/**
	 * 관심상품 삭제
	 * */
	public ModelAndView deleteWish(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		
		wishService.deleteWish(productCode);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginUser");
		
		List<WishDTO> wishDTOList = wishService.selectAllWish(id);
		
		List<ProductDTO> productList = new ArrayList<>();
		for(int i = 0; i < wishDTOList.size(); i++) {
			productList.add(productDao.productDetail(wishDTOList.get(i).getProductCode())); 
		}
		
		request.setAttribute("wishDTOList", wishDTOList);
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView("v_wish/wish.jsp", false);
		
		return mv;
	}
	
	
	/**
	 * 관심상품 장바구니에 담기
	 * */
	
}