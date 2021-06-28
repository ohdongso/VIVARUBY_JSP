package kosta.mvc.dto;

public class OrderDTO {
	private int orderCode;
	private int productCode;
	private String id;
	private String orderName;
	private String orderPhone;
	private String orderAddr1;
	private String orderAddr2;
	private String orderAddr3;
	private int orderPayment;
	private int orderAmount;
	private String orderContent;
	private String orderDepositor;
	private String orderDate;
	

	
	
	public OrderDTO() {}
	public OrderDTO(int orderCode, int productCode, String id, String orderName, String orderPhone, String orderAddr1,
			String orderAddr2, String orderAddr3, int orderPayment, int orderAmount, String orderContent,
			String orderDepositor, String orderDate) {
		super();
		this.orderCode = orderCode;
		this.productCode = productCode;
		this.id = id;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderAddr1 = orderAddr1;
		this.orderAddr2 = orderAddr2;
		this.orderAddr3 = orderAddr3;
		this.orderPayment = orderPayment;
		this.orderAmount = orderAmount;
		this.orderContent = orderContent;
		this.orderDepositor = orderDepositor;
		this.orderDate = orderDate;
	}
	
	public String getOrderDepositor() {
		return orderDepositor;
	}
	public void setOrderDepositor(String orderDepositor) {
		this.orderDepositor = orderDepositor;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
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
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderAddr1() {
		return orderAddr1;
	}
	public void setOrderAddr1(String orderAddr1) {
		this.orderAddr1 = orderAddr1;
	}
	public String getOrderAddr2() {
		return orderAddr2;
	}
	public void setOrderAddr2(String orderAddr2) {
		this.orderAddr2 = orderAddr2;
	}
	public String getOrderAddr3() {
		return orderAddr3;
	}
	public void setOrderAddr3(String orderAddr3) {
		this.orderAddr3 = orderAddr3;
	}
	public int getOrderPayment() {
		return orderPayment;
	}
	public void setOrderPayment(int orderPayment) {
		this.orderPayment = orderPayment;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getOrderContent() {
		return orderContent;
	}
	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
}