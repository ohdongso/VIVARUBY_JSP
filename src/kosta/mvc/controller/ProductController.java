package kosta.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
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
	 * index.jsp페이지, 상품검색
	 */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 새상품
		List<ProductDTO> productList1 = productService.selectAll();
		List<ProductDTO> productNew = new ArrayList<>();
		ProductDTO newDTO = new ProductDTO();
		
		newDTO = productList1.get(0);
		// System.out.println("newDTO : " + newDTO);
		
		for(int i = 1; i <= 4; i++) {
			productNew.add(productList1.get(i));
		}
		// System.out.println("productNew.size() : " + productNew.size());
		
		// 배스트 상품
		List<ProductDTO> productList2 = productService.selectMaxPrice();
		List<ProductDTO> productBest = new ArrayList<>();
		for(int i = 0; i <=2; i++) {
			productBest.add(productList2.get(i));
		}
		// System.out.println("productBest.size() : " + productBest.size());
		
		// 관심 상품
		List<ProductDTO> productLike = new ArrayList<>();
		for(int i = 0; i <= 11; i++) {
			productLike.add(productList2.get(i));
		}
		// System.out.println("productLike.size() : " + productLike.size());
		
		request.setAttribute("newDTO", newDTO);
		request.setAttribute("productNew", productNew);
		request.setAttribute("productBest", productBest);
		request.setAttribute("productLike", productLike);
		
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
