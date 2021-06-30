package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.NoticeDTO;

public interface NoticeDAO {
	/**
	 * 모든 공지사항을 검색하는 메소드
	 * */
	List<NoticeDTO> selectAll(int pageNo) throws SQLException;
}
