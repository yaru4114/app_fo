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
    <script type="text/javascript" src="/bo/guide/js/realgrid.2.3.2/approvalgrid.js"><!-- 승인대기 그리드 --></script>
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
                <h1>가입 승인 대기</h1>

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
                            <option value="">전체</option>
                            <option value="01">대기</option>
                            <option value="02">거절</option>
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

    <!-- toast popup layout-->
    <div class="pop-modal pop-toast">
        <div class="pop-inner">
            <p id="toastText">
                승인되었습니다.​
            </p>
        </div>
    </div>
    <!-- //toast popup layout-->

    <!-- Grid-Row 클릭 시 승인 팝업 -->
    <div class="pop-modal pop-modal2 pop-credit-confirm" id="blockModal">
        <div class="pop-inner w1000px">
            <div class="pop-title">
                <h1 class="title" id="modalTitle">-</h1>
                <div class="modal-btn-close" onclick="modalClose()">
                    <span/>
                </div>
            </div>

            <table class="bo-tbl-kyc">
                <caption>회원 목록 상세</caption>
                <div class="table-wrap">
                    <section class="bo-section">
                        <div class="sub-title">
                            <h3 class=""> 회사 기본 정보</h3>
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
                                    <input type="text" name="modalUserId1" id="modalUserId1" class="modalUserId" class="w300px" required readonly>
                                </td>
                                <th scope="row">
                                    <label for="">PW</label>
                                </th>
                                <td>
                                    <input type="password" name="modalUserPwd" id="modalUserPwd" class="w300px" required
                                           readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="">기업명</label>
                                </th>
                                <td>
                                    <input type="text" name="modalEntrpsName" id="modalEntrpsName" class="w300px" required readonly>
                                </td>
                                <th scope="row">
                                    <label for="">외국기업유무</label>
                                </th>
                                <td>
                                    <input type="text" name="modalFrntnAt" id="modalFrntnAt" value="-" class="w300px" required readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="">사업자등록번호</label>
                                </th>
                                <td>
                                    <input type="text" name="modalBsnmRegistNo" id="modalBsnmRegistNo" class="w300px" required readonly>
                                </td>
                                <th scope="row">
                                    <label for="">아이디</label>
                                </th>
                                <td>
                                    <input type="text" name="modalUserId2" id="modalUserId2" class="modalUserId" class="w300px" required readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="">이메일</label>
                                </th>
                                <td>
                                    <input type="text" name="modalEmail" id="modalEmail" class="w300px" required
                                           readonly>
                                </td>
                                <th scope="row">
                                    <label for="">폰번호</label>
                                </th>
                                <td>
                                    <input type="text" name="modalMobile" id="modalMobile" class="w300px" required readonly>
                                </td>
                            </tr>
                            <tr class="hiddenTr">
                                <th scope="row">
                                    <label for="">사업자등록증</label>
                                </th>
                                <td>
                                    <button type="text" id="modalDoc1" class="l-margin15px" onclick="downloadFile(1)"/>
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
                                    <input type="text" name="modalVrscEntrpsName" id="modalVrscEntrpsName" class="w300px" required readonly>
                                </td>
                                <th scope="row">
                                    <label for="">사업자등록번호</label>
                                </th>
                                <td>
                                    <input type="text" name="modalVrscBsnmRegistNo" id="modalVrscBsnmRegistNo" class="w300px" required readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="">이메일</label>
                                </th>
                                <td>
                                    <input type="text" name="modalVrscEmail" id="modalVrscEmail" class="w300px" required
                                           readonly>
                                </td>
                                <th scope="row">
                                    <label for="">폰번호</label>
                                </th>
                                <td>
                                    <input type="text" name="modalVrscMobile" id="modalVrscMobile" class="w300px" required readonly>
                                </td>
                            </tr>


                            <tr>
                                <th scope="row">
                                    <label for="">사업자등록증</label>
                                </th>
                                <td>
                                   <!--
                                   <input type="text" name="modalDoc2" id="modalDoc2" class="w300px" required readonly>
                                   -->
                                   <button type="text" id="modalDoc2" class="l-margin15px" onclick="downloadFile(2)"/>
                                </td>
                            </tr>


                            </tbody>
                        </table>
                    </section>

                    <section class="bo-section">
                        <div class="sub-title">
                            <h3 class="">가입 승인 요청</h3>
                        </div>
                        <table class="bo-tbl-kyc">
                            <caption>가입 승인 요청</caption>
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
                                    <input type="text" name="modalConfmRequestDt" id="modalConfmRequestDt" class="w300px" readonly>
                                </td>
                                <th scope="row">
                                    <label for="">가입승인일</label>
                                </th>
                                <td>
                                    <input type="text" name="modalConfmProcessDt" id="modalConfmProcessDt" value="-" class="w300px" readonly>
                                </td>
                                <th scope="row">
                                    <label for="">상태</label>
                                </th>
                                <td>
                                    <input type="text" name="modalConfmSttus" id="modalConfmSttus" class="w300px" readonly>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </section>
                    <div class="btm-btns">
                        <div class="btn-box">
                            <button type="button" id="closeBtn" class="btn" onclick="modalClose()">확인</button>
                            <button type="button" id="allowBtn" class="btn">가입 승인</button>
                            <button type="button" id="rejectBtn" class="btn">가입 거절</button>
                        </div>
                    </div>
                </div>
            </table>
        </div>
    <!-- //승인버튼 클릭 시 최종 승인 팝업  -->

    <script type="text/javascript">
        $(document).ready(function () {
            // 모달 - 사업자등록증 숨기기
            $(".hiddenTr").hide();

            start();
            getMemberApprovalList();

            // 상태별 회원 수 Count
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

        /** GRID CONTROL */

        // 🛠️ getMemberApprovalList 함수 정의
        function getMemberApprovalList() {
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
                url: '/bo/member/getApprovalList',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    drawRealGrid(response.result);
                },
                error: function (error) {
                    console.error(error);
                }
            });
        };

        // 🛠️ 검색 버튼 클릭 이벤트 처리
        $('#searchBtn').on('click', function () {
            gridView.setPage(0);
            getMemberApprovalList();
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
                emptyMessage: "승인 대기 회원이 존재하지 않습니다."
            });
            gridView.displayOptions.fitStyle = "even";
            gridView.displayOptions.selectionStyle = "rows";
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

            gridView.onCellClicked = function (grid, clickData) {
                // 헤더 제외
                if (clickData.cellType === 'header') {
                    return;
                }
                const rowIndex = clickData.itemIndex;
                const rowData = grid.getDisplayValues(rowIndex);
                const temp = JSON.stringify(rowData);
                const param = JSON.parse(temp);
                const bidMberId = param.bidMberId;

                showDetailPopup(bidMberId);
            }
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

        /** /GRID CONTROL */

        /** MODAL CONTROL */

        // Grid.Row 클릭시
        function showDetailPopup(bidMberId){
            var BidMemberVO = {
                bidMberId: bidMberId // ID
            }
            // ID 참조 데이터 검색
            $.ajax({
                type: "POST",
                url: "/bo/member/searchById",
                contentType: 'application/json',
                data: JSON.stringify(BidMemberVO),
                success: function (response) {
                    if(response.success){
                        setModalTable(response.result);
                        // 사업자등록증 다운로드 안하려면 아래코드 주석
                        setDocData(response);
                        $("#blockModal").show();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        // 팝업에 ROW 데이터 입력
        function setModalTable(data){

            $("#allowBtn").show();
            $("#rejectBtn").show();
            $("#closeBtn").show();

            $('#modalTitle').text("가입승인대기 > " + data.entrpsNm + " (" +data.bidConfmSttusCode +")");

            $('.modalUserId').val(data.bidMberId);
            $('#modalUserPwd').val(data.bidMberSecretNo);
            $('#modalEntrpsName').val(data.entrpsNm);
            $('#modalFrntnAt').val(data.frntnEntrpsAt);
            $('#modalBsnmRegistNo').val(data.bsnmRegistNo);
            $('#modalEmail').val(data.bidMberEmail);
            $('#modalMobile').val(data.moblphonNo2);

            $('#modalVrscEntrpsName').val(data.vrscEntrpsNm);
            $('#modalVrscBsnmRegistNo').val(data.vrscBsnmRegistNo);
            $('#modalVrscEmail').val(data.vrscBidMberEmail);
            $('#modalVrscMobile').val(data.vrscMoblphonNo);

            $('#modalConfmRequestDt').val(data.etrConfmRequstDt);
            // $('#modalConfmProcessDt').val(data.etrConfmProcessDt);
            $('#modalConfmSttus').val(data.bidConfmSttusCode);

            if (data.bidConfmSttusCode === '승인거절') {
                $("#allowBtn").hide();
                $("#rejectBtn").hide();
            } else {
                $("#closeBtn").hide();
            }
        }

        var doc1;
        var doc2;

        // 사업자등록증 바인딩
        function setDocData(response) {

            $(".hiddenTr").hide();

            if (response.doc1 != null) {
                doc1 = response.doc1;
                $("#modalDoc1").text(doc1.docFileNm);
                $("#modalDoc1").parent().parent().show();
            }

            if (response.doc2 != null) {
                doc2 = response.doc2;
                $("#modalDoc2").text(doc2.docFileNm);
                $("#modalDoc2").parent().parent().show();
            }
        }

        // 사업자등록증 다운로드
        function downloadFile(num){
            var name = "";
            var path = "";
            if (num === 1) {
                name = doc1.docFileNm;
                path = doc1.docFileCours;
            } else if (num === 2) {
                name = doc2.docFileNm;
                path = doc2.docFileCours;

            } else {
                return
            }

            var param = {
                filePath: path
            }

            $.ajax({
                url: "/common/downloadFile",
                data : JSON.stringify(param),
                contentType: "application/json",
                type:"POST",
                xhrFields: {
                    responseType: "blob",
                },
                success: function (response) {
                    const url = window.URL.createObjectURL(response);
                    const link = document.createElement('a');
                    link.href = url;
                    link.setAttribute('download', name);
                    link.click();
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }


        // 승인 & 거절 버튼
        $("#allowBtn").on('click',function(){
            submitApproval('01','03',$("#modalUserId1").val());
        });
        $("#rejectBtn").on('click',function(){
            submitApproval('03','02',$("#modalUserId1").val());
        });

        // 가입 승인시 팝업
        function submitApproval(memberStatus,confirmStatus,userId){
            var rowData = {
                bidMberId: userId,
                bidMberSttusCode: memberStatus,
                bidConfmSttusCode: confirmStatus
            }

            var text = "";

            $.ajax({
                type: 'POST',
                url: '/bo/member/udtApproval',
                data: JSON.stringify(rowData),
                contentType: 'application/json',
                success: function (response) {
                    if (response.success) {
                        modalClose();
                        getMemberApprovalList();
                        $('.pop-toast > .pop-inner > #toastText').text(response.message);
                        $('.pop-toast').fadeIn(300);
                        setTimeout(function(){
                             $('.pop-toast').fadeOut(300);
                        },2000);
                    } else {
                        alert("잘못된 접근입니다.");
                    }
                },
                error: function(error) {
                    console.log(error);
                    alert("서버 에러");
                }
            });

        }

        // 모달 닫기
        function modalClose(){
            $("#blockModal").hide();

            var statusParam = {
                statusCode: []
            };
            $('.list-total .label').each(function (index, element) {
                statusParam.statusCode.push($(element).text().trim());
            });
            getCountByStatus(statusParam);
        }

        /** /MODAL CONTROL */

        // $.document.ready(start);
        window.onload = start;
        // domloaded를 대신 써도 됩니다.

        window.onunload = function() {
            dataProvider.clearRows();

            gridView.destroy();
            dataProvider.destroy();

            gridView = null;
            dataProvider = null;
        };

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
        /* /상태별 회원 수 */
    </script>

</div>
</body>
</html>