<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="/bo/guide/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css"><!-- Folder tree -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet" type="text/css" href="/bo/guide/js/fullcalendar-5.7.0/lib/main.css"><!-- Full calendar -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/css/style.css" />

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
    <script type="text/javascript" src="/bo/guide/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script><!-- Folder tree -->
    <script type="text/javascript" src="/bo/guide/js/fullcalendar-5.7.0/lib/main.js"></script><!-- Full calendar -->
    <script type="text/javascript" src="/bo/guide/js/fullcalendar-5.7.0/lib/locales/ko.js"></script><!-- Full calendar(한글) -->
    <script type="text/javascript" src="/bo/guide/js/realgridCustom.js"></script><!-- 퍼블 작성 -->
    <script type="text/javascript" src="/bo/guide/js/common.js"></script><!-- 퍼블 작성 -->

</head>
<body>
    <div class="web-wrapper">
        <aside class="web-sidebar"></aside>
        <script type="text/javascript"> $(".web-sidebar").load("/bo/guide/html/include/sidebar.html");</script>

        <section class="web-container">
            <header class="web-header"></header>
            <script type="text/javascript"> $(".web-header").load("/bo/guide/html/include/header.html");</script>

            <div class="main-content">
                <div class="inner">
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
                                        <label for="datepicker1" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                    </div>
                                    <span>~</span>
                                    <div class="input-group date form-date">
                                        <input type="text" class="input" id="datepicker2">
                                        <label for="datepicker2" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                    </div>
                                </div>
                                <div class="btn-box btn-period">
                                    <button id="btn_today"type="button" class="btn active">오늘</button>
                                    <button id="btn_afterWeek" type="button" class="btn">일주일</button>
                                    <button id="btn_afterMonth"type="button" class="btn">1개월</button>
                                    <button id="btn_after6Month"type="button" class="btn">6개월</button>
                                    <button id="btn_afterYear"type="button" class="btn">1년</button>
                                    <button id="btn_after2Year"type="button" class="btn">2년</button>
                                </div>
                                <div class="search-btn">
                                    <button type="button" class="btn btn-blue" id="btn_search">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-button" style="margin-bottom: 10px">
                        <a href="#;" id="btn_bdngAllCnt"class="btn active"></a>
                        <a href="#;" id="btn_bdngSchdlCnt" class="btn"></a>
                        <a href="#;" id="btn_bdngPrgrsCnt" class="btn"></a>
                        <a href="#;" id="btn_bdngDdlnCnt" class="btn"></a>
                        <a href="#;" id="btn_bdngClcntCnt"class="btn"></a>
                        <a href="#;" id="btn_bdngWtngCnt"class="btn"></a>
                    </div>
                    <%--<div class="sub-title">
                        <h3 class=""></h3>
                        <div class="btn-box">
                            <button type="button" class="btn btn-green has-icon"><i class="icon icon-excel">엑셀</i></button>
                        </div>
                    </div>--%>
                    <div class="table table-view table-fixed-head text-center" style="overflow: auto">
                        <!-- //헤더부 -->
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
                                <th scope="col">입찰공고<br>번호</th>
                                <th scope="col">메탈</th>
                                <th scope="col">아이템<br>상품명</th>
                                <th scope="col">구분</th>
                                <th scope="col">그룹</th>
                                <th scope="col">권역</th>
                                <th scope="col">수량</th>
                                <th scope="col">중량</th>
                                <th scope="col">시작-마감</th>
                                <th scope="col">활성<br>여부</th>
                                <th scope="col">등록일<br>(등록자)</th>
                                <th scope="col">상태</th>
                                <th scope="col">단계</th>
                                <th scope="col">투찰<br>기업</th>
                                <th scope="col">최저<br>프리미엄가</th>
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
                                <tbody>
                                <tr>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                    <td>내용1</td>
                                </tr>
                                <tr>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                    <td>내용2</td>
                                </tr>
                                <tr>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                    <td>내용3</td>
                                </tr>
                                <tr>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                    <td>내용4</td>
                                </tr>
                                <tr>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                    <td>내용5</td>
                                </tr>
                                <tr>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                    <td>내용6</td>
                                </tr>
                                <tr>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                    <td>내용7</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function(){
      // 오늘 날짜 가져오기
      var today = new Date();
      // Datepicker 초기화 및 오늘 날짜로 설정
      $("#datepicker1").datepicker({
        format:'yyyy-mm-dd'
      }).datepicker('setDate' , 'today');
      $("#datepicker2").datepicker({
        format:'yyyy-mm-dd'
      }).datepicker('setDate','today');


      $(".btn-box .btn").on("click", getDatePickerButtonId);
      $('#btn_search').on("click" , getSearchBtn);

      getSearchBtn();
    });

    function getDatePickerButtonId() {
      // 클릭된 버튼의 아이디 가져오기
      var buttonId = $(this).attr('id');
      $("#"+buttonId).

      //시작날짜는 오늘로 고정
      $("#datepicker1").datepicker('setDate' , 'today');

      if(buttonId == "btn_today") {
        $("#datepicker2").datepicker('setDate','today');
      } else if (buttonId == "btn_afterWeek") {
        $("#datepicker2").datepicker('setDate','+7D');
      } else if (buttonId == "btn_afterMonth") {
        $("#datepicker2").datepicker('setDate','+1M');
      } else if (buttonId == "btn_after6Month") {
        $("#datepicker2").datepicker('setDate','+6M');
      } else if (buttonId == "btn_afterYear") {
        $("#datepicker2").datepicker('setDate','+1Y');
      } else if (buttonId == "btn_after2Year") {
        $("#datepicker2").datepicker('setDate','+2Y');
      }
    }

    function getSearchBtn(){
      var jsonData = {
        startDate : $("#datepicker1").datepicker({dateformat:'yyyy-mm-dd'}).val(),
        endDate : $("#datepicker2").datepicker({dateformat:'yyyy-mm-dd'}).val(),
        bidSttusCode : $("#bidSttusCodeSelectBox option:selected").val()
      };


      $.ajax({
        url: "/bo/bid/noticeMngForm/list",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(jsonData),
        dataType: "json",
        success: function (data) {
          console.log("서버 응답:", data);

          $("#btn_bdngAllCnt").text("전체("+data.bdngAllCnt+")");
          $("#btn_bdngSchdlCnt").text("입찰예정("+data.bdngSchdlCnt+")");
          $("#btn_bdngPrgrsCnt").text("투찰중("+data.bdngPrgrsCnt+")");
          $("#btn_bdngDdlnCnt").text("공고취소("+data.bdngClcntCnt+")");
          $("#btn_bdngClcntCnt").text("마감("+data.bdngDdlnCnt+")");
          $("#btn_bdngWtngCnt").text("마감("+data.bdngWtngCnt+")");

        },
        error: function (xhr, status, error) {
          // 에러 처리 코드
          console.error("에러 발생:", error);
        }
      });

    }




</script>
</html>