package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dto.FaqDTO;
import kosta.mvc.service.FaqService;
import kosta.mvc.service.FaqServiceImpl;

public class FaqController implements Controller {
	
	private FaqService faqService = new FaqServiceImpl(); 
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 전체 FAQ 검색
	 * */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<FaqDTO> list = faqService.selectAll();
		request.setAttribute("faqList", list);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("v_faq/faq.jsp");
		
		return mv;
	}
	
	/**
	 * 카테고리에 해당하는 FAQ 검색
	 * */
	public ModelAndView selectCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		List<FaqDTO> list = faqService.selectCategory(category);
		request.setAttribute("faqList", list);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_faq/faq.jsp");
		
		return mv;
	}
	
	/**
	 * FAQ 삭제
	 * */
	public ModelAndView deleteFaq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int fCode = Integer.parseInt(request.getParameter("fCode"));
		faqService.deleteFaq(fCode);
		
		List<FaqDTO> list = faqService.selectAll();
		request.setAttribute("faqList", list);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_faq/faq.jsp");
		
		return mv;
	}
	
	/**
	 * FAQ등록
	 * */
	public ModelAndView insertFaq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String fTitle = request.getParameter("title");
		int fCategory = Integer.parseInt(request.getParameter("category"));
		String fContent = request.getParameter("content");
		
		FaqDTO faqDTO = new FaqDTO(0, fCategory, fTitle, fContent);
		faqService.insertFaq(faqDTO);
		
		List<FaqDTO> list = faqService.selectAll();
		request.setAttribute("faqList", list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_faq/faq.jsp");
		
		return mv;
	}
	
	/**
	 * FAQ수정
	 * */
	public ModelAndView updateFaq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int fCode = Integer.parseInt(request.getParameter("fCode"));
		System.out.println(fCode);
		
		return null;
	}
	
}