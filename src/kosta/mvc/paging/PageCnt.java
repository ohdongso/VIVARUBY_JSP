package kosta.mvc.paging;

public class PageCnt {
	// 총 페이지 수
	private static int pageCnt;
	
	// 한페이지 당 게시물 수
	public static  int pagesize = 5;
	
	public static int pageNo=1;
	public  int blockcount=2;
	
	//String keyField;
	public PageCnt() {
		super();
	}

	public PageCnt(int pageCnt) {
		super();
		this.pageCnt = pageCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
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