package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dao.WishDAO;
import kosta.mvc.dao.WishDAOImpl;
import kosta.mvc.dto.WishDTO;

@WebServlet("/insertWish")
public class insertWishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String id = request.getParameter("id");
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		
		WishDAO dao = new WishDAOImpl();
//		WishDTO wishDTO = dao.selectWish(id);
		
//		if(wishDTO == null) {
//			// wish생성
//			
//			// wish에 상품 등록
//			
//		} else {
//			
//			
//		}
		
//		WishDTO wishDTO = new WishDTO(productCode, id);
		
	}
}