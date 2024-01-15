<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
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
    <!-- script type="text/javascript" src="/bo/guide/js/realgrid.2.3.2/realgrid-utils.js"></script -->
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
<%--    <script type="text/javascript" src="/bo/guide/js/realgridCustom.js"></script><!-- 퍼블 작성 -->--%>
    <script type="text/javascript" src="/bo/guide/js/realgrid.2.3.2/testgrid.js"></script>
    <script type="text/javascript" src="/bo/guide/js/common.js"></script><!-- 퍼블 작성 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


</head>


<body>

<div class="web-wrapper">
    <!-- [D] 사이드바 부분 인클루드 시작 -->
    <!-- [D] 활성화된 메뉴 : .active 추가(스크립트 적용됨) -->
    <aside class="web-sidebar"></aside>
    <script type="text/javascript"> $(".web-sidebar").load("/bo/guide/html/include/sidebar.html");</script>
    <!-- // [D] 사이드바 부분 인클루드 끝 -->

    <section class="web-container">
        <!-- [D] 상단메뉴 부분 인클루드 시작 -->
        <!-- [D] 활성화된 메뉴 : .is-active 추가 -->
        <header class="web-header"></header>
        <script type="text/javascript"> $(".web-header").load("/bo/guide/html/include/header.html");</script>
        <!-- // [D] 상단메뉴 부분 인클루드 끝 -->

        <div class="main-content">
            <div class="inner">
                <h1>입찰 회원 관리</h1>

                <div class="count-banner">
                    <div class="list list-total">
                        <span class="label">정상 회원</span>
                        <span class="count">85</span>
                    </div>
                    <div class="list list-done">
                        <span class="label">차단 회원</span>
                        <span class="count">1274</span>
                    </div>
                    <div class="list list-todo">
                        <span class="label">가입승인대기</span>
                        <span class="count">12</span>
                    </div>
                </div>

                <div class="search-control">
                    <div class="form-set">
                        <span class="label">상태</span>
                        <select class="form-select">
                            <option value="00">전체</option>
                            <option value="01">정상</option>
                            <option value="02">차단</option>
                            <option value="03">승인대기</option>
                        </select>
                    </div>
                    <div class="form-set">
                        <span class="label">검색구분</span>
                        <select class="form-select select-sm">
                            <option value="전체">전체</option>
                            <option value="회사명">회사명</option>
                            <option value="ID">ID</option>
                        </select>
                        <input type="text" class="input" />
                    </div>
                    <div class="form-set form-expand">
                        <span class="label">일시</span>
                        <div class="form-period-set">
                            <div class="form-period-box">
                                <!-- [D] 월 선택 경우 .form-month 추가 -->
                                <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="datepicker1" />
                                    <label for="datepicker1" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                </div>
                                <span>~</span>
                                <!-- [D] 월 선택 경우 .form-month 추가 -->
                                <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="datepicker2" />
                                    <label for="datepicker2" class="btn has-icon"><i class="icon icon-calendar">달력</i></label>
                                </div>
                            </div>
                            <div class="btn-box btn-period">
                                <button type="button" class="btn">오늘</button>
                                <button type="button" class="btn">일주일</button>
                                <button type="button" class="btn">1개월</button>
                                <button type="button" class="btn">6개월</button>
                                <button type="button" class="btn">1년</button>
                                <button type="button" class="btn">2년</button>
                            </div>
                        </div>
                    </div>
                    <div class="search-btn" id="searchBtn">
                        <button type="button" class="btn btn-blue">검색</button>
                    </div>
                </div>

                <!-- realGrid -->
                <div id="realgrid" class="realgrid-wrap"></div>
                <!-- paging -->
                <div class="paging-row">
                    <div class="paging">
                        <div id="paging"></div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <script type="text/javascript">
        $(document).ready(function () {
            // datepicker 초기화
            $('#datepicker1, #datepicker2').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true,
            });

            // btn-period 버튼 클릭 이벤트 처리
            $('.btn-period button').on('click', function () {
                $('.btn-period button').removeClass('active');
                $(this).addClass('active');

                var endDate = moment(); // 현재 날짜
                var startDate;

                // 기간에 따라 startDate 설정
                switch ($(this).text()) {
                    case '오늘':
                        startDate = moment();
                        break;
                    case '일주일':
                        startDate = moment().subtract(1, 'weeks');
                        break;
                    case '1개월':
                        startDate = moment().subtract(1, 'months');
                        break;
                    case '6개월':
                        startDate = moment().subtract(6, 'months');
                        break;
                    case '1년':
                        startDate = moment().subtract(1, 'years');
                        break;
                    case '2년':
                        startDate = moment().subtract(2, 'years');
                        break;
                    default:
                        startDate = moment(); // 기본값은 오늘
                        break;
                }

                // 날짜 입력
                $('#datepicker1').datepicker('setDate', startDate.toDate());
                $('#datepicker2').datepicker('setDate', endDate.toDate());
            });

            // 🛠️ 검색 버튼 클릭 이벤트 처리
            $('#searchBtn').on('click', function () {
                console.log('TEST');
                // 서버에 보낼 데이터
                var status = $('.form-select').val();
                var searchType = $('.select-sm').val();
                var searchKeyword = $('.input').val();
                var startDate = $('#datepicker1').val();
                var endDate = $('#datepicker2').val();

                // 페이징 관련
                var currentPage = 1;
                var pageSize = 30;

                var param = {
                    status: status,
                    searchType: searchType,
                    searchKeyword: searchKeyword,
                    startDate: startDate,
                    endDate: endDate,
                    currentPage: currentPage,
                    pageSize: pageSize
                };

                $.ajax({
                  type: 'POST',
                  url: '/bo/member/getList',
                  contentType: 'application/json',
                  data: JSON.stringify(param),
                  success: function (response) {
                      console.log('결과 : ', response);
                  },
                  error: function (error) {
                      console.error(error);
                  }
                });
            });
        });
    </script>

</div>
</body>
</html>