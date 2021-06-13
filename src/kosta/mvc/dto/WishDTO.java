package kosta.mvc.dto;

public class WishDTO {
	private int wishCode;
	private int productCode;
	private String id;
	
	public WishDTO() {}
	public WishDTO(int wishCode, int productCode, String id) {
		super();
		this.wishCode = wishCode;
		this.productCode = productCode;
		this.id = id;
	}
	
	public int getWishCode() {
		return wishCode;
	}
	public void setWishCode(int wishCode) {
		this.wishCode = wishCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}