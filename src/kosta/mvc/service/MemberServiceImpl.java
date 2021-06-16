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
	
	/**
	 * 아이디에 해당하는 레코드 검색
	 */
	@Override
	public MemberDTO myInform(String id, boolean flag) throws SQLException {
		MemberDTO memberDTO = memberDAO.myInform(id);
		
		if(memberDTO==null) {
			throw new SQLException("회원정보 조회 오류. 다시 시도해주세요");
		}
		
		return memberDTO;
	}
	
	/**
	 * 회원정보수정
	 */
	@Override
	public void updateMemberInfo(MemberDTO memberDTO) throws SQLException {
		int result = memberDAO.updateMemberInfo(memberDTO);
		if(result == 0) {
			throw new SQLException("정보 수정 오류. 다시 시도해주세요");
		}
	}
	
	/**
	 * 회원탈퇴
	 */
	@Override
	public void deleteMember(String id) throws SQLException {
	int result = memberDAO.deleteMember(id);
		if(result==0)throw new SQLException("회원탈퇴 실패. 다시 시도해주세요");
	}
		
}