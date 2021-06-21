package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.ProductDAO;
import kosta.mvc.dao.ProductDAOImpl;
import kosta.mvc.dto.ProductDTO;

public class ProductServiceImpl implements ProductService {
	
	private ProductDAO productDAO = new ProductDAOImpl();
	
	/**
	 * 상품삭제
	 * */
	@Override
	public void delete(int productCode) throws SQLException {
		int result = productDAO.delete(productCode);
		if(result == 0) {
			throw new SQLException("상품이 삭제되지 않았습니다.");
		}
	}

	/**
	 * 상품등록
	 * */
	@Override
	public void insertProduct(ProductDTO productDTO) throws SQLException {
		int result = productDAO.insertProduct(productDTO);
		if(result == 0) {
			throw new SQLException("상품등록에 실패했습니다.");
		}
	}
	
	/**
	 * 전체 상품 검색
	 * */
	@Override
	public List<ProductDTO> selectAll() throws SQLException {
		return productDAO.selectAll();
	}
	
	/**
	 * 배스트 상품 조회
	 * */
	@Override
	public List<ProductDTO> selectMaxPrice() throws SQLException {
		return productDAO.selectMaxPrice();
	}
	
	/**
	 * 상품상세보기
	 * */
	@Override
	public ProductDTO productDetail(int productCode) throws SQLException {
		ProductDTO productDTO = productDAO.productDetail(productCode);
		
		return productDTO;
	}

	/**
	 * 카테고리별 제품 검색.
	 */
	@Override
	public List<ProductDTO> selectProCategory(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectProCategory(category);
		return productList;
	}
	
	/**
	 * 용량 30~49
	 * */
	@Override
	public List<ProductDTO> selectProductCapacity(int category, int min, int max) throws SQLException {
		List<ProductDTO> productList = productDAO.selectProductCapacity(category, min, max);
		return productList;
	}
	
	/**
	 * 최신상품 검색
	 * */
	@Override
	public List<ProductDTO> selectNewProduct(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectNewProduct(category);
		return productList;
	}
	
	/**
	 * 상품명 검색
	 * */
	@Override
	public List<ProductDTO> selectProductName(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectProductName(category);
		return productList;
	}
	
	/**
	 * 상품명 검색
	 * */
	@Override
	public List<ProductDTO> selectQtySell(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectQtySell(category);
		return productList;
	}

	/**
	 * 낮은가격 상품검색
	 * */
	@Override
	public List<ProductDTO> selectMinPrice(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectMinPrice(category);
		return productList;
	}
	
	/**
	 * 높은가격 상품검색
	 * */
	@Override
	public List<ProductDTO> selectMaxPrice(int category) throws SQLException {
		List<ProductDTO> productList = productDAO.selectMaxPrice(category);
		return productList;
	}

	/**
	 * 삼품명 검색
	 * */
	@Override
	public List<ProductDTO> selectProName(int category, String productName) throws SQLException {
		List<ProductDTO> productList = productDAO.selectProName(category, productName);
		return productList;
	}
	
	
	

	

	
	
}