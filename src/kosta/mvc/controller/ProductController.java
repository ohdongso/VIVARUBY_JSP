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
		mv.setViewName("v_perfume/perfumeDetail.jsp");
		
		return mv;
	}
	
	/**
	 * 카테고리별 제품 검색.
	 */
	public ModelAndView selectProCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		List<ProductDTO> productList = productService.selectProCategory(category);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
	
		mv.setViewName(pageName);
		return mv;	
		
	} // selectProCategory메소드 끝.
	
	/**
	 * 상품용량검색
	 * */
	public ModelAndView selectProductCapacity(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		int min = Integer.parseInt(request.getParameter("min"));
		int max = Integer.parseInt(request.getParameter("max"));
		
		List<ProductDTO> productList = productService.selectProductCapacity(category, min, max);
	
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
	/**
	 * 최신상품검색
	 * */
	public ModelAndView selectNewProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		
		List<ProductDTO> productList = productService.selectNewProduct(category);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
	/**
	 * 상품명검색
	 * */
	public ModelAndView selectProductName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		
		List<ProductDTO> productList = productService.selectProductName(category);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
	/**
	 * 상품명인기순 검색
	 * */
	public ModelAndView selectQtySell(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		
		List<ProductDTO> productList = productService.selectProCategory(category);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
	/**
	 * 낮은가격 상품검색
	 * */
	public ModelAndView selectMinPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		
		List<ProductDTO> productList = productService.selectMinPrice(category);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
	
	/**
	 * 높은가격 상품검색
	 * */
	public ModelAndView selectMaxPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		
		List<ProductDTO> productList = productService.selectMaxPrice(category);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
	/**
	 * 상품명 검색
	 * */
	public ModelAndView selectProName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		String productName = request.getParameter("productName");
		
		List<ProductDTO> productList = productService.selectProName(category, productName);
		
		request.setAttribute("productList", productList);
		
		ModelAndView mv = new ModelAndView();
		String pageName = "";
		
		switch (category) {
		case 1:
			pageName = "v_perfume/womanPerfume.jsp";
			break;
			
		case 2:
			pageName = "v_perfume/manPerfume.jsp";
			break;
			
		case 3:
			pageName = "v_perfume/mvPerfume.jsp";
			break;
		
		case 4:
			pageName = "v_perfume/perfumeBottle.jsp";
			break;
		
		case 5:
			pageName = "v_perfume/giftSet.jsp";
			break;
		
		case 6:
			pageName = "v_skinCare/bodyCare.jsp";
			break;
			
		case 7:
			pageName = "v_skinCare/cosmetics.jsp";
			break;
		}
		
		mv.setViewName(pageName);
		return mv;
	}
	
}