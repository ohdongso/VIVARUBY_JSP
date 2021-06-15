package kosta.mvc.dto;

public class FaqDTO {
	private int fCode;
	private int fCategory;
	private String fTitle;
	private String fContent;
	
	public FaqDTO() {}
	public FaqDTO(int fCode, int fCategory, String fTitle, String fContent) {
		super();
		this.fCode = fCode;
		this.fCategory = fCategory;
		this.fTitle = fTitle;
		this.fContent = fContent;
	}
	
	public int getfCode() {
		return fCode;
	}
	public void setfCode(int fCode) {
		this.fCode = fCode;
	}
	public int getfCategory() {
		return fCategory;
	}
	public void setfCategory(int fCategory) {
		this.fCategory = fCategory;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	
}