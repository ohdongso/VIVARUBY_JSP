package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.MemberDTO;

public interface MemberDAO {
	/**
	 * 회원가입
	 */
	int memberJoin(MemberDTO memberDTO)throws SQLException;
	
	/**
	 * 로그인
	 */
	MemberDTO loginCheck(MemberDTO memberDTO)throws SQLException;
	
	
}
