package kosta.mvc.dto;

public class CartDTO {
	private int cartCode;
	private String id;
	private int productCode;
	private int cartQty;
	
	
	
	public CartDTO() {}
	public CartDTO(int cartCode, String id, int productCode, int cartQty) {
		super();
		this.cartCode = cartCode;
		this.id = id;
		this.productCode = productCode;
		this.cartQty = cartQty;
	}
	
	public int getCartCode() {
		return cartCode;
	}
	public void setCartCode(int cartCode) {
		this.cartCode = cartCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	
}