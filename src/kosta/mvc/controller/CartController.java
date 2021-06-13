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
import kosta.mvc.dto.CartDTO;
import kosta.mvc.dto.ProductDTO;
import kosta.mvc.dto.WishDTO;
import kosta.mvc.service.CartService;
import kosta.mvc.service.CartServiceImpl;
import kosta.mvc.service.WishService;
import kosta.mvc.service.WishServiceImpl;

public class CartController implements Controller{
	
	private CartService cartService = new CartServiceImpl();
	private WishService wishService = new WishServiceImpl();
	private ProductDAO productDao = new ProductDAOImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * cart테이블에 있는 전체정보 가져오기
	 * */
	public ModelAndView selectAllCart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("selectAllCart");
		
		return null;
	}
	
	
	
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	public ModelAndView insertCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginUser");
		
		CartDTO cartDTO = new CartDTO(0, id, productCode, cartQty);
		
		cartService.insertCart(cartDTO);
		
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
	
	
	
	
	
	
	
}
