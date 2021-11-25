package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.NoticeDTO;
import kosta.mvc.paging.PageCnt;
import kosta.mvc.util.DbUtil;

public class NoticeDAOImpl implements NoticeDAO{
	/**
	 * 모든 공지사항을 검색하는 메소드
	 * */
	@Override
	public List<NoticeDTO> selectAll(int pageNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		List<NoticeDTO> noticeList = new ArrayList<>();
		
		String sql = "SELECT NOTICE_CODE, ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_VIEWS, NOTICE_FILE, TO_CHAR(NOTICE_RDATE, 'YYYY-MM-DD HH24:MI:SS') "
				+ "FROM (SELECT a.*, ROWNUM rnum "
				+ "FROM (SELECT * FROM NOTICE ORDER BY NOTICE_RDATE DESC)a) "
				+ "where rnum <= ? and rnum >= ?";
		
		try {
			// 전체 레코드수 가져오기
			int totalCount = getSelectTotalCount();
			
			PageCnt page = new PageCnt();
			
			// 전체 페이지수 구한다. ex) 전체게시물수 / 한페이지당보여줄게시물수 ==> 최종결과 올림.
			page.setPageCnt(totalCount % page.getPagesize() == 0 ? totalCount / page.getPagesize() : totalCount / page.getPagesize() + 1);
			
			// 
			page.setPageNo(pageNo);
			
			con = DbUtil.getConnection();

			// 총 레코드수를 가져오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, pageNo * page.getPagesize());
			ps.setInt(2, (pageNo - 1) * page.getPagesize() + 1);
			
			// 게시물 가져오기
			rs = ps.executeQuery();
			while (rs.next()) {
				NoticeDTO noticeDTO = new NoticeDTO(rs.getInt(1), rs.getString(2), rs.getString(3), 
				rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7));
			
				noticeList.add(noticeDTO);
			} // while문 끝.
			
		} finally {
			 DbUtil.dbClose(rs, ps, con);
		}
		return noticeList;
	}
	
	/**
	 * 전체 게시물수
	 * */
	 public int getSelectTotalCount() throws SQLException{
	    	Connection con=null;
			PreparedStatement ps =null;
			ResultSet rs =null;
			int result=0;
			
			String sql="select count(*) from NOTICE";
			try {
				con = DbUtil.getConnection();
				ps = con.prepareStatement(sql);
				//?의 개수만큼 순서대로 값이 설정.
				
				rs = ps.executeQuery();
				if(rs.next()) {
					 result =rs.getInt(1);
				}			
			}finally {
				DbUtil.dbClose(rs, ps, con);
			}
			return result;
	    }
}