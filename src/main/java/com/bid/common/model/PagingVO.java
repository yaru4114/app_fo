package com.bid.common.model;

import lombok.Data;

@Data
public class PagingVO {
    private int pageSize = 10;
    private int totalCount = 0;
    private int totalPage = 0;
    private int currentPage = 1;
    private int startNo = 0;
    private int startPage = 0;

    private String status;
    private String searchType;
    private String searchKeyword;
    private String startDate;
    private String endDate;

    public void calPaging(int totalCount) {
        this.totalCount = totalCount;
        totalPage = (totalCount - 1) / pageSize + 1;
        currentPage = currentPage > totalPage ? totalPage : currentPage;
        startNo = (currentPage - 1) * pageSize;
        startPage = (currentPage - 1) / pageSize * pageSize + 1;
    }
}
