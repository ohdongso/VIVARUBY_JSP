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
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginUser");
		
		List<CartDTO> cartDtoList = cartService.selectAllCart(id);
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		int totalAllPrice = 0;
		
		if(cartDtoList.size() != 0) {
			int len = cartDtoList.size();
			
			for(int i = 0; i < len; i++) {
				ProductDTO productDTO = productDao.productDetail(cartDtoList.get(i).getProductCode());
				productDTO.setCartQty(cartDtoList.get(i).getCartQty());
				
				int totalPrice =  productDTO.getCartQty() * productDTO.getProductPrice();
				totalAllPrice += totalPrice;
				productDTO.setTotalPrice(totalPrice);
				
				productList.add(productDTO);
			}
		}
		
		ModelAndView mv = new ModelAndView();
		request.setAttribute("productList", productList);
		request.setAttribute("totalAllPrice", totalAllPrice);
		mv.setViewName("v_cart/cart.jsp");
		
		return mv;
	}
	
	/**
	 * 장바구니에 등록하는 기능.(찜목록에서 추가)
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
	
	/**
	 * 장바구니에 등록하는 기능.(상세보기페이지에서 추가)
	 * */
	public ModelAndView insertCartDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		mv.setViewName("Main.jsp");
		
		return mv;
	}
	
	/**
	 * 장바구니 상품 삭제, deleteWish
	 * */
	public ModelAndView deleteCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		cartService.deleteCart(productCode);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginUser");
		
		List<CartDTO> cartDtoList = cartService.selectAllCart(id);
		
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		int totalAllPrice = 0;
		
		if(cartDtoList.size() != 0) {
			int len = cartDtoList.size();
			
			for(int i = 0; i < len; i++) {
				ProductDTO productDTO = productDao.productDetail(cartDtoList.get(i).getProductCode());
				productDTO.setCartQty(cartDtoList.get(i).getCartQty());
				
				int totalPrice =  productDTO.getCartQty() * productDTO.getProductPrice();
				totalAllPrice += totalPrice;
				productDTO.setTotalPrice(totalPrice);
				
				productList.add(productDTO);
			}
		}
		
		ModelAndView mv = new ModelAndView();
		request.setAttribute("productList", productList);
		request.setAttribute("totalAllPrice", totalAllPrice);
		mv.setViewName("v_cart/cart.jsp");
		
		return mv;
	}
}