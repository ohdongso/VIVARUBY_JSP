package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.service.ProductServiceImpl;
import kosta.mvc.dto.ProductDTO;
import kosta.mvc.service.ProductService;

public class ProductController implements Controller {

	private ProductService productService = new ProductServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 상품전체검색
	 */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ProductDTO> productAllList = productService.selectAll();
		
		request.setAttribute("productAllList", productAllList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		
		return mv;
	}

	/**
	 * 제품상세보기
	 */
	public ModelAndView productDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		ProductDTO productDTO = productService.productDetail(productCode);
		
		request.setAttribute("productDTO", productDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_womanPerfume/perfumeDetail.jsp");
		
		return mv;
	}

	
	
	
	
}
