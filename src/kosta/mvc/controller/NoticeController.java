package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dto.NoticeDTO;
import kosta.mvc.service.BoardService;
import kosta.mvc.service.NoticeService;
import kosta.mvc.service.NoticeServiceImpl;

public class NoticeController implements Controller {
	private NoticeService noticeService = new NoticeServiceImpl();
	
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 전체공지사항검색
	 * */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNo = request.getParameter("pageNo");
		if(pageNo == null || pageNo.equals("")) {
			pageNo="1";
		}
		
		List<NoticeDTO> noticeList = noticeService.selectAll(Integer.parseInt(pageNo));
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("pageNo", pageNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_notice/noticeList.jsp");
		
		return mv;
	}
	
	

}