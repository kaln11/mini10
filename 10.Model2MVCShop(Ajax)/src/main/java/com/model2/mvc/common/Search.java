package com.model2.mvc.common;


public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int searchValueLow;
	private int searchValueHigh;
	private String searchSortingOption;
	private boolean viewSoldItem;
	private int pageSize;
	//==> ����Ʈȭ�� currentPage�� �ش��ϴ� ȸ�������� ROWNUM ��� SELECT ���� �߰��� Field 
		//==> UserMapper.xml �� 
		//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">
		//==> ����
	private int endRowNum;
	private int startRowNum;
	
	///Constructor
	public Search() {
	}

	public int getCurrentPage() {		return currentPage;	}
	public void setCurrentPage(int currentPage) {		this.currentPage = currentPage;	}
	
	public String getSearchCondition() {		return searchCondition;	}	
	public void setSearchCondition(String searchCondition) {		this.searchCondition = searchCondition;	}
	
	public String getSearchKeyword() {		return searchKeyword;	}	
	public void setSearchKeyword(String searchKeyword) {		this.searchKeyword = searchKeyword;	}

	public int getSearchValueLow() {		return searchValueLow;	}
	public void setSearchValueLow(int searchValueLow) {		this.searchValueLow = searchValueLow;	}

	public int getSearchValueHigh() {		return searchValueHigh;	}
	public void setSearchValueHigh(int searchValueHigh) {		this.searchValueHigh = searchValueHigh;	}

	public String getSearchSortingOption() {		return searchSortingOption;	}
	public void setSearchSortingOption(String searchSortingOption) {		this.searchSortingOption = searchSortingOption;	}

	public boolean isViewSoldItem() {		return viewSoldItem;	}
	public void setViewSoldItem(boolean viewSoldItem) {		this.viewSoldItem = viewSoldItem;	}

	public int getPageSize() {		return pageSize;	}
	public void setPageSize(int pageSize) {		this.pageSize = pageSize;	}

	//==> Select Query �� ROWNUM ������ �� 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Search [currentPage=");
		builder.append(currentPage);
		builder.append(", searchCondition=");
		builder.append(searchCondition);
		builder.append(", searchKeyword=");
		builder.append(searchKeyword);
		builder.append(", searchValueLow=");
		builder.append(searchValueLow);
		builder.append(", searchValueHigh=");
		builder.append(searchValueHigh);
		builder.append(", searchSortingOption=");
		builder.append(searchSortingOption);
		builder.append(", viewSoldItem=");
		builder.append(viewSoldItem);
		builder.append(", pageSize=");
		builder.append(pageSize);
		builder.append(", endRowNum=");
		builder.append(endRowNum);
		builder.append(", startRowNum=");
		builder.append(startRowNum);
		builder.append("]");
		return builder.toString();
	}
	
	///Method
	
}