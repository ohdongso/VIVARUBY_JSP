package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dao.MemberDAO;
import kosta.mvc.dao.MemberDAOImpl;
import kosta.mvc.dto.MemberDTO;

public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO = new MemberDAOImpl();
	
	@Override
	public void memberJoin(MemberDTO memberDTO) throws SQLException {
		int result = memberDAO.memberJoin(memberDTO);
		if(result==0)throw new SQLException("회원가입이 되지 않았습니다. 정보를 다시한번 확인해주세요.");
	}
	
	/**
	 * 로그인
	 */
	@Override
	public MemberDTO loginCheck(MemberDTO memberDTO) throws SQLException {
		MemberDTO member = memberDAO.loginCheck(memberDTO);
		if(member==null)throw new SQLException("입력하신 회원정보가 존재하지 않습니다. 아이디, 비밀번호를 다시 확인해주세요");
		return member;
		
	}
	
}
