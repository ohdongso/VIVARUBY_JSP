package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.MemberDTO;

public interface MemberDAO {
	/**
	 * 회원가입
	 */
	int memberJoin(MemberDTO memberDTO)throws SQLException;
	
	/**
	 * 아이디중복체크
	 */
	boolean idCheck(String id);
	
	/**
	 * 로그인
	 */
	MemberDTO loginCheck(MemberDTO memberDTO)throws SQLException;
	
	/**
	 * id에 해당하는 회원정보 검색
	 */
	MemberDTO myInform(String id)throws SQLException;
	
	/**
	 * 회원정보수정
	 */
	int updateMemberInfo(MemberDTO memberDTO)throws SQLException;
	
	/**
	 * 회원탈퇴
	 */
	int deleteMember(String id, String pw)throws SQLException;
}
