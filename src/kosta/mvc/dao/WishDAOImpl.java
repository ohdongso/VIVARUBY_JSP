package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kosta.mvc.dto.WishDTO;
import kosta.mvc.util.DbUtil;

public class WishDAOImpl implements WishDAO{
	
	/**
	 * id에 해당하는 wish가 있는지 검색
	 * */
	@Override
	public WishDTO selectWish(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		WishDTO wishDTO = null;
		
		String sql = "SELECT * FROM WISH WHERE ID = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
//				wishDTO = new WishDTO(rs.getInt(1), rs.getString(2), rs.get);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return wishDTO;
	}

	
	
	
	
	
}
