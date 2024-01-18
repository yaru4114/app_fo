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

<body>
<div class="web-wrapper">
    <aside class="web-sidebar"></aside>
    <script type="text/javascript"> $(".web-sidebar").load(
        "/bo/guide/html/include/sidebar.html");</script>

    <section class="web-container">
        <header class="web-header"></header>
        <script type="text/javascript"> $(".web-header").load(
            "/bo/guide/html/include/header.html");</script>

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
                <div class="dashboard2-wrap tracking">
                    <div class="section-top-wrap flex-afs-jsb">
                        <section class="dashboard2 dashboard2-card-report month" style="width: 100%">
                            <h2 class="dashboard2-title"> * 등록 입찰 공고 현황</h2>
                            <div class="dashboard2-cont flex-ac-jsb">
                                <dl>
                                    <dt>전체 등록 공고 건</dt>
                                    <dd id="dash_bdngAllCnt"></dd>
                                </dl>
                                <dl>
                                    <dt>입찰중</dt>
                                    <dd id="dash_bdngPrgrsCnt"></dd>
                                </dl>
                                <dl>
                                    <dt>입찰마감</dt>
                                    <dd id="dash_bdngDdlnCnt"></dd>
                                </dl>
                                <dl>
                                    <dt>입찰예정</dt>
                                    <dd id="dash_bdngSchdlCnt"></dd>
                                </dl>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="search-control">
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
                        <span class="label">검색구분</span>
                        <select class="form-select">
                            <option value="">전체</option>
                        </select>
                    </div>
                    <div class="form-set form-expand">
                        <span class="label">일시</span>
                        <div class="form-period-set">
                            <div class="form-period-box">
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="datepicker1">
                                    <label for="datepicker1" class="btn has-icon"><i
                                            class="icon icon-calendar">달력</i></label>
                                </div>
                                <span>~</span>
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="datepicker2">
                                    <label for="datepicker2" class="btn has-icon"><i
                                            class="icon icon-calendar">달력</i></label>
                                </div>
                            </div>
                            <div class="btn-box btn-period">
                                <button id="btn_today" type="button" class="btn active">오늘</button>
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
                    <a href="#;" id="btn_bdngDdlnCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngClcntCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngWtngCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngSucsCnt" class="btn"></a>
                    <a href="#;" id="btn_bdngPstpnCnt" class="btn"></a>
                </div>
                <div class="table table-view table-fixed-head text-center"
                     style="overflow: auto; height: 100%">
                    <table class="table-head border-none">
                        <colgroup>
                            <col width="100px" />
                            <col width="80px" />
                            <col width="100px" />
                            <col width="80px" />
                            <col width="100px" />
                            <col width="50px" />
                            <col width="50px" />
                            <col width="70px" />
                            <col width="150px" />
                            <col width="80px" />
                            <col width="100px" />
                            <col width="80px" />
                            <col width="80px" />
                            <col width="80px" />
                            <col width="120px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan="2" scope="col">입찰공고<br>번호</th>
                                <th rowspan="2"scope="col">메탈</th>
                                <th rowspan="2"scope="col">아이템<br>상품명</th>
                                <th colspan="2">브랜드</th>
                                <th rowspan="2"scope="col">권역</th>
                                <th rowspan="2"scope="col">수량</th>
                                <th rowspan="2"scope="col">중량</th>
                                <th rowspan="2"scope="col">시작-마감</th>
                                <th rowspan="2"scope="col">활성<br>여부</th>
                                <th rowspan="2"scope="col">등록일<br>(등록자)</th>
                                <th rowspan="2"scope="col">상태</th>
                                <th rowspan="2"scope="col">단계</th>
                                <th rowspan="2"scope="col">투찰<br>기업</th>
                                <th rowspan="2"scope="col">최저<br>프리미엄가</th>
                            </tr>
                            <tr>
                                <th>구분</th>
                                <th>그룹</th>
                            </tr>
                        </thead>
                    </table>
                    <!-- //바디부 -->
                    <div class="table-body body-sm" style="overflow: visible">
                        <table>
                            <colgroup>
                                <col width="100px" />
                                <col width="80px" />
                                <col width="100px" />
                                <col width="80px" />
                                <col width="100px" />
                                <col width="50px" />
                                <col width="50px" />
                                <col width="70px" />
                                <col width="150px" />
                                <col width="80px" />
                                <col width="100px" />
                                <col width="80px" />
                                <col width="80px" />
                                <col width="80px" />
                                <col width="120px" />
                            </colgroup>
                            <tbody id="dynamicTbody">
                            <%--동적 테이블 생성 예정--%>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- 모달 부분-->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">

                                </h5>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                                            <td id="bidStatNm"></td>
                                            <th>시작~마감</th>
                                            <td id="bddprDate"></td>
                                            <th>활성여부</th>
                                            <td id="activeAt"></td>
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
                                            <td>
                                                AL
                                            </td>
                                            <th scope="row">브랜드<i class="icon icon-required"></i></th>
                                            <td>
                                                알루미늄(서구산) / 브랜드 무관
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                                            <td>
                                                PRIMARY AL INGOT P1020
                                            </td>
                                            <th scope="row">권역</th>
                                            <td>
                                                인천
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                                            <td>
                                                2000
                                            </td>
                                            <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                                            <td>
                                                10 %
                                            </td>
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
                                                                <input type="text" value="0" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
                                                                &nbsp;&nbsp;
                                                                <span class="color-red">+USD 15.0</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center"><b>2</b></td>
                                                            <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                                            <td>
                                                                <input type="text" value="100" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
                                                                &nbsp;&nbsp;
                                                                <span class="color-red">+USD 15.0</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center"><b>3</b></td>
                                                            <td>CIF INCHEON / CIF BUSAN</td>
                                                            <td>
                                                                <input type="text" value="200" class="input" style="width:50%; background-color:#fafafa;" readonly="readonly">
                                                                &nbsp;&nbsp;
                                                                <span class="color-red">+USD 15.0</span>
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
                                            <td colspan="3">
                                                2022.08.01 ~ 2022.08.10
                                            </td>
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
                                            <td>
                                                2022.02.02 ~ 2022.03.01
                                            </td>
                                            <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                                            <td>
                                                Monthly Avg+
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                                            <td colspan="3">
                                                USD T/T AGAINST CONDITIONAL RELEASE ISSUED BY WAREHOUSE
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">기타 코멘트</th>
                                            <td colspan="3">
                                                LME Warrant 제품 납품 불가
                                            </td>
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
                                            <td>
                                                2022.08.01. 10:10:10
                                            </td>
                                            <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                                            <td>
                                                2022.08.05. 10:10:10
                                            </td>
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
                                            <td colspan="3">
                                                2022.08.04. 10:10:10
                                                <!-- 투찰취소불가 -->
                                            </td>
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
                                            <td>
                                                활성
                                            </td>
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
                                        <tbody>
                                        <tr>
                                            <th scope="row">수정일시</th>
                                            <th scope="row">수정 내용</th>
                                            <th scope="row">수정 사유</th>
                                        </tr>
                                        <tr>
                                            <td>2022.01.03.10:10:10</td>
                                            <td>수정 내용1</td>
                                            <td>수정 사유1</td>
                                        </tr>
                                        <tr>
                                            <td>2022.01.04.10:10:00</td>
                                            <td>수정 내용2</td>
                                            <td>수정 사유2</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="btn-box mt-12">
                                    <button type="button" class="btn">공고 수정</button>
                                    <button type="button" class="btn">공고 취소</button>
                                </div>

                                <div class="sub-title">
                                    <h3 class="">투찰 기업 목록</h3>
                                </div>
                                <div class="table table-view">
                                    <table>
                                        <colgroup>
                                            <col width="10%" />
                                            <col width="15%" />
                                            <col width="15%" />
                                            <col width="*" />
                                            <col width="10%" />
                                            <col width="10%" />
                                            <col width="10%" />
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="text-center">순위</th>
                                            <th scope="row" class="text-center">기업명</th>
                                            <th scope="row" class="text-center">투찰 일시</th>
                                            <th scope="row" class="text-center">인도조건</th>
                                            <th scope="row" class="text-center">투찰 가격(USD)</th>
                                            <th scope="row" class="text-center">상태</th>
                                            <th scope="row" class="text-center">처리단계</th>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>1</b></td>
                                            <td><a href="#" class="rg-link-renderer">엠투엠글로벌</a></td>
                                            <td>2022.01.02. 10:10:10</td>
                                            <td>서린상사 지정 보세창고 도착도(FCA서린상사 지정보세창고)</td>
                                            <td class="text-center">11</td>
                                            <td class="text-center">투찰 중</td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>2</b></td>
                                            <td><a href="#" class="rg-link-renderer">반진메탈</a></td>
                                            <td>2022.01.02. 10:11:25</td>
                                            <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                            <td class="text-center">111</td>
                                            <td class="text-center">투찰 중</td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"><b>3</b></td>
                                            <td><a href="#" class="rg-link-renderer">기업명칭</a></td>
                                            <td>2022.01.03. 11:11:20</td>
                                            <td>CIF INCHEON / CIF BUSAN</td>
                                            <td class="text-center">112</td>
                                            <td class="text-center">투찰 중</td>
                                            <td class="text-center">-</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <!-- <div class="btn-box">
                                    <button type="button" class="btn">입찰 공고 등록</button>
                                    <button type="button" class="btn" data-dismiss="modal">취소</button>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 모달 엔드 -->
            </div>
        </div>
    </section>
</div>
</body>
<script type="text/javascript">
  $(document).ready(function () {
    // 오늘 날짜 가져오기
    var today = new Date();
    // Datepicker 초기화 및 오늘 날짜로 설정
    $("#datepicker1").datepicker({
      format: 'yyyy-mm-dd'
    });
    $("#datepicker2").datepicker({
      format: 'yyyy-mm-dd'
    });

    var jsonData = getCreateJsonData("");
    $(".btn-box .btn").on("click", getDatePickerButtonId);
    $('#btn_search').on("click", getSearchBtn);
    $(".tab-button .btn").on("click" , getBidStatList);


    ajaxBidNoticeMngStatCntList(jsonData);
    ajaxBidNoticeMngList(jsonData);

      $('#bid_noticeAdd').click(function () {
          $('#myModalContainer').load("bidModal.jsp", function () {
              $('#exampleModal').show();

              $('.close').click(function () {
                  $('#exampleModal').hide();
              });
          });
      });

  });

  // 입찰상태 버튼들 클릭시 리스트 조회
  function getBidStatList() {
    var buttonId = $(this).attr('id');
    var bidStat = "";

    $(".tab-button .btn").removeClass('active');

    if(buttonId == "btn_bdngAllCnt") {
      bidStat = "";
    } else if (buttonId == "btn_bdngSchdlCnt") {
      bidStat = "12";
    } else if (buttonId == "btn_bdngPrgrsCnt") {
      bidStat = "13";
    } else if (buttonId == "btn_bdngDdlnCnt") {
      bidStat = "33";
    }else if (buttonId == "btn_bdngClcntCnt") {
      bidStat = "30";
    }else if (buttonId == "btn_bdngWtngCnt") {
      bidStat = "11";
    }else if (buttonId == "btn_bdngSucsCnt") {
      bidStat = "31";
    }else if (buttonId == "btn_bdngPstpnCnt") {
      bidStat = "32";
    }
    $("#"+buttonId).addClass('active');

    console.log("getBidStatList buttonId : " + buttonId + " bidStat : " + bidStat);

    var jsonData = getCreateJsonData(bidStat);

    ajaxBidNoticeMngList(jsonData);
}
  // 검색버튼 클릭시
  function getSearchBtn() {
    var bidStat = $("#bidSttusCodeSelectBox option:selected").val();
    var buttonId = "";
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

    console.log("getSearchBtn buttonId :" + buttonId + " bidStat : " + bidStat);
    $("#"+buttonId).addClass('active');

    ajaxBidNoticeMngStatCntList(jsonData);
    ajaxBidNoticeMngList(jsonData);

  }

  // 입찰상태코드별 공고 카운트 조회
  function ajaxBidNoticeMngStatCntList(jsonData) {
    $.ajax({
      url: "/bo/bid/noticeMngForm/cntList",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(jsonData),
      dataType: "json",
      success: function (data) {
        console.log("서버 응답:", data);

        $("#btn_bdngAllCnt").text("전체(" + data.bdngAllCnt + ")");
        $("#btn_bdngSchdlCnt").text("입찰예정(" + data.bdngSchdlCnt + ")");
        $("#btn_bdngPrgrsCnt").text("투찰중(" + data.bdngPrgrsCnt + ")");
        $("#btn_bdngDdlnCnt").text("공고취소(" + data.bdngClcntCnt + ")");
        $("#btn_bdngClcntCnt").text("마감(" + data.bdngDdlnCnt + ")");
        $("#btn_bdngWtngCnt").text("공고대기(" + data.bdngWtngCnt + ")");
        $("#btn_bdngSucsCnt").text("낙찰(" + data.bdngSucsCnt + ")");
        $("#btn_bdngPstpnCnt").text("유찰(" + data.bdngPstpnCnt + ")");

        $("#dash_bdngAllCnt").text(data.bdngAllCnt);
        $("#dash_bdngPrgrsCnt").text(data.bdngPrgrsCnt);
        $("#dash_bdngDdlnCnt").text(data.bdngDdlnCnt);
        $("#dash_bdngSchdlCnt").text(data.bdngSchdlCnt);

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
        console.log("서버 응답:", data);

        $("#dynamicTbody").empty();

        $.each(data , function(index , item) {
          $("#dynamicTbody").append('<tr>');
          //$("#dynamicTbody").append('<td style="color:red;"> <a href="/bo/bid/noticeDtlForm?bidPblancId='+item.bidPblancId+'"</a>' + item.bidPblancId + '</td>');
          $("#dynamicTbody").append('<td class="appendClass" id="'+ item.bidPblancId + '"data-toggle="modal" data-target="#exampleModal">' + item.bidPblancId + '</td>' );
          //$("#dynamicTbody").append('<td class="appendClass" id="'+ item.bidPblancId + '">' + item.bidPblancId + '</td>' );
          $("#dynamicTbody").append('<td>' + item.metalCode + '</td>');
          $("#dynamicTbody").append('<td>' + item.itmPrdlstKorean + '</td>');
          $("#dynamicTbody").append('<td>' + item.brandCode + '</td>');
          $("#dynamicTbody").append('<td>' + item.brandGroupCode + '</td>');
          $("#dynamicTbody").append('<td>' + item.dstrctLclsfCode + '</td>');
          $("#dynamicTbody").append('<td>' + item.bidWt + '</td>');
          $("#dynamicTbody").append('<td>' + item.itmQty + '</td>');
          $("#dynamicTbody").append('<td>' + item.bddprBeginDt + ' ~ ' + item.bddprEndDt + '</td>');
          $("#dynamicTbody").append('<td>' + item.activeAt + '</td>');
          $("#dynamicTbody").append('<td>' + item.frstRegistDt + '<br>' + '(' + item.frstRegisterId + ')' + '</td>');
          $("#dynamicTbody").append('<td>' + item.bidStatNm + '</td>');
          $("#dynamicTbody").append('<td>' + item.stepNm + '</td>');
          $("#dynamicTbody").append('<td>' + item.bdngCmpny + '</td>');
          $("#dynamicTbody").append('<td>' + item.lwstPrprc + '</td>');
          $("#dynamicTbody").append('</tr>');
        });

        $(".appendClass").click(function(){
          var bidPblancId = $(this).attr('id');
          console.log("appendClass Click : " + bidPblancId);

          ajaxBidNoticeMngInfo(bidPblancId);
        });

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
        console.log("서버 응답:", data);
        $("#exampleModalLabel").empty();

        $("#exampleModalLabel").append("입찰 공고 상세 > " + data.itmPrdlstKorean + '<span style="margin-left:20px;background-color: black; color: white; font-weight:normal;">' + "&nbsp;&nbsp;입찰공고번호 " + data.bidPblancId + '&nbsp;&nbsp;</span>');

      },
      error: function (xhr, status, error) {
        // 에러 처리 코드
        console.error("에러 발생:", error);
      }
    });
  }


  function getDatePickerButtonId() {
    // 클릭된 버튼의 아이디 가져오기
    var buttonId = $(this).attr('id');

    //시작날짜는 오늘로 고정
    $("#datepicker1").datepicker('setDate', 'today');
    $(".btn-box.btn-period .btn").removeClass('active');

    if (buttonId == "btn_today") {
      $("#datepicker2").datepicker('setDate', 'today');
    } else if (buttonId == "btn_afterWeek") {
      $("#datepicker2").datepicker('setDate', '+7D');
    } else if (buttonId == "btn_afterMonth") {
      $("#datepicker2").datepicker('setDate', '+1M');
    } else if (buttonId == "btn_after6Month") {
      $("#datepicker2").datepicker('setDate', '+6M');
    } else if (buttonId == "btn_afterYear") {
      $("#datepicker2").datepicker('setDate', '+1Y');
    } else if (buttonId == "btn_after2Year") {
      $("#datepicker2").datepicker('setDate', '+2Y');
    }

    $("#" + buttonId).addClass('active');
  }

  // jsonData 생성
  function getCreateJsonData(bidSttusCode){
    var jsonData = {
      startDate: $("#datepicker1").datepicker({dateformat: 'yyyy-mm-dd'}).val(),
      endDate: $("#datepicker2").datepicker({dateformat: 'yyyy-mm-dd'}).val(),
      bidSttusCode: bidSttusCode
    };

    return jsonData;
  }



</script>
</html>