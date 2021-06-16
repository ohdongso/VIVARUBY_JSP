package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.FaqDTO;

public interface FaqDAO {
	/**
	 * FAQ에 있는 모든 게시물을 검색하는 기능
	 * */
	List<FaqDTO> selectAll() throws SQLException;
	
	/**
	 * FAQ를 CODE로 검색하는 방법
	 * */
	FaqDTO selectFaq(int fCode) throws SQLException;
	
	/**
	 * FAQ에 게시물 등록하는 기능
	 * */
	int insertFaq(FaqDTO faqDTO) throws SQLException;
	
	/**
	 * FAQ게시물 삭제하는 기능
	 * */
	int deleteFaq(int fCode) throws SQLException;
	
	/**
	 * FAQ에 있는 게시물 카테고리로 검색하는 기능.
	 * */
	List<FaqDTO> selectCategory(int category) throws SQLException;
	
	/**
	 * FAQ게시물 수정하는 기능
	 * */
	int updateFaq(FaqDTO faqDTO) throws SQLException;
}
