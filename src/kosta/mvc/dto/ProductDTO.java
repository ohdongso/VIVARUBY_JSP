package kosta.mvc.dto;

public class ProductDTO {
	private int productCode;
	private int productCategory;
	private int productPrice;
	private int productStock;
	private int productSell;
	private int productGender;
	private int productCapacity;
	private String productName;
	private String productContent;
	private String productImg;
	private String productImg1;
	private String productRdate;
	
	public ProductDTO() {}
	public ProductDTO(int productCode, int productCategory, int productPrice, int productStock, int productSell,
			int productGender, int productCapacity, String productName, String productContent, String productImg,
			String productImg1, String productRdate) {
		super();
		this.productCode = productCode;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productSell = productSell;
		this.productGender = productGender;
		this.productCapacity = productCapacity;
		this.productName = productName;
		this.productContent = productContent;
		this.productImg = productImg;
		this.productImg1 = productImg1;
		this.productRdate = productRdate;
	}
	
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getProductSell() {
		return productSell;
	}
	public void setProductSell(int productSell) {
		this.productSell = productSell;
	}
	public int getProductGender() {
		return productGender;
	}
	public void setProductGender(int productGender) {
		this.productGender = productGender;
	}
	public int getProductCapacity() {
		return productCapacity;
	}
	public void setProductCapacity(int productCapacity) {
		this.productCapacity = productCapacity;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductImg1() {
		return productImg1;
	}
	public void setProductImg1(String productImg1) {
		this.productImg1 = productImg1;
	}
	public String getProductRdate() {
		return productRdate;
	}
	public void setProductRdate(String productRdate) {
		this.productRdate = productRdate;
	}
}