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
                <div class="count-banner">
                    <div class="list list-total">
                        <span class="label">정상 회원</span>
                        <span class="count"></span>
                    </div>
                    <div class="list list-total">
                        <span class="label">차단 회원</span>
                        <span class="count"></span>
                    </div>
                    <div class="list list-total">
                        <span class="label">가입승인대기</span>
                        <span class="count"></span>
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
<div class="pop-modal pop-modal2 pop-credit-confirm" id="detailModal">
    <div class="pop-inner w1000px">
        <div class="pop-title">
            <h1 class="title">회원관리 ></h1>
            <h1 class="title" id="companyNm"></h1>
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
                                <button type="button" id="releaseButton" class="btn">해제하기</button>
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
                                <input type="text" id="bidMberId" value="" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">PW</label>
                            </th>
                            <td>
                                <input type="password" id="bidMberSecretNo" value="" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">기업명</label>
                            </th>
                            <td>
                                <input type="text" id="entrpsNm" value="" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">외국기업유무</label>
                            </th>
                            <td>
                                <input type="text" id="frntnEntrpsAt" value="" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">사업자등록번호</label>
                            </th>
                            <td>
                                <input type="text" id="bsnmRegistNo" value="" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">아이디</label>
                            </th>
                            <td>
                                <input type="text" id="bidEntrpsNo" value="" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">이메일</label>
                            </th>
                            <td>
                                <input type="text" id="bidMberEmail" value="" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">폰번호</label>
                            </th>
                            <td>
                                <input type="text" id="moblphonNo2" value="" class="w300px" required readonly>
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
                                <input type="text" id="vrscEntrpsNm" value="" class="w300px" required readonly>
                            </td>
                            <th scope="row">
                                <label for="">사업자등록번호</label>
                            </th>
                            <td>
                                <input type="text" id="vrscBsnmRegistNo" value="" class="w300px" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <label for="">이메일</label>
                            </th>
                            <td>
                                <input type="text" id="vrscBidMberEmail" value="" class="w300px" required
                                       readonly>
                            </td>
                            <th scope="row">
                                <label for="">폰번호</label>
                            </th>
                            <td>
                                <input type="text" id="vrscMoblphonNo" value="" class="w300px" required readonly>
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
                                <input type="text" id="etrConfmRequstDt" value="" class="w300px" readonly>
                            </td>
                            <th scope="row">
                                <label for="">가입승인일</label>
                                <label for="blockDate">(차단일)</label>
                            </th>
                            <td>
                                <input type="text" id="etrConfmProcessDt" value="" class="w300px" readonly>
                                <input type="text" id="bidMberIntrcpDt" value="" class="w300px" readonly>
                            </td>
                            <th scope="row">
                                <label for="">상태</label>
                            </th>
                            <td>
                                <input type="text" id="bidMberSttusCode" value="" class="w300px" readonly>
                            </td>
                        </tr>
                        <tr id="blockMemo">
                            <th scope="row">
                                <label for="">비고</label>
                            </th>
                            <td colspan="5">
                                <input type="text" id="" value="투찰 취소 3회 초과로 차단되었습니다." class="w300px" readonly>
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
            countStatUpdate();

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

        // 입찰 회원 목록 조회
        function getMemberList() {
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
        }

        // 검색 버튼 클릭 이벤트 처리
        $('#searchBtn').on('click', function () {
            gridView.setPage(0);
            getMemberList();
            countStatUpdate();
        });

        /* 그리드 관련 함수 */
        var httpRequest;
        var dataProvider, gridContainer, gridView;

        var bidEntrpsNo; // 입찰 회원 번호
        var bidMberSttusCode; // 회원 상태 코드

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

            gridView.columnByName("bidEntrpsNo").visible =  false;

            // 페이지 정보 업데이트
            var page = gridView.getPage();
            var pageCount = gridView.getPageCount();
            $('#current-page-view').text(page + 1);
            $('#total-page-view').text(pageCount);

            gridView.onCellClicked = function (grid, clickData) {
                // 헤더 제외
                if (clickData.cellType === 'header') {
                    return;
                }
                const rowIndex = clickData.itemIndex;
                // const rowData = grid.getDataSource().getJsonRow(rowIndex);
                const rowData = grid.getDisplayValues(rowIndex);
                const temp = JSON.stringify(rowData);
                const param = JSON.parse(temp);
                bidEntrpsNo = param.bidEntrpsNo;
                bidMberSttusCode = param.bidMberSttusCode;

                // 입찰 회원 정보 조회 호출
                getMemberInfo(bidEntrpsNo);
            };
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
        /* 그리드 관련 함수 */

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

        /* 상태별 회원 수 */
            // 1. setter
        function setCountByStatus(label, count) {
            const countElements = document.querySelectorAll('.list-total .label');
            countElements.forEach(element => {
                if (element.textContent.includes(label)) {
                    element.nextElementSibling.textContent = count;
                }
            });
        }
            // 2. getter
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
        }
        /* 상태별 회원 수 */

        // 회원 상세 정보 조회
        function getMemberInfo(data) {
            var param = {
                bidEntrpsNo: data
            };

            $.ajax({
                type: 'POST',
                url: '/bo/member/detail',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    var memberInfo = response.result[0];

                    // 모달 생성
                    $('#detailModal').show();

                    // 회사 기본 정보
                    $('#bidMberId').val(memberInfo.bidMberId);
                    $('#bidMberSecretNo').val(memberInfo.bidMberSecretNo);
                    $('#entrpsNm').val(memberInfo.entrpsNm);
                    $('#companyNm').text(memberInfo.entrpsNm);
                    $('#frntnEntrpsAt').val(memberInfo.frntnEntrpsAt);
                    $('#bsnmRegistNo').val(memberInfo.bsnmRegistNo);
                    $('#bidEntrpsNo').val(memberInfo.bidEntrpsNo);
                    $('#bidMberEmail').val(memberInfo.bidMberEmail);
                    $('#moblphonNo2').val(memberInfo.moblphonNo2);

                    // 입찰 대리 정보
                    $('#vrscEntrpsNm').val(memberInfo.vrscEntrpsNm);
                    $('#vrscBsnmRegistNo').val(memberInfo.vrscBsnmRegistNo);
                    $('#vrscBidMberEmail').val(memberInfo.vrscBidMberEmail);
                    $('#vrscMoblphonNo').val(memberInfo.vrscMoblphonNo);

                    // 가입 날짜
                    $('#etrConfmRequstDt').val(memberInfo.etrConfmRequstDt);
                    $('#etrConfmProcessDt').val(memberInfo.etrConfmProcessDt);
                    $('#bidMberSttusCode').val(memberInfo.bidMberSttusCode);
                    var formattedIntrcpDt = '(' + memberInfo.bidMberIntrcpDt + ')';
                    $('#bidMberIntrcpDt').val(formattedIntrcpDt);
                    buttonByStatus(memberInfo.bidMberSttusCode);

                    if (memberInfo.bidMberSttusCode === '정상') {
                        $('label[for="blockDate"]').hide();
                        $('#bidMberIntrcpDt').hide();
                    } else {
                        $('label[for="blockDate"]').show();
                        $('#bidMberIntrcpDt').show();
                    }
                    isBlockMemoView();
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }

        /* 차단 및 해제 관련 함수 */
            // 상태 변경
        function chgStatusMember(bidNo, status) {
            var param = {
                bidEntrpsNo: bidNo,
                bidMberSttusCode: status
            };

            $.ajax({
                type: 'POST',
                url: '/bo/member/chgStatus',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    // console.log('chgStatusMember response ! : ', response);
                    if (!response.success) {
                        alert(response.message);
                        return;
                    }

                    if (response.status === 'block') {
                        buttonByStatus('차단');
                    } else if (response.status === 'release') {
                        buttonByStatus('정상');
                    }
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }

        $('#blockButton').on('click', function () {
            chgStatusMember(bidEntrpsNo, bidMberSttusCode);
        });

        $('#releaseButton').on('click', function () {
            chgStatusMember(bidEntrpsNo, bidMberSttusCode);
        });

            // 회원 상태별 버튼 상태 관리
        function buttonByStatus(status) {
            // 차단인 경우
            if (status === '차단') {
                $('#blockButton').hide();
                $('#releaseButton').show();
            } else if (status === '정상') {
                $('#blockButton').show();
                $('#releaseButton').hide();
            }
        }

            // 투찰 취소 횟수 관련 함수
        function isBlockMemoView() {
            var param = {
                bidEntrpsNo: bidEntrpsNo
            };

            $.ajax({
                type: 'POST',
                url: '/common/bddtrCnlCnt',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    // console.log('isBlockMemoView response : ', response);
                    if (response.result) {
                        $('#blockMemo').show();
                    } else {
                        $('#blockMemo').hide();
                    }
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }
        /* 차단 관련 함수 */

        // 모달 닫기
        $('#cancelButton').on('click', function () {
            $('#detailModal').hide();

            getMemberList();

            countStatUpdate();
        });

        // 상단 카운트바 초기화
        function countStatUpdate(){
            var statusParam = {
                statusCode: []
            };
            $('.list-total .label').each(function (index, element) {
                statusParam.statusCode.push($(element).text().trim());
            });
            getCountByStatus(statusParam);
        }

    </script>
</div>
</body>
</html>