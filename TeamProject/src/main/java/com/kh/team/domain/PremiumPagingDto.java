package com.kh.team.domain;

public class PremiumPagingDto {
	private int page = 1;
	private int perPage = 10;
	private int startRow = 1;
	private int endRow = 10;
	private String keyword;
	private String searchType;
	private int totalCount;
	private int totalPage; 
	private int startPage; 
	private int endPage; 
	private final int PAGE_BLOCK = 10;

	public void setPageInfo() {
		this.endRow = page * perPage;
		this.startRow = this.endRow - this.perPage + 1;

		this.endPage = (int) (Math.ceil((double) page / PAGE_BLOCK) * PAGE_BLOCK);
		this.startPage = this.endPage - PAGE_BLOCK + 1;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPage = (int) Math.ceil((double) totalCount / perPage);

		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}

	@Override
	public String toString() {
		return "PremiumPagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow="
				+ endRow + ", keyword=" + keyword + ", searchType=" + searchType + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage + ", PAGE_BLOCK="
				+ PAGE_BLOCK + "]";
	}

}
