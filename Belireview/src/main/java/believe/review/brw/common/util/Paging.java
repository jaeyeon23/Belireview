package believe.review.brw.common.util;

public class Paging {

	private int currentPage;  
	private int totalCount;	
	private int totalPage;	
	private int blockCount;	 
	private int blockPage;	
	private int startCount;	
	private int endCount;	 
	private int startPage;	
	private int endPage;	

	private StringBuffer pagingHtml;

	public Paging(int currentPage, int totalCount, int blockCount,
			int blockPage, String url) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		pagingHtml = new StringBuffer();
		
		if (currentPage > blockPage) {
			pagingHtml.append("<li>");
			pagingHtml.append("<a href=" + url + ".br?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("<span>&lt;</span>");
			pagingHtml.append("</a>");
			pagingHtml.append("</li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<li class='active'>");
				pagingHtml.append("<span>");
				pagingHtml.append(i);
				pagingHtml.append("</span>");
				pagingHtml.append("</li>");
			} else {
				pagingHtml.append("<li>");
				pagingHtml.append("<a href=" + url + ".br?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
				pagingHtml.append("</li>");
			}
		}

		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<li>");
			pagingHtml.append("<a href=" + url + ".br?currentPage=" + (endPage + 1) + ">");
			pagingHtml.append("<span>&gt;</span>");
			pagingHtml.append("</a>");
			pagingHtml.append("</li>");
		}
	}

	public Paging(int currentPage, int totalCount, int blockCount, int blockPage, String url, String orderby, String searchNum, String searchBox){
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if(totalPage == 0){
			totalPage = 1;
		}
		
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		startCount = (currentPage -1) * blockCount;
		endCount = startCount + blockCount -1;
		
		startPage = (int)((currentPage -1) / blockPage) * blockPage +1;
		endPage = startPage + blockPage -1;
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		
		pagingHtml = new StringBuffer();
		if(currentPage > blockPage){
			pagingHtml.append("<li>");
			
			if(orderby != "" || searchBox != "") 
				pagingHtml.append("<a href=" + url + ".br?currentPage=" + (startPage - 1) + "&orderby=" + orderby + "&searchNum="+searchNum+ "&searchBox="+searchBox+">");
			else                    
				pagingHtml.append("<a href=" + url + ".br?currentPage=" + (startPage - 1) + ">");
			
			pagingHtml.append("<span>&lt;</span>");
			pagingHtml.append("</a>");
			pagingHtml.append("</li>");
		}
		
		
		for(int i = startPage; i <= endPage; i++){
			if(i > totalPage){
				break;
			}
			if(i == currentPage){
				pagingHtml.append("<li class='active'>");
				pagingHtml.append("<span>");
				pagingHtml.append(i);
				pagingHtml.append("</span>");
				pagingHtml.append("</li>");
			}
			else{
				pagingHtml.append("<li>");
				pagingHtml.append("<a href=" + url + ".br?currentPage=" + i);
				if(orderby != "" || searchBox != "")
					pagingHtml.append("&orderby=" + orderby + "&searchBox=" + searchBox+"&searchNum="+searchNum);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
				pagingHtml.append("</li>");
			}
		}
		
		if(totalPage - startPage >= blockPage){
			pagingHtml.append("<li>");
			pagingHtml.append("<a href=" + url + ".br?currentPage=" + (endPage + 1));
			if(orderby != "" || searchBox != "")
				pagingHtml.append("&orderby=" + orderby + "&searchBox=" + searchBox+"&searchNum="+searchNum);
			pagingHtml.append(">");
			pagingHtml.append("<span>&gt;</span>");
			pagingHtml.append("</a>");
			pagingHtml.append("</li>");
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}