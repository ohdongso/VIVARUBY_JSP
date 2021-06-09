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
	
	/**
	 * 아이디에 해당하는 레코드 검색
	 */
	MemberDTO myInform(String id, boolean flag)throws SQLException;
	
	/**
	 * 회원정보수정
	 */
	void updateMemberInfo(MemberDTO memberdto)throws SQLException;
	
	/**
	 * 회원탈퇴
	 */
	void deleteMember(String id, String pw)throws SQLException;
}