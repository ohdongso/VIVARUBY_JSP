package kosta.mvc.dto;

public class CouponDTO {
	private int couponCode;
	private String id;
	private String couponName;
	private int couponDrate;
	private int couponDprice;
	private String couponRdate;
	private String couponSdate;
	private String couponFdate;
	
	public CouponDTO() {}
	public CouponDTO(int couponCode, String id, String couponName, int couponDrate, int couponDprice,
			String couponRdate, String couponSdate, String couponFdate) {
		super();
		this.couponCode = couponCode;
		this.id = id;
		this.couponName = couponName;
		this.couponDrate = couponDrate;
		this.couponDprice = couponDprice;
		this.couponRdate = couponRdate;
		this.couponSdate = couponSdate;
		this.couponFdate = couponFdate;
	}



	public int getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(int couponCode) {
		this.couponCode = couponCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getCouponDrate() {
		return couponDrate;
	}

	public void setCouponDrate(int couponDrate) {
		this.couponDrate = couponDrate;
	}

	public int getCouponDprice() {
		return couponDprice;
	}

	public void setCouponDprice(int couponDprice) {
		this.couponDprice = couponDprice;
	}

	public String getCouponRdate() {
		return couponRdate;
	}

	public void setCouponRdate(String couponRdate) {
		this.couponRdate = couponRdate;
	}

	public String getCouponSdate() {
		return couponSdate;
	}

	public void setCouponSdate(String couponSdate) {
		this.couponSdate = couponSdate;
	}

	public String getCouponFdate() {
		return couponFdate;
	}

	public void setCouponFdate(String couponFdate) {
		this.couponFdate = couponFdate;
	}
	
}