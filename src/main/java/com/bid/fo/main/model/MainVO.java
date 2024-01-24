package com.bid.fo.main.model;


import lombok.Data;

@Data
public class MainVO {

	 private String bidPblancId; 	  /** 입찰 공고 아이디 */
	 private String bidEntrpsNo; 	  /** 입찰 공고 아이디 */
	 private String metalCode; 		  /** 금속 코드 */
	 private String metalCodeNm; 		  /** 금속 코드 */
	 private String brandGroupCode;   /** 브랜드 그룹 코드 */
	 private String brandGroupCodeNm;   /** 브랜드 그룹 코드명 */
	 private String brandCode; 		  /** 브랜드 코드 */
	 private String itmSn; 			  /** 아이템 순번 */
	 private String dspyGoodsNm;       /** 아이템 명 */
	 private String dstrctLclsfCode;  /** 권역 대분류 코드 */
	 private String dstrctLclsfCodeNm;  /** 권역 대분류 코드 */
	 private String bidWt; 			  /** 입찰 중량 */
	 private String bddprWt;
	 private String permWtRate;       /** 허용 중량 비율 */
	 private String bddprBeginDt;     /** 투찰 시작 일시 */
	 private String bddprEndDt; 	  /** 투찰 종료 일시 */
	 private String bidSttusCode; 	  /** 입찰 상태 코드 */
	 private String partcptnEntrpsQy; /** 참여 업체 수량 */
	 private String intrstEntrpsQy;   /** 관심 업체 수량 */
	 private String dspyAt;			  /** 전시 여부 */
	 private String intrstAt;			  /** 전시 여부 */
	 private String pblancCanclAt; 	  /** 공고 취소 여부 */
	 private String bddprAt; 	  /** 투찰 여부 */
     private String scsbidAt;        /** 낙찰 여부 */
	 private String canclAt;        /** 취소 여부 */
	 private String deleteAt;
	 private String loginYn;        /** 로그인 여부 */
	 private int bidSttusCnt;    /** 입찰 상태코드별 공고 총 개수 */
	 private String bddprTotCnt; 	  /** 투찰 총 개수 */
	 private String scsbidTotCnt; 	  /** 낙찰 총 개수 */
	 private String defeatTotCnt; 	  /** 폐찰 총 개수 */
	 private String failTotCnt; 	  /** 유찰 총 개수 */
	 private String frstRegisterId;
	 private String lastChangerId;
	 private String pcImageOneCours;
	 private String nationUrl;
	 
	 
	 private String filter; 	  /** 01:공고일, 02:마감일 */
	 private String startDate; 	  /** 시작날짜 */
	 private String endDate; 	  /** 끝날짜 */
	 private String tabCode; 	  /** 01:투찰, 02:낙찰, 03:패찰, 04:관심 */
	 private String pageCode;
	 private String pageSubCode;
	 
	 
	 
}
