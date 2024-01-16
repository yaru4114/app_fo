<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="/bo/guide/js/vakata-jstree-4a77e59/dist/themes/default/style.min.css">
    <!-- Folder tree -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/js/bootstrap-timepicker-0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet" type="text/css" href="/bo/guide/js/fullcalendar-5.7.0/lib/main.css"><!-- Full calendar -->
    <link rel="stylesheet" type="text/css" href="/bo/guide/css/style.css"/>

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
    <script type="text/javascript"
            src="/bo/guide/js/bootstrap4-datepicker-master/js/locales/bootstrap-datepicker.ko.js"></script>
    <script type="text/javascript" src="/bo/guide/js/bootstrap-timepicker-0.5.2/js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="/bo/guide/js/vakata-jstree-4a77e59/dist/jstree.min.js"></script>
    <!-- Folder tree -->
    <script type="text/javascript" src="/bo/guide/js/fullcalendar-5.7.0/lib/main.js"></script><!-- Full calendar -->
    <script type="text/javascript" src="/bo/guide/js/fullcalendar-5.7.0/lib/locales/ko.js"></script>
    <!-- Full calendar(한글) -->
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
                <div class="btm-btns">
                    <div class="btn-box">
                        <button type="button" id="blockButton" class="btn">모달 테스트</button>
                    </div>
                </div>
                <div class="count-banner">
                    <div class="list list-total">
                        <span class="label">정상 회원</span>
                        <span class="count">85</span>
                    </div>
                    <div class="list list-total">
                        <span class="label">차단 회원</span>
                        <span class="count">1274</span>
                    </div>
                    <div class="list list-total">
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
                        </select>
                    </div>
                    <div class="form-set">
                        <span class="label">검색구분</span>
                        <select class="form-select select-sm">
                            <option value="전체">전체</option>
                            <option value="회사명">회사명</option>
                            <option value="ID">ID</option>
                        </select>
                        <input type="text" class="input"/>
                    </div>
                    <div class="form-set form-expand">
                        <span class="label">일시</span>
                        <div class="form-period-set">
                            <div class="form-period-box">
                                <!-- [D] 월 선택 경우 .form-month 추가 -->
                                <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="datepicker1"/>
                                    <label for="datepicker1" class="btn has-icon"><i
                                            class="icon icon-calendar">달력</i></label>
                                </div>
                                <span>~</span>
                                <!-- [D] 월 선택 경우 .form-month 추가 -->
                                <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                <div class="input-group date form-date">
                                    <input type="text" class="input" id="datepicker2"/>
                                    <label for="datepicker2" class="btn has-icon"><i
                                            class="icon icon-calendar">달력</i></label>
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
</div>
<div class="pop-modal pop-modal2 pop-credit-confirm" id="blockModal">
    <div class="pop-inner w1400px">
        <div class="pop-title">
            <h1 class="title">회원관리 > 엠투엠글로벌</h1>
        </div>
        <table class="bo-tbl-kyc">
            <caption>회원 목록 상세</caption>
            <div class="table-wrap">
                <section class="bo-section">
                    <div class="sub-title">
                        <h3 class=""> 회사 기본 정보</h3>
                        <div class="btm-btns">
                            <div class="btn-box">
                                <button type="button" id="blockButton" class="btn">차단하기</button>
                                <button type="button" id="cancelButton" class="btn btn-blue">목록</button>
                            </div>
                        </div>
                    </div>
                    <table class="bo-tbl-kyc">
                        <caption> 회사 기본 정보</caption>
                        <colgroup>
                            <col style="width: 120px"/>
                            <col width="*"/>
                            <col style="width: 120px"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">
                                <label for="">ID</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="test001" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">PW</label>
                            </th>
                            <td>
                                <input type="password" name="" id="" value="1999-07-07" class="w300px" required
                                       readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">기업명</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="엠투엠글로벌" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">외국기업유무</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="-" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">사업자등록번호</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="0123456789" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">아이디</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="B0001" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">이메일</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="test01@naver.com" class="w300px" required
                                       readonly>
                            </td>
                            <th scope="row">
                                <label for="">폰번호</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="01098983434" class="w300px" required readonly>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </section>

                <section class="bo-section">
                    <div class="sub-title">
                        <h3 class="">입찰 대리 정보</h3>
                    </div>
                    <table class="bo-tbl-kyc">
                        <caption>입찰 대리 정보</caption>
                        <colgroup>
                            <col style="width: 120px"/>
                            <col/>
                            <col style="width: 120px"/>
                            <col/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">
                                <label for="">기업명</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="테스트회사" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">사업자등록번호</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="02020202" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">이메일</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="dfdf@kakao.com" class="w300px" required
                                       readonly>
                            </td>
                            <th scope="row">
                                <label for="">폰번호</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="010-2222-2222" class="w300px" required readonly>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </section>

                <section class="bo-section">
                    <div class="sub-title">
                        <h3 class="">가입 날짜</h3>
                    </div>
                    <table class="bo-tbl-kyc">
                        <caption>가입 날짜</caption>
                        <colgroup>
                            <col style="width: 120px"/>
                            <col/>
                            <col style="width: 90px"/>
                            <col/>
                            <col style="width: 90px"/>
                            <col/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">
                                <label for="">가입접수일</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="2024-01-01 02:00" class="w300px" readonly>
                            </td>
                            <th scope="row">
                                <label for="">가입승인일</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="2024-01-03 09:00" class="w300px" readonly>
                            </td>
                            <th scope="row">
                                <label for="">상태</label>
                            </th>
                            <td>
                                <input type="text" name="" id="" value="정상" class="w300px" readonly>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </section>
            </div>
        </table>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            start();
            getMemberList();
            // 상태별 회원 수!!
            var statusParam = {
                statusCode: []
            };
            $('.list-total .label').each(function (index, element) {
                statusParam.statusCode.push($(element).text().trim());
            });
            getCountByStatus(statusParam);

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
        });

        // getMemberList 함수 정의
        function getMemberList() {
            // 서버에 보낼 데이터
            var status = $('.form-select').val();
            var searchType = $('.select-sm').val();
            var searchKeyword = $('.input').val();
            var startDate = $('#datepicker1').val();
            var endDate = $('#datepicker2').val();

            var param = {
                status: status,
                searchType: searchType,
                searchKeyword: searchKeyword,
                startDate: startDate,
                endDate: endDate
            };

            $.ajax({
                type: 'POST',
                url: '/bo/member/getList',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    console.log('결과 : ', response);
                    drawRealGrid(response.result);
                },
                error: function (error) {
                    console.error(error);
                }
            });
        };

        // 검색 버튼 클릭 이벤트 처리
        $('#searchBtn').on('click', function () {
            getMemberList();
        });

        var httpRequest;
        var dataProvider, gridContainer, gridView;

        function createGrid(container) {
            dataProvider = new RealGrid.LocalDataProvider();
            dataProvider.setFields(fields);
            gridView = new RealGrid.GridView(container);

            gridView.header.height = 40;
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
            gridView.setDisplayOptions({
                showEmptyMessage: true,
                emptyMessage: "입찰 회원이 존재하지 않습니다."
            });
            gridView.displayOptions.fitStyle = "even";
            gridView.setDataSource(dataProvider);
            gridView.setColumns(columns);

            gridView.editOptions.insertable = true;
            gridView.editOptions.appendable = true;

            // 페이징 설정
            gridView.setPaging(true, 30);

            // 페이지 변경 이벤트 핸들러 등록
            gridView.onPageChanged = function (grid, page) {
                $('#current-page-view').text(page + 1);
            };

            // 페이지 수 변경 이벤트 핸들러 등록
            gridView.onPageCountChanged = function (grid, pageCount) {
                $('#total-page-view').text(pageCount);
            };
        }

        function drawRealGrid(data) {
            if (!dataProvider) {
                dataProvider = new RealGrid.LocalDataProvider();
                dataProvider.setFields(fields);
            } else {
                dataProvider.clearRows();
            }
            dataProvider.setRows(data);

            // gridView 생성
            if (!gridView) {
                gridView = new RealGrid.GridView("realgrid");
            } else {
                gridView.refresh();
            }

            gridView.setDataSource(dataProvider);
            gridView.setColumns(columns);

            // 페이지 정보 업데이트
            var page = gridView.getPage();
            var pageCount = gridView.getPageCount();
            $('#current-page-view').text(page + 1);
            $('#total-page-view').text(pageCount);
        }

        function start() {
            createGrid("realgrid");
        }

        window.onload = start;
        window.onunload = function () {
            dataProvider.clearRows();

            gridView.destroy();
            dataProvider.destroy();

            gridView = null;
            dataProvider = null;
        };

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

        // 상태별 회원 수 조회
        function setCountByStatus(label, count) {
            const countElements = document.querySelectorAll('.list-total .label');
            countElements.forEach(element => {
                if (element.textContent.includes(label)) {
                    element.nextElementSibling.textContent = count;
                }
            });
        }

        function getCountByStatus(stausParam) {
            $.ajax({
                type: 'POST',
                url: '/bo/member/statusCnt',
                contentType: 'application/json',
                data: JSON.stringify(stausParam),
                success: function (response) {
                    for (const label in response) {
                        if (response.hasOwnProperty(label)) {
                            const count = response[label];
                            setCountByStatus(label, count);
                        }
                    }
                },
                error: function (error) {
                    console.error(error);
                }
            });
        };

        // 차단하기 버튼 클릭 이벤트
        document.getElementById('blockButton').addEventListener('click', function () {
            // 모달 보이게 설정
            document.getElementById('blockModal').style.display = 'block';
        });

        // 취소 버튼 클릭 이벤트
        document.getElementById('cancelButton').addEventListener('click', function () {
            // 모달 숨기게 설정
            document.getElementById('blockModal').style.display = 'none';
        });

        // 승인하기 버튼 클릭 이벤트
        document.getElementById('approveButton').addEventListener('click', function () {
            // 모달 숨기게 설정
            document.getElementById('blockModal').style.display = 'none';
            // 승인 로직 추가
        });

    </script>
</body>
</html>