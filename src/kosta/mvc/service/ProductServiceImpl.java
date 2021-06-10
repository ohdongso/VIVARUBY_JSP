package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.ProductDAO;
import kosta.mvc.dao.ProductDAOImpl;
import kosta.mvc.dto.ProductDTO;

public class ProductServiceImpl implements ProductService {
	
	private ProductDAO productDAO = new ProductDAOImpl();
	
	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		return productDAO.selectAll();
	}
	
	@Override
	public ProductDTO productDetail(int productCode) throws SQLException {
		ProductDTO productDTO = productDAO.productDetail(productCode);
		
		return productDTO;
	}
	
	
}
