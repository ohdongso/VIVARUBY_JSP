package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.NoticeDAO;
import kosta.mvc.dao.NoticeDAOImpl;
import kosta.mvc.dto.NoticeDTO;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO noticeDAO = new NoticeDAOImpl();
	
	/**
	 * 모든 공지사항을 검색하는 메소드
	 * */
	@Override
	public List<NoticeDTO> selectAll(int pageNo) throws SQLException {
		return noticeDAO.selectAll(pageNo);
	}
	
}
