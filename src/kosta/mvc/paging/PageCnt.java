package kosta.mvc.paging;

public class PageCnt {
	private static int pageCnt; // 총 페이지 수
	public static int pagesize = 5; // 한 페이지당 보여질 게시물 수
	public static int pageNo = 1; // 현재 페이지 번호
	public int blockcount = 2; // 한 블럭당 보여질 페이지 수
	
	// 기본 생성자
	public PageCnt() {}
	
	// getter, setter
	public static int getPageCnt() {
		return pageCnt;
	}
	public static void setPageCnt(int pageCnt) {
		PageCnt.pageCnt = pageCnt;
	}
	public static int getPagesize() {
		return pagesize;
	}
	public static void setPagesize(int pagesize) {
		PageCnt.pagesize = pagesize;
	}
	public static int getPageNo() {
		return pageNo;
	}
	public static void setPageNo(int pageNo) {
		PageCnt.pageNo = pageNo;
	}
	public int getBlockcount() {
		return blockcount;
	}
	public void setBlockcount(int blockcount) {
		this.blockcount = blockcount;
	}
}