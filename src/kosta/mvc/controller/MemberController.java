package kosta.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kosta.mvc.dto.MemberDTO;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.MemberServiceImpl;

public class MemberController implements Controller {
	
	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 회원가입
	 * */
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwc = request.getParameter("pwc");
		String name = request.getParameter("name");
		
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr = addr1 + " " + addr2;
		
		String phone = request.getParameter("phone"); 
		String email = request.getParameter("email");
		
		MemberDTO memberDTO = new MemberDTO(id, pw, name, addr, phone, email, 0, null);
		
		memberService.memberJoin(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		
		return mv;
	}	
	
	/**
	 * 로그인
	 * */
	public ModelAndView loginCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO memberDTO = memberService.loginCheck(new MemberDTO(id, pw));
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", memberDTO.getId());
		session.setAttribute("loginName", memberDTO.getName());
		session.setAttribute("loginState", memberDTO.getState());
		
		ModelAndView mv = new ModelAndView("index.jsp", true);
		
		return mv;
	}
	
	/**
	 * 로그아웃
	 * */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		return new ModelAndView("index.jsp", true);
	}
	
	/**
	 * id에 해당하는 회원 정보 조회하기
	 */
	public ModelAndView myInform(HttpServletRequest request, HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		
		String id = String.valueOf(session.getAttribute("loginUser"));
		MemberDTO memberDTO = memberService.myInform(id, true);
		
		request.setAttribute("memberDTO", memberDTO);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("v_member/memberInform.jsp");
		return mv;
	}
	
	/**
	 * 회원정보수정
	 */
	public ModelAndView updateMemberInfo(HttpServletRequest request, HttpServletResponse response)throws Exception { 
		String id= request.getParameter("id");
		String pw = request.getParameter("pw");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		MemberDTO memberDTO = new MemberDTO(id, pw, addr, phone, email);
		memberService.updateMemberInfo(memberDTO);
		
		memberDTO = memberService.myInform(id, false);
		request.setAttribute("memberDTO", memberDTO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("v_member/memberInform.jsp");
		
		return mv;
	}
	
	/**
	 * 회원탈퇴
	 */
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		memberService.deleteMember(id, pw);
		
		ModelAndView mv = new ModelAndView("index.jsp", true);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return mv;
	}
	
	
	
	
	
	
	
	
}