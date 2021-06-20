package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dao.CouponDAO;
import kosta.mvc.dao.CouponDAOImpl;
import kosta.mvc.dto.CouponDTO;
import kosta.mvc.dto.MemberDTO;
import kosta.mvc.dto.ProductDTO;
import net.sf.json.JSONArray;


@WebServlet("/discountPrice")
public class discountPriceServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		int couponCode = Integer.parseInt(request.getParameter("couponCode"));
		
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("loginUser"));
		
		CouponDAO couponDAO = new CouponDAOImpl();
		List<CouponDTO> couponList = null;
		couponList = couponDAO.selectAllCoupon(id);
		
		ServletContext application = request.getServletContext();
		List<ProductDTO> productList = (List<ProductDTO>) application.getAttribute("productList");
		
		int totalPrice = 0;
		for(int i = 0; i < productList.size(); i++) {
				totalPrice += productList.get(i).getTotalPrice();
		}
		
		PrintWriter out = response.getWriter();
		int discountPrice = 0;
		for(int i = 0; i < couponList.size(); i++) {
			if(couponList.get(i).getCouponCode() == couponCode) {
				
				if(couponList.get(i).getCouponName().equals("최초 회원가입 10% 할인쿠폰")) {
					totalPrice = (int)(totalPrice * 0.9);
					discountPrice = totalPrice - (int)(totalPrice * 0.9);
				} else {
					totalPrice -= 10000;
					discountPrice = 10000;
				}
				
			} 
		}
		
		application.setAttribute("totalPrice", totalPrice);
		
		int[] arrPrice = {discountPrice, totalPrice};
		JSONArray arr = JSONArray.fromObject(arrPrice);
		out.println(arr);
		
//		out.println(discountPrice);
//		out.println(totalPrice);
		
	}
}
