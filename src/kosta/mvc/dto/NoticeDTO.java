package kosta.mvc.dto;

public class NoticeDTO {
	private int noticeCode;
	private String id;
	private String noticeTitle;
	private String noticeContent;
	private int views;
	private String file;
	private String noticeRdate;
	
	public NoticeDTO() {
		super();
	}
	public NoticeDTO(int noticeCode, String id, String noticeTitle, String noticeContent, int views, String file,
			String noticeRdate) {
		super();
		this.noticeCode = noticeCode;
		this.id = id;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.views = views;
		this.file = file;
		this.noticeRdate = noticeRdate;
	}
	
	public int getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getNoticeRdate() {
		return noticeRdate;
	}
	public void setNoticeRdate(String noticeRdate) {
		this.noticeRdate = noticeRdate;
	}

}