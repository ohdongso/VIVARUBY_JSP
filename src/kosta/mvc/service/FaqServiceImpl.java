package kosta.mvc.service;


import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.FaqDAO;
import kosta.mvc.dao.FaqDAOImpl;
import kosta.mvc.dto.FaqDTO;

public class FaqServiceImpl implements FaqService {
	private FaqDAO faqDAO = new FaqDAOImpl();
	
	/**
	 * FAQ에 있는 모든 게시물을 검색하는 기능
	 * */
	@Override
	public List<FaqDTO> selectAll() throws SQLException {
		return faqDAO.selectAll();
	}
	
	/**
	 * FAQ를 CODE로 검색하는 방법
	 * */
	@Override
	public FaqDTO selectFaq(int fCode) throws SQLException {
		return faqDAO.selectFaq(fCode);
	}
	
	/**
	 * FAQ에 게시물 등록하는 기능
	 * */
	@Override
	public void insertFaq(FaqDTO faqDTO) throws SQLException {
		int result = faqDAO.insertFaq(faqDTO);

		if(result == 0) {
			throw new SQLException("FAQ가 등록되지 않았습니다.");
		}
	}
	
	/**
	 * FAQ에 있는 게시물 카테고리로 검색하는 기능.
	 * */
	@Override
	public List<FaqDTO> selectCategory(int category) throws SQLException {
		return faqDAO.selectCategory(category);
	}
	
	/**
	 * FAQ에 있는 모든 게시물을 검색하는 기능
	 * */
	@Override
	public void deleteFaq(int fCode) throws SQLException {
		int result = faqDAO.deleteFaq(fCode);
		if(result==0) {
			throw new SQLException("게시물이 삭제되지 않았습니다.");
		}
	}

	/**
	 * FAQ게시물 수정하는 기능
	 * */
	@Override
	public void updateFaq(FaqDTO faqDTO) throws SQLException {
		int result = faqDAO.updateFaq(faqDTO);
		if(result == 0) {
			throw new SQLException("게시물이 수정되지 않았습니다.");
		}
	}
	
	
	
	
}