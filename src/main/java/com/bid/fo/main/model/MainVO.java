package com.bid.fo.main.model;


import lombok.Data;

@Data
public class MainVO {

	 private String bidPblancId; 	  /** 입찰 공고 아이디 */
	 private String metalCode; 		  /** 금속 코드 */
	 private String brandGroupCode;   /** 브랜드 그룹 코드 */
	 private String brandGroupCodeNm;   /** 브랜드 그룹 코드명 */
	 private String brandCode; 		  /** 브랜드 코드 */
	 private String itmSn; 			  /** 아이템 순번 */
	 private String dspyGoodsNm;       /** 아이템 명 */
	 private String dstrctLclsfCode;  /** 권역 대분류 코드 */
	 private String dstrctLclsfCodeNm;  /** 권역 대분류 코드 */
	 private String bidWt; 			  /** 입찰 중량 */
	 private String permWtRate;       /** 허용 중량 비율 */
	 private String bddrpBeginDt;     /** 투찰 시작 일시 */
	 private String bddrpEndDt; 	  /** 투찰 종료 일시 */
	 private String bidSttusCode; 	  /** 입찰 상태 코드 */
	 private String partcptnEntrpsQy; /** 참여 업체 수량 */
	 private String intrstEntrpsQy;   /** 관심 업체 수량 */
	 private String dspyAt;			  /** 전시 여부 */
	 private String pblancCanclAt; 	  /** 공고 취소 여부 */
	 
	 private String filter; 	  /** 01:공고일, 02:마감일 */
	 private String startDate; 	  /** 시작날짜 */
	 private String endDate; 	  /** 끝날짜 */
	 private int bidSttusCnt;    /** 입찰 상태코드별 공고 총 개수 */
	 
}
