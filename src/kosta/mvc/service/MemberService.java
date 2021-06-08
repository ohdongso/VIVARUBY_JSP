package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dto.MemberDTO;

public interface MemberService {
	/**
	 * 회원가입
	 */
	void memberJoin(MemberDTO memberDTO)throws SQLException;
	
	/**
	 * 로그인
	 */
	MemberDTO loginCheck(MemberDTO memberDTO)throws SQLException;
	
	
	
}
