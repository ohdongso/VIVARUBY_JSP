package kosta.mvc.dto;

public class ReviewDTO {
	private int RefundBoardCode;
	private int OrderCode;
	private String id;
	private int ProductCode;
	private String RefundBoardPw;
	private String RefundBoardTitle;
	private String content;
	private int hit;
	private String RefundRdate;
	
	// 생성자
	public ReviewDTO() {}
	public ReviewDTO(int refundBoardCode, int orderCode, String id, int productCode, String refundBoardPw,
			String refundBoardTitle, String content, int hit, String refundRdate) {
		super();
		RefundBoardCode = refundBoardCode;
		OrderCode = orderCode;
		this.id = id;
		ProductCode = productCode;
		RefundBoardPw = refundBoardPw;
		RefundBoardTitle = refundBoardTitle;
		this.content = content;
		this.hit = hit;
		RefundRdate = refundRdate;
	}
	
	// get, set
	public int getRefundBoardCode() {
		return RefundBoardCode;
	}
	public void setRefundBoardCode(int refundBoardCode) {
		RefundBoardCode = refundBoardCode;
	}
	public int getOrderCode() {
		return OrderCode;
	}
	public void setOrderCode(int orderCode) {
		OrderCode = orderCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProductCode() {
		return ProductCode;
	}
	public void setProductCode(int productCode) {
		ProductCode = productCode;
	}
	public String getRefundBoardPw() {
		return RefundBoardPw;
	}
	public void setRefundBoardPw(String refundBoardPw) {
		RefundBoardPw = refundBoardPw;
	}
	public String getRefundBoardTitle() {
		return RefundBoardTitle;
	}
	public void setRefundBoardTitle(String refundBoardTitle) {
		RefundBoardTitle = refundBoardTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRefundRdate() {
		return RefundRdate;
	}
	public void setRefundRdate(String refundRdate) {
		RefundRdate = refundRdate;
	}

	// toString()
	@Override
	public String toString() {
		return "ReviewDTO [RefundBoardCode=" + RefundBoardCode + ", OrderCode=" + OrderCode + ", id=" + id
				+ ", ProductCode=" + ProductCode + ", RefundBoardPw=" + RefundBoardPw + ", RefundBoardTitle="
				+ RefundBoardTitle + ", content=" + content + ", hit=" + hit + ", RefundRdate=" + RefundRdate + "]";
	}
	
}	