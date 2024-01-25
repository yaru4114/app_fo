<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>입찰공고관리</title>

    <link rel="stylesheet" type="text/css" href="/bo/guide/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css">
    <!-- Folder tree -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet" type="text/css" href="/bo/guide/js/fullcalendar-5.7.0/lib/main.css">
    <!-- Full calendar -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/css/style.css"/>

    <script type="text/javascript" src="/bo/guide/js/jquery-3.6.0.js"></script>
    <!-- realGrid -->
    <script type="text/javascript" src="/bo/guide/js/realgrid.2.3.2/realgrid-lic.js"></script>
    <script type="text/javascript" src="/bo/guide/js/realgrid.2.3.2/realgrid.2.3.2.min.js"></script>
    <script type="text/javascript" src="/bo/guide/js/realgrid.2.3.2/libs/jszip.min.js"></script>
    <!-- //realGrid -->
    <script type="text/javascript" src="/bo/guide/js/bootstrap-4.6.0/js/dist/util.js"></script>
    <script type="text/javascript" src="/bo/guide/js/bootstrap-4.6.0/js/dist/modal.js"></script>
    <script type="text/javascript" src="/bo/guide/js/bootstrap4-datepicker-master/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="/bo/guide/js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
    <script type="text/javascript" src="/bo/guide/js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="/bo/guide/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script>
    <!-- Folder tree -->
    <script type="text/javascript" src="/bo/guide/js/fullcalendar-5.7.0/lib/main.js"></script>
    <!-- Full calendar -->
    <script type="text/javascript" src="/bo/guide/js/fullcalendar-5.7.0/lib/locales/ko.js"></script>
    <!-- Full calendar(한글) -->
    <script type="text/javascript" src="/bo/guide/js/realgridCustom.js"></script><!-- 퍼블 작성 -->
    <script type="text/javascript" src="/bo/guide/js/common.js"></script><!-- 퍼블 작성 -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/css/common.css" />
    <script src="bidModal.jsp"></script>
</head>
<style>
  #overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 배경의 불투명도 조절을 위한 rgba 값 */
    z-index:10;
  }
</style>

<body>
<div class="web-wrapper">
    <aside class="web-sidebar"></aside>
    <script type="text/javascript"> $(".web-sidebar").load("/bo/guide/html/include/sidebar.html");</script>

    <section class="web-container">
        <header class="web-header"></header>
        <script type="text/javascript"> $(".web-header").load("/bo/guide/html/include/header.html");</script>

        <div class="main-content">
            <div class="inner">
                <div class="sub-title mt-0">
                    <h3 class="">입찰 공고 관리</h3>
                    <div class="btn-box">
                        <button type="button" id="bid_noticeAdd" class="btn"
                                data-toggle="modal" data-target="#exampleModal">입찰 공고 등록</button>
                    </div>
                </div>
                <div id="myModalContainer">
                    <jsp:include page="bidModal.jsp"/>
                </div>
                <div class="dashboard2-wrap tracking" style="overflow: visible;">
                    <div class="section-top-wrap flex-afs-jsb">
                        <section class="dashboard2 dashboard2-card-report month" style="width: 100%">
                            <h2 class="dashboard2-title"> * 등록 입찰 공고 현황</h2>
                            <div class="dashboard2-cont flex-ac-jsb">
                                <dl id="dash_bdngAllText" style="cursor: pointer">
                                    <dt>전체 등록 공고 건</dt>
                                    <dd id="dash_bdngAllCnt"></dd>
                                </dl>
                                <dl id="dash_bdngPrgrsText" style="cursor: pointer">
                                    <dt>입찰중</dt>
                                    <dd id="dash_bdngPrgrsCnt"></dd>
                                </dl>
                                <dl id="dash_bdngDdlnText" style="cursor: pointer">
                                    <dt>입찰마감</dt>
                                    <dd id="dash_bdngDdlnCnt"></dd>
                                </dl>
                                <dl id="dash_bdngSchdlText" style="cursor: pointer">
                                    <dt>입찰예정</dt>
                                    <dd id="dash_bdngSchdlCnt"></dd>
                                </dl>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="search-control" style="margin-top: 0px">
                    <div class="form-set">
                        <span class="label">상태</span>
                        <select class="form-select" name="" id="bidSttusCodeSelectBox">
                            <option value="">전체</option>
                            <c:forEach var="item" items="${ccmmnCdList}">
                                <option value="${item.subCode}">${item.codeNm}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-set">
                        <span class="label">입찰공고번호</span>
                        <input type="text" class="input input-md" id="in_pBidNo"/>
                    </div>
                    <div class="form-set form-expand">
                        <span class="label">일시</span>
                        <div class="form-period-set">
                            <div class="form-period-box">
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="startDatepicker">
                                    <label for="startDatepicker" class="btn has-icon"><i
                                            class="icon icon-calendar">달력</i></label>
                                </div>
                                <span>~</span>
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="endDatepiker">
                                    <label for="endDatepiker" class="btn has-icon"><i
                                            class="icon icon-calendar">달력</i></label>
                                </div>
                            </div>
                            <div class="btn-box btn-period">
                                <button id="btn_today" type="button" class="btn">오늘</button>
                                <button id="btn_afterWeek" type="button" class="btn">일주일</button>
                                <button id="btn_afterMonth" type="button" class="btn">1개월</button>
                                <button id="btn_after6Month" type="button" class="btn">6개월</button>
                                <button id="btn_afterYear" type="button" class="btn">1년</button>
                                <button id="btn_after2Year" type="button" class="btn">2년</button>
                            </div>
                        </div>
                        <div class="search-btn">
                            <button type="button" class="btn btn-blue" id="btn_search">검색</button>
                        </div>
                    </div>
                </div>
                <div class="tab-button" style="margin-bottom: 10px">
                    <a href="#;" id="btn_bdngAllCnt" class="btn active"></a>
                    <a href="#;" id="btn_bdngSchdlCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngPrgrsCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngClcntCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngDdlnCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngWtngCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngSucsCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngPstpnCnt" class="btn"></a>
                </div>
                <!-- realGrid -->
                <div id="realgrid" class="realgrid-wrap" style="margin-top: 0px"></div>
                <!-- paging -->
                <div class="paging-row">
                    <div class="paging wrapper">
                        <button type="button" class="btn btn-bid-black" onclick="setPrevPage()">
                            <
                        </button>
                        <span id="current-page-view"></span>
                        /
                        <span id="total-page-view"></span>
                        <button type="button" class="btn btn-bid-black" onclick="setNextPage()">
                            >
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="pop-modal pop-toast">
        <div class="pop-inner">
            <p id="toastText"></p>
        </div>
    </div>
</div>
<!-- 모달 부분-->
<div id="overlay"></div>
<div class="modal fade" id="modalBidDtl" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
        <input type="hidden" id="modalBidStatCodeHidden">
        <input type="hidden" id="modalBidPblancIdHidden">
        <input type="hidden" id="modalBddprCanclLmttDeHidden">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnClose">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="table table-view">
                    <table>
                        <colgroup>
                            <col class="col-sm" />
                            <col width="15%" />
                            <col class="col-sm" />
                            <col width="*" />
                            <col class="col-sm" />
                            <col width="10%" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>상태</th>
                            <td id="modalBidStatNm"></td>
                            <th id="modalBddprDateText"></th>
                            <td id="modalBddprDate"></td>
                            <th>활성여부</th>
                            <td id="modalActiveAt"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="sub-title mt-12">
                    <h3 class="">공고 정보(*필수)</h3>
                </div>
                <div class="table table-view">
                    <table>
                        <colgroup>
                            <col class="col-md" />
                            <col width="*" />
                            <col class="col-md" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">메탈 구분<i class="icon icon-required"></i></th>
                            <td id="modalMetalCode"></td>
                            <th scope="row">브랜드<i class="icon icon-required"></i></th>
                            <td id="modalBrand"></td>
                        </tr>
                        <tr>
                            <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                            <td id="modalItmPrdlstKorean"></td>
                            <th scope="row">권역</th>
                            <td id="modalDstrctLclsfCode"></td>
                        </tr>
                        <tr>
                            <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                            <td id="modalBidWt"></td>
                            <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                            <td id="modalPermWtRateP"></td>
                        </tr>
                        <tr>
                            <th scope="row">프리미엄 가격(USD/MT)<i class="icon icon-required"></i></th>
                            <td colspan="3">
                                <div class="table table-inner">
                                    <table>
                                        <colgroup>
                                            <col width="6%" />
                                            <col width="*" />
                                            <col width="40%" />
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="row" ></th>
                                            <th scope="row">인도조건</th>
                                            <th scope="row">프리미엄 가격 설정</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="text-center"><b>1</b></td>
                                            <td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
                                            <td>
                                                <input type="text" id="modalDelyCnd01StdrPc" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
                                                &nbsp;&nbsp;
                                                <span class="color-red" id="modalDelyCnd01PremiumPc"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>2</b></td>
                                            <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                            <td>
                                                <input type="text" id="modalDelyCnd02StdrPc" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
                                                &nbsp;&nbsp;
                                                <span class="color-red" id="modalDelyCnd02PremiumPc"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>3</b></td>
                                            <td>CIF INCHEON / CIF BUSAN</td>
                                            <td>
                                                <input type="text" id="modalDelyCnd03StdrPc" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
                                                &nbsp;&nbsp;
                                                <span class="color-red" id="modalDelyCnd03PremiumPc"></span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">인도조건 비고<i class="icon icon-required"></i></th>
                            <td colspan="3">
                                <ul class="color-red">
                                    <li>기타) 부산/인천 보세창고 상차도 조건일 경우 인천지역(+USD8/MT),부산지역(+USD10/MT)을 조정하여 <u>환산 프리미엄으로 입찰 가격 적용</u></li>
                                    <li>기타) 부산/인천 보세창고 낙찰될 경우 해당 운송에 대해서는 서린상사 지정 운송업체를 통해 운송시 서린상사가 해당 금액을 포함한 <u>환산 프리미엄 가격으로 낙찰자에게 지불함</u></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" rowspan="2">인도기한<i class="icon icon-required"></i></th>
                            <td colspan="3" id="modalDelyDate"></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <b>ⓘ</b> 인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="table table-view">
                    <table>
                        <colgroup>
                            <col class="col-md" />
                            <col width="*" />
                            <col class="col-md" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">가격지정기간<i class="icon icon-required"></i></th>
                            <td id="modalPcAppnDate"></td>
                            <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                            <td id="modalPcAppnMthCode"></td>
                        </tr>
                        <tr>
                            <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                            <td colspan="3" id="modalSetleCond"></td>
                        </tr>
                        <tr>
                            <th scope="row">기타 코멘트</th>
                            <td colspan="3" id="modalEtcCn"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="sub-title">
                    <h3 class="">투찰 기간 설정</h3>
                </div>
                <div class="table table-view">
                    <table>
                        <colgroup>
                            <col class="col-md" />
                            <col width="*" />
                            <col class="col-md" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">투찰 시작일<i class="icon icon-required"></i></th>
                            <td id="modalBddprBeginDt"></td>
                            <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                            <td id="modalBddprEndDt"></td>
                        </tr>
                        <tr>
                            <th scope="row">
                                투찰 취소기한<i class="icon icon-required"></i>
                                <div class="icon icon-title-tooltip tooltip" style="margin-left:1px;">
                                    <span class="tooltiptext">
                                        회원사가 투찰 후, 취소를 할때<br/>
                                        설정 된 취소 기한에 따릅니다.
                                    </span>
                                </div>
                            </th>
                            <td colspan="3" id="modalBddprCanclLmttDe"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="sub-title">
                    <h3 class="">활성여부</h3>
                </div>
                <div class="table table-view">
                    <table>
                        <colgroup>
                            <col class="col-md" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">활성여부</th>
                            <td id="modalActiveAt2"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="sub-title">
                    <h3 class="">공고 수정 이력</h3>
                </div>
                <div class="table table-view">
                    <table>
                        <colgroup>
                            <col width="20%" />
                            <col width="*" />
                            <col width="40%" />
                        </colgroup>
                        <tbody id="modalUpdtHst" >
                        </tbody>
                    </table>
                </div>
                <div class="sub-title" id="bidFailTitle" style="display: none">
                    <h3 class="">유찰 사유</h3>
                </div>
                <div class="table table-view" id="bidFailTable" style="display: none">
                    <table>
                        <colgroup>
                            <col width="30%" />
                            <col width="*" />
                        </colgroup>
                        <tbody id="modalFailHstBody" >
                        </tbody>
                    </table>
                </div>
                <div class="btn-box mt-12">
                    <button type="button" class="btn" id="bid_noticeChg" data-toggle="modal"
                            data-target="#exampleModal">공고 수정</button>
                    <button type="button" class="btn" id="btn_bidCancel">공고 취소</button>
                </div>
                <div class="sub-title">
                    <h3 class="">투찰 기업 목록</h3>
                </div>
                <div class="table table-view" style="margin-bottom: 10px">
                    <table>
                        <colgroup>
                            <col width="10%" />
                            <col width="15%" />
                            <col width="15%" />
                            <col width="*" />
                            <col width="10%" />
                            <col width="10%" />
                            <%--<col width="10%" />--%>
                        </colgroup>
                        <tbody id="modalBddprInfo">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="pop-modal pop-toast" id="modalToast">
        <div class="pop-inner">
            <p id="modalToastText"></p>
        </div>
    </div>
</div>
<!-- 모달 엔드 -->
</body>

<script type="text/javascript">
  var provider;
  var girdView;
  var chgPblancId;

  $(document).ready(function () {
    // 오늘 날짜 가져오기
    var today = new Date();
    // Datepicker 초기화 및 오늘 날짜로 설정
    $("#startDatepicker").datepicker({
      format: 'yyyy-mm-dd' ,
      autoclose: true
    });
    $("#endDatepiker").datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true
    });

    var jsonData = getCreateJsonData("");
    $(".form-period-set .btn-box .btn").on("click", getDatePickerButtonId);
    $('#btn_search').on("click", getSearchBtn);
    $(".tab-button .btn").on("click" , getBidStatList);
    $("#btn_bidCancel").on("click" , fnbidCancel);
    $("#btnClose").on("click" , fnClose);
    $(".dashboard2-cont dl").on("click" , getBidStatList);

    realgridCredate();

    ajaxBidNoticeMngStatCntList(jsonData , "Y");
    ajaxBidNoticeMngList(jsonData);
  });

  // 입찰상태 버튼들 클릭시 리스트 조회
  function getBidStatList() {
      var buttonId = $(this).attr('id');
      var bidStat = "";

    if(buttonId === undefined) {
      buttonId = "btn_bdngAllCnt";
    }

    $(".tab-button .btn").removeClass('active');


    if(buttonId == "btn_bdngAllCnt" || buttonId == "dash_bdngAllText") {
      bidStat = "";
      buttonId = "btn_bdngAllCnt";
    } else if (buttonId == "btn_bdngSchdlCnt" || buttonId == "dash_bdngSchdlText") {
      bidStat = "12";
      buttonId = "btn_bdngSchdlCnt";
    } else if (buttonId == "btn_bdngPrgrsCnt" || buttonId == "dash_bdngPrgrsText") {
      bidStat = "13";
      buttonId = "btn_bdngPrgrsCnt";
    } else if (buttonId == "btn_bdngDdlnCnt" || buttonId == "dash_bdngDdlnText" ) {
      bidStat = "30";
      buttonId = "btn_bdngDdlnCnt";
    }else if (buttonId == "btn_bdngClcntCnt" ) {
      bidStat = "33";
    }else if (buttonId == "btn_bdngWtngCnt") {
      bidStat = "11";
    }else if (buttonId == "btn_bdngSucsCnt") {
      bidStat = "31";
    }else if (buttonId == "btn_bdngPstpnCnt") {
      bidStat = "32";
    }

    $("#"+buttonId).addClass('active');
    $("#bidSttusCodeSelectBox").val(bidStat).prop("selected",true);

    var jsonData = getCreateJsonData(bidStat);

    ajaxBidNoticeMngList(jsonData);
}
  // 검색버튼 클릭시
  function getSearchBtn(btnId) {
    var bidStat = $("#bidSttusCodeSelectBox option:selected").val();
    var buttonId = "";

    if (typeof btnId === "string") {
          bidStat = btnId;
      }

    var jsonData = getCreateJsonData(bidStat);

    $(".tab-button .btn").removeClass('active');

    if(bidStat == "" ) {
      buttonId = "btn_bdngAllCnt";
    } else if(bidStat == "12") {
      buttonId = "btn_bdngSchdlCnt";
    } else if(bidStat == "13") {
      buttonId = "btn_bdngPrgrsCnt";
    } else if(bidStat == "33") {
      buttonId = "btn_bdngClcntCnt";
    } else if(bidStat == "30") {
      buttonId = "btn_bdngDdlnCnt";
    } else if(bidStat == "11") {
      buttonId = "btn_bdngWtngCnt";
    } else if(bidStat == "31") {
      buttonId = "btn_bdngSucsCnt";
    } else if(bidStat == "32") {
      buttonId = "btn_bdngPstpnCnt";
    }

    $("#"+buttonId).addClass('active');

    ajaxBidNoticeMngStatCntList(jsonData , 'N');
    ajaxBidNoticeMngList(jsonData);

  }

  // 입찰상태코드별 공고 카운트 조회
  function ajaxBidNoticeMngStatCntList(jsonData , dashYn) {
    $.ajax({
      url: "/bo/bid/noticeMngForm/cntList",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(jsonData),
      dataType: "json",
      success: function (data) {

        $("#btn_bdngAllCnt").text("전체(" + data.bdngAllCnt + ")");
        $("#btn_bdngSchdlCnt").text("입찰예정(" + data.bdngSchdlCnt + ")");
        $("#btn_bdngPrgrsCnt").text("투찰중(" + data.bdngPrgrsCnt + ")");
        $("#btn_bdngClcntCnt").text("공고취소(" + data.bdngClcntCnt + ")");
        $("#btn_bdngDdlnCnt").text("마감(" + data.bdngDdlnCnt + ")");
        $("#btn_bdngWtngCnt").text("공고대기(" + data.bdngWtngCnt + ")");
        $("#btn_bdngSucsCnt").text("낙찰(" + data.bdngSucsCnt + ")");
        $("#btn_bdngPstpnCnt").text("유찰(" + data.bdngPstpnCnt + ")");

        if(dashYn == "Y") {
            $("#dash_bdngAllCnt").text(data.bdngAllCnt);
            $("#dash_bdngPrgrsCnt").text(data.bdngPrgrsCnt);
            $("#dash_bdngDdlnCnt").text(data.bdngDdlnCnt);
            $("#dash_bdngSchdlCnt").text(data.bdngSchdlCnt);
        }

      },
      error: function (xhr, status, error) {
        // 에러 처리 코드
        console.error("에러 발생:", error);
      }
    });
  }

  // 입찰상태코드별 공고 리스트 조회
  function ajaxBidNoticeMngList(jsonData) {
    $.ajax({
      url: "/bo/bid/noticeMngForm/bidList",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(jsonData),
      dataType: "json",
      success: function (data) {

        if (!provider) {
          provider = new RealGrid.LocalDataProvider();
          provider.setFields(fields);
        } else {
          provider.clearRows();
        }

        if (!gridView) {
          gridView = new RealGrid.GridView("realgrid");
        } else {
          gridView.refresh();
        }

        provider.setRows(data);

        var page = gridView.getPage();
        var pageCount = gridView.getPageCount()
        if(pageCount == 0) pageCount = 1;

        // 탭 이동시 그리드 페이지 1로 이동
        $('#current-page-view').text(1);
        $('#total-page-view').text(pageCount);
        gridView.setPage(0);

        gridView.onCellClicked = function (grid , clickData) {
          var rowIndex = clickData.itemIndex;
          var colIndex = clickData.column;
          var bidPblancId = grid.getValue(rowIndex , 0);
          chgPblancId = bidPblancId;

          if(rowIndex !== undefined ) {
              if(colIndex == "bidPblancId" || colIndex == "itmPrdlstKorean") {
                ajaxBidNoticeMngInfo(bidPblancId);
                chgModalOpen();
              }
          }
        }
      },
      error: function (xhr, status, error) {
        // 에러 처리 코드
        console.error("에러 발생:", error);
      }
    });
  }

  // 정보조회
  function ajaxBidNoticeMngInfo(bidPblancId) {
    $.ajax({
      url: "/bo/bid/noticeMngForm/bidInfo",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify({bidPblancId:bidPblancId}),
      dataType: "json",
      success: function (data) {
        $("#modalTitle").empty();

        $("#modalTitle").append("입찰 공고 상세 > " + data.itmPrdlstKorean + '<span style="margin-left:20px;background-color: black; color: white; font-weight:normal;">' + "&nbsp;&nbsp;입찰공고번호 " + data.bidPblancId + '&nbsp;&nbsp;</span>');
        $("#modalBidStatNm").text(data.bidStatNm);
        $("#modalActiveAt").text(data.activeAt); // 모달 활성여부
        $("#modalMetalCode").text(data.metalCode);
        $("#modalBrand").text(data.brandGroupCode + " / 브랜드 " + data.brandCode);
        $("#modalItmPrdlstKorean").text(data.itmPrdlstKorean);
        $("#modalDstrctLclsfCode").text(data.dstrctLclsfCode);
        $("#modalBidWt").text(data.bidWt);
        $("#modalDelyCnd01StdrPc").val(data.delyCnd01StdrPc);
        $("#modalDelyCnd01PremiumPc").text(data.delyCnd01PremiumPc);
        $("#modalDelyCnd02StdrPc").val(data.delyCnd02StdrPc);
        $("#modalDelyCnd02PremiumPc").text(data.delyCnd02PremiumPc);
        $("#modalDelyCnd03StdrPc").val(data.delyCnd03StdrPc);
        $("#modalDelyCnd03PremiumPc").text(data.delyCnd03PremiumPc);
        $("#modalDelyDate").text(data.delyBeginDe + " ~ " + data.delyEndDe);
        $("#modalPcAppnDate").text(data.pcAppnBeginDe + " ~ " + data.pcAppnEndDe);
        $("#modalPcAppnMthCode").text(data.pcAppnMthCode);
        $("#modalSetleCond").text(data.setleCrncyCode + " " + data.setleMthCode + " " + data.setlePdCode);
        $("#modalEtcCn").text(data.etcCn);
        $("#modalBddprBeginDt").text(data.bddprBeginDtInfo);
        $("#modalBddprEndDt").text(data.bddprEndDtInfo);
        $("#modalBddprCanclLmttDe").text(data.bddprCanclLmttDe);
        $("#modalActiveAt2").text(data.activeAt);
        $("#modalBidStatCodeHidden").val(data.bidSttusCode);
        $("#modalBidPblancIdHidden").val(data.bidPblancId);
        $("#modalBddprCanclLmttDeHidden").val(data.bddprCanclLmttDe);
        $("#modalPermWtRateP").text(data.permWtRateP + "%");

        // 공고취소 및 유찰하기 버튼
        if(data.bidSttusCode == "31" || data.bidSttusCode == "32" || data.bidSttusCode == "33") {
            $("#btn_bidCancel").css("display" , "none");
        } else {
            $("#btn_bidCancel").css("display" , "block");
            if(data.bidSttusCode == "11") {
              $("#btn_bidCancel").text("공고 삭제");
            } else if(data.bidSttusCode == "13" && data.bidBddprDtlVoList.length > 0 ) {
              $("#btn_bidCancel").text("유찰하기");
            } else {
              $("#btn_bidCancel").text("공고 취소");
            }
        }

        // 일자
        if(data.bidSttusCode == "33") {
          $("#modalBddprDateText").text("취소일시");
          $("#modalBddprDate").text(data.pblancCanclDt);
        } else if(data.bidSttusCode == "32"){
          $("#modalBddprDateText").text("유찰일시");
          $("#modalBddprDate").text(data.failBidDt);
        } else {
          $("#modalBddprDateText").text("시작 ~ 마감");
          $("#modalBddprDate").text(data.bddprDate);
        }

        // 공고수정이력
        $("#modalUpdtHst").empty();
        $("#modalUpdtHst").append('<tr><th scope="row" class="text-center">수정일시</th><th scope="row" class="text-center" >수정 내용</th><th scope="row" class="text-center">수정 사유</th></tr>');
        if(data.bidNoticeUpdtVoList.length == 0 ) {
          $("#modalUpdtHst").append('<tr>');
          $("#modalUpdtHst").append('<td colspan="3"></td>');
          $("#modalUpdtHst").append('</tr>');
        } else {
            $.each(data.bidNoticeUpdtVoList , function(index , item) {
              $("#modalUpdtHst").append('<tr>');
              $("#modalUpdtHst").append('<td>'+ item.frstRegistDt + '</td>');
              $("#modalUpdtHst").append('<td>'+ item.bidUpdtCn + '</td>');
              $("#modalUpdtHst").append('<td>'+ item.bidUpdtResn + '</td>');
              $("#modalUpdtHst").append('</tr>');
            });
        }

        // 투찰기업목록
        $("#modalBddprInfo").empty();
        $("#modalBddprInfo").append('<tr><th scope="row" class="text-center">순위</th><th scope="row" class="text-center">기업명</th><th scope="row" class="text-center">투찰 일시</th><th scope="row" class="text-center">인도조건</th> <th scope="row" class="text-center">투찰 가격(USD)</th><th scope="row" class="text-center">상태</th></tr>');
        if(data.bidBddprDtlVoList.length == 0 ) {
          if(data.bidSttusCode == "12") {
            $("#modalBddprInfo").append('<tr>');
            $("#modalBddprInfo").append('<td style="text-align: center" colspan="6">투찰 시작 전입니다.</td>');
            $("#modalBddprInfo").append('</tr>');
          } else {
            $("#modalBddprInfo").append('<tr>');
            $("#modalBddprInfo").append('<td colspan="6"> </td>');
            $("#modalBddprInfo").append('</tr>');
          }
        } else {
            $.each(data.bidBddprDtlVoList , function(index,item){
              $("#modalBddprInfo").append('<tr>');
              $("#modalBddprInfo").append('<td class="text-center"><b>' + item.rownum + '</b></td>');
              $("#modalBddprInfo").append('<td>' + item.entrpsNm + '</td>');
              $("#modalBddprInfo").append('<td>' + item.frstRegistDt + '</td>');
              $("#modalBddprInfo").append('<td>' + item.delyCndCodeNm + '</td>');
              $("#modalBddprInfo").append('<td class="text-center">' + item.bddprPremiumPc + '</td>');
              $("#modalBddprInfo").append('<td class="text-center">' + item.bidStatNm + '</td>');
              $("#modalBddprInfo").append('</tr>');
            });
        }

        // 유찰사유
        if(data.bidSttusCode == "32") {
          $("#bidFailTitle").css('display' , 'block');
          $("#bidFailTable").css('display' , 'block');
          $("#modalFailHstBody").empty();
          $("#modalFailHstBody").append('<tr><th scope="row" class="text-center">유찰일시</th><th scope="row" class="text-center">유찰 사유</th></tr>');
          $("#modalFailHstBody").append('<tr>');
          $("#modalFailHstBody").append('<td>' + data.failBidDt);
          $("#modalFailHstBody").append('<td>' + data.failBidResn);
          $("#modalFailHstBody").append('<tr>');
        } else {
          $("#bidFailTitle").css('display' , 'none');
          $("#bidFailTable").css('display' , 'none');
        }

      },
      error: function (xhr, status, error) {
        // 에러 처리 코드
        console.error("에러 발생:", error);
      }
    });

    $("#modalBidDtl").show();
    $(".modal-body").scrollTop(0);
    $("#modalBidDtl").addClass('show');
    $("#overlay").show();
  }

  // 공고취소 버튼 클릭시
  function fnbidCancel(){
    var btnText = $("#btn_bidCancel").text();
    var bidSttusCode = $("#modalBidStatCodeHidden").val();
    var confirmTxt = "";
    var afterText = "";
    var passingYn = "N";
    var bddprCanclYn = "N";
    var bddprCanclLmttDe = $("#modalBddprCanclLmttDeHidden").val();
    var convertBddprCanclDate = new Date(bddprCanclLmttDe.replace(/-/g, '/'));
    var toDate = new Date();

    // 투찰취소제한 일자가 있으면 서버시간이랑 비교
    if(bddprCanclLmttDe != null && bddprCanclLmttDe !== undefined && bddprCanclLmttDe != "") {
        if(convertBddprCanclDate > toDate ) {
          bddprCanclYn = "Y";
        }
    }

    if(bidSttusCode != "13" || bddprCanclYn == "N") {

        if(bidSttusCode == 12) {
          confirmTxt = "해당 공고 건은 입찰 예정건 입니다. 공고 취소 시 노출되지 않습니다. 취소하시겠습니까?";
          afterText = "공고 건이 삭제 되었습니다.";
        } else if (bidSttusCode == 13 && btnText == "공고 취소") {
          confirmTxt = "해당 공고 건은 투찰 진행중 입니다. 공고 취소 시, 비활성 상태로 전환되며 회원의 공고 목록에서 삭제 처리됩니다. 공고 취소 하시겠습니까?"
          afterText = "공고 가 취소 되었습니다.";
        } else if (bidSttusCode == 13 && btnText == "유찰하기") {
          confirmTxt = "유찰할 경우, 유찰 사유 입력 후 유찰처리하기 클릭 시 모든과정이 무효처리됩니다. 정말로 유찰 처리 하시겠습니까?";
          afterText = "유찰 처리 되었습니다.";
          passingYn = "Y";
        } else if( bidSttusCode == 11 && btnText == "공고 삭제") {
          confirmTxt = "해당 공고 건을 삭제하시겠습니까?";
          afterText = "공고 가 삭제 되었습니다.";
        }

        // 공고 취소 인 경우
        if(passingYn == "N") {
          if (confirm(confirmTxt)) {
            var jsonData = {
              bidPblancId: $("#modalBidPblancIdHidden").val(),
              bidSttusCode: $("#modalBidStatCodeHidden").val()
            };

            $.ajax({
              url: "/bo/bid/noticeMngForm/bidCancel",
              type: "POST",
              contentType: "application/json; charset=utf-8",
              data: JSON.stringify(jsonData),
              dataType: "json",
              success: function (data) {

                if(data > 0) {
                    var jsonData = getCreateJsonData("");
                    ajaxBidNoticeMngStatCntList(jsonData , 'Y');
                    getBidStatList();

                    $("#modalBidDtl").hide();
                    $("#overlay").hide();

                    $("#toastText").text(afterText);
                    $('.pop-toast').fadeIn(300);

                    setTimeout(function(){
                      $('.pop-toast').fadeOut(300);
                    },2000);
                }

              },
              error: function (xhr, status, error) {
                // 에러 처리 코드
                console.error("에러 발생:", error);

                $("#modalBidDtl").hide();
                $("#overlay").hide();

                $("#toastText").text("실패하였습니다.");
                $('.pop-toast').fadeIn(300);

                setTimeout(function(){
                  $('.pop-toast').fadeOut(300);
                },2000);
              }
            });
          }
        } else {
            var result = prompt(confirmTxt,"유찰 사유를 입력해주세요.(15자이내)");

            if(result == null) {
            } else if (result == "") {
              $("#modalToastText").text("유찰 사유를 입력해주세요.");
              $('#modalToast').fadeIn(300);

              setTimeout(function(){
                $('#modalToast').fadeOut(300);
              },2000);

            } else {

              var jsonData = {
                bidPblancId: $("#modalBidPblancIdHidden").val(),
                bidSttusCode: $("#modalBidStatCodeHidden").val(),
                failBidResn : result
              };

              $.ajax({
                url: "/bo/bid/noticeMngForm/bidCancel",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(jsonData),
                dataType: "json",
                success: function (data) {

                  if(data > 0) {

                    var jsonData = getCreateJsonData("");

                    ajaxBidNoticeMngStatCntList(jsonData , 'Y');
                    getBidStatList();

                    $("#modalBidDtl").hide();
                    $("#overlay").hide();

                    $("#toastText").text(afterText);
                    $('.pop-toast').fadeIn(300);

                    setTimeout(function(){
                      $('.pop-toast').fadeOut(300);
                    },2000);
                  }

                },
                error: function (xhr, status, error) {
                  // 에러 처리 코드
                  console.error("에러 발생:", error);

                  $("#modalBidDtl").hide();
                  $("#overlay").hide();

                  $("#toastText").text("실패하였습니다.");
                  $('.pop-toast').fadeIn(300);

                  setTimeout(function(){
                    $('.pop-toast').fadeOut(300);
                  },2000);
                }
              });
            }
        }
    } else {
      alert("투찰 취소 제한중입니다");
    }
  }


  // 데이트 피커 버튼 클릭 함수
  function getDatePickerButtonId() {
    // 클릭된 버튼의 아이디 가져오기
    var buttonId = $(this).attr('id');

    //시작날짜는 오늘로 고정
    $("#startDatepicker").datepicker('setDate', 'today');
    $(".btn-box.btn-period .btn").removeClass('active');

    if (buttonId == "btn_today") {
      $("#endDatepiker").datepicker('setDate', 'today');
    } else if (buttonId == "btn_afterWeek") {
      $("#endDatepiker").datepicker('setDate', '+7D');
    } else if (buttonId == "btn_afterMonth") {
      $("#endDatepiker").datepicker('setDate', '+1M');
    } else if (buttonId == "btn_after6Month") {
      $("#endDatepiker").datepicker('setDate', '+6M');
    } else if (buttonId == "btn_afterYear") {
      $("#endDatepiker").datepicker('setDate', '+1Y');
    } else if (buttonId == "btn_after2Year") {
      $("#endDatepiker").datepicker('setDate', '+2Y');
    }

    $("#" + buttonId).addClass('active');
  }

  // jsonData 생성
  function getCreateJsonData(bidSttusCode){
    var jsonData = {
      startDate: $("#startDatepicker").datepicker({dateformat: 'yyyy-mm-dd'}).val(),
      endDate: $("#endDatepiker").datepicker({dateformat: 'yyyy-mm-dd'}).val(),
      bidPblancId: $("#in_pBidNo").val(),
      bidSttusCode: bidSttusCode
    };

    return jsonData;
  }

  function fnClose(){
    $("#modalBidDtl").hide();
    $("#modalBidDtl").removeClass('show');
    $("#overlay").hide();
  }

  // real그리드
  function realgridCredate(){
      provider = new RealGrid.LocalDataProvider();
      gridView = new RealGrid.GridView("realgrid");

      gridView.header.height = 80;
      gridView.displayOptions.rowHeight = 36;
      gridView.stateBar.width = 16;

      gridView.setFooters({
        visible: false
      });
      gridView.setCheckBar({
        visible: false
      });
      gridView.setRowIndicator({
        visible: false
      });

      var fields = [
        { fieldName: "bidPblancId" },
        { fieldName: "metalCode" },
        { fieldName: "itmPrdlstKorean" },
        { fieldName: "brandCode" },
        { fieldName: "brandGroupCode" },
        { fieldName: "dstrctLclsfCode" },
        { fieldName: "bidWt" },
        { fieldName: "itmQty" },
        { fieldName: "bddprDate" },
        { fieldName: "activeAt" },
        { fieldName: "frstRegistDt" },
        { fieldName: "frstRegisterId" },
        { fieldName: "bidStatNm" },
        { fieldName: "stepNm" },
        { fieldName: "bdngCmpny" },
        { fieldName: "lwstPrprc" }
      ];
      provider.setFields(fields);

      var columns = [
        { name: "bidPblancId", fieldName: "bidPblancId", type: "text", width: "110", styles: { textAlignment: "near" } ,header:{text:"입찰공고번호"}},
        { name: "metalCode", fieldName: "metalCode", type: "text", width: "60", styles: { textAlignment: "near" } ,header:{text:"메탈"} },
        { name: "itmPrdlstKorean", fieldName: "itmPrdlstKorean", type: "text", width: "230", styles: { textAlignment: "near" } ,header:{text:"상품명"}},
        { name: "brandCode", fieldName: "brandCode", type: "text", width: "100", styles: { textAlignment: "near" } ,header:{text:"구분"}},
        { name: "brandGroupCode", fieldName: "brandGroupCode", type: "text", width: "120", styles: { textAlignment: "near" } ,header:{text:"그룹"} },
        { name: "dstrctLclsfCode", fieldName: "dstrctLclsfCode", type: "text", width: "60", styles: { textAlignment: "near" } ,header:{text:"권역"}},
        { name: "bidWt", fieldName: "bidWt", type: "text", width: "60", styles: { textAlignment: "near" } ,header:{text:"수량"}},
        { name: "itmQty", fieldName: "itmQty", type: "text", width: "80", styles: { textAlignment: "near" } ,header:{text:"중량"}},
        { name: "bddprDate", fieldName: "bddprDate", type: "text", width: "250", styles: { textAlignment: "near" } ,header:{text:"시작 ~ 마감"}},
        { name: "activeAt", fieldName: "activeAt", type: "text", width: "80", styles: { textAlignment: "near" } ,header:{text:"활성여부"}} ,
        // { name: "frstRegist", fieldName: "frstRegist", editor: {type:"multiline" , altEnterNewLine:true , height:0} , styleName: ".multi-line-editor", width: "170", styles: { textAlignment: "near" },header:{text:"등록일\n(등록자)" , styleName:"multi-line-css"}},
        { name: "frstRegistDt", fieldName: "frstRegistDt", type: "text", width: "120", styles: { textAlignment: "near"} ,header:{text:"등록일"} },
        { name: "frstRegisterId", fieldName: "frstRegisterId", type: "text", width: "70", styles: { textAlignment: "near" } ,header:{text:"등록자"} },
        { name: "bidStatNm", fieldName: "bidStatNm", type: "text", width: "80", styles: { textAlignment: "near" } ,header:{text:"상태"} },
        { name: "bdngCmpny", fieldName: "bdngCmpny", type: "text", width: "70", styles: { textAlignment: "near" },header:{text:"투찰기업"}},
        { name: "lwstPrprc", fieldName: "lwstPrprc", type: "text", width: "100", styles: { textAlignment: "near" },header:{text:"최저프리미엄가"}}
      ];

      var layout = [
          "bidPblancId",
          "metalCode",
          "itmPrdlstKorean",
        {name:"brandGroup" , direction:"horizontal" , items:["brandCode" , "brandGroupCode"] , header:{text:"브랜드"}},
          "dstrctLclsfCode",
          "bidWt",
          "itmQty",
          "bddprDate",
          "activeAt",
          "frstRegistDt",
          "frstRegisterId",
          "bidStatNm",
          "bdngCmpny",
          "lwstPrprc"
      ];

      gridView.setColumnLayout(layout);
      gridView.setDataSource(provider);
      gridView.setColumns(columns);

      gridView.setPaging(true, 10);

      gridView.onPageChanged = function (grid, page) {
        $('#current-page-view').text(page + 1);
      };

      gridView.onPageCountChanged = function (grid, pageCount) {
        $('#total-page-view').text(pageCount);
      };

      gridView.setDisplayOptions({
        showEmptyMessage: true,
        emptyMessage: "데이터가 존재하지 않습니다."
      });
  }

  // 이전 페이지로 이동
  function setPrevPage() {
    var currentPage = gridView.getPage();
    gridView.setPage(currentPage - 1);
  }

  // 다음 페이지로 이동
  function setNextPage() {
    var currentPage = gridView.getPage();
    gridView.setPage(currentPage + 1);
  }

  $('#bid_noticeAdd').click(function () {
      $('#myModalContainer').load("bidModal.jsp", function () {
          $('#exampleModal').show();
          openBidModal('입찰 공고 등록', false);

          $('.close').click(function () {
              $('#exampleModal').hide();
              $("#overlay").hide();
              resetForm();
          });
      });
  });

  $('#bid_noticeChg').click(function () {
      $("#overlay").hide();
      $("#modalBidDtl").removeClass('show');

      $('#myModalContainer').load("bidModal.jsp", function () {
          $('#modalBidDtl').hide();
          $("#overlay").hide();
          $('#exampleModal').show();
          openBidModal('입찰 공고 수정', true);

          $('.close').click(function () {
              $('#exampleModal').hide();
              $("#overlay").hide();
              resetForm();
          });
      });
  });


</script>
</html>