package kosta.mvc.dto;

import java.util.List;

public class WishDTO {
	private int wishCode;
	private String id;
//	private 
	
	private List<ProductDTO> productList;
	
	public WishDTO() {}
	public WishDTO(int wishCode, String id, List<ProductDTO> productList) {
		super();
		this.wishCode = wishCode;
		this.id = id;
		this.productList = productList;
	}
	
	public WishDTO(int wishCode, String id) {
		super();
		this.wishCode = wishCode;
		this.id = id;
	}
	public int getWishCode() {
		return wishCode;
	}
	public void setWishCode(int wishCode) {
		this.wishCode = wishCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<ProductDTO> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductDTO> productList) {
		this.productList = productList;
	}
	
}