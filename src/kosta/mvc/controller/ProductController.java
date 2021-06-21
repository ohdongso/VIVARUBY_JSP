package kosta.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.mvc.dto.ProductDTO;
import kosta.mvc.service.ProductService;
import kosta.mvc.service.ProductServiceImpl;

public class ProductController implements Controller {

	private ProductService productService = new ProductServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 상품삭제
	 * */
	public ModelAndView productDelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		
		productService.delete(productCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setRedirect(true);
		mv.setViewName("Main.jsp");
		
		return mv;
	}
	
	/**
	 * 상품등록
	 * */
	public ModelAndView insertProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String saveDir = request.getServletContext().getRealPath("/save");
		String encoding="UTF-8";
		int maxSize=1024*1024*100;
		
		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy()); 
		
		String productName = m.getParameter("productName");
		int productPrice = Integer.parseInt(m.getParameter("productPrice"));
		int productGender = Integer.parseInt(m.getParameter("productGender"));
		int productCategory = Integer.parseInt(m.getParameter("productCategory"));
		int productStock = Integer.parseInt(m.getParameter("productStock"));
		int productCapacity = Integer.parseInt(m.getParameter("productCapacity"));
		String productContent = m.getParameter("productContent");
		String productImg = m.getFilesystemName("productImg");
		
		ProductDTO productDTO = new ProductDTO(0, productCategory, productPrice, productStock, 0, productGender, productCapacity, productName, productContent, productImg, null, null);
		productService.insertProduct(productDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Main.jsp");
		
		return mv;
	}
	
	/**
	 * index.jsp페이지, 상품검색
	 */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 최신 등록된, 카테고리1번에 해당하는 상품을 검색해서 리스트에 담는다.
		List<ProductDTO> productList1 = productService.selectAll();
		
		// 새로운 상품을 담기위한 리스트.
		List<ProductDTO> productNew = new ArrayList<>();
		ProductDTO newDTO = new ProductDTO();
		
		// 새로운 상품1개를 담기위한 DTO
		newDTO = productList1.get(0);
		
		// 새로운 상품4개를 담기위한 리스트
		for(int i = 1; i <= 4; i++) {
			productNew.add(productList1.get(i));
		}
		// newDTO, productNew ==> 2개를 VIEW페이로 이동히켜줘야 한다.
		
		
		// 구매 횟수가 많은, 삼품을 검색해서, 리스트에 담는다.
		List<ProductDTO> productList2 = productService.selectMaxPrice();
		
		// Top3개를 정해서 다시 리스트에 담아줘야한다.
		List<ProductDTO> productBest = new ArrayList<>();
		for(int i = 0; i <=2; i++) {
			productBest.add(productList2.get(i));
		}
	
		// 관심 상품
		// 이미 구매횟수에 대한 리스트가 있기떄문에, 전체 들고올 필요가 없다.
		List<ProductDTO> productLike = new ArrayList<>();
		for(int i = 0; i <= 11; i++) {
			productLike.add(productList2.get(i));
		}
		
		// 최신상품 top1
		request.setAttribute("newDTO", newDTO);
		
		// 최신상품 top2~5
		request.setAttribute("productNew", productNew);
		
		// 인기순 top1~3
		request.setAttribute("productBest", productBest);
		
		// 인기순 top1~12
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