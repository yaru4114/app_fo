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
    <link rel="stylesheet" type="text/css" href="/bo/guide/css/bootstrap-timepicker.css">
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
    <!-- <script type="text/javascript" src="/bo/guide/js/realgridCustom.js"></script> --><!-- 퍼블 작성 -->
</head>

<body>
<div class="web-wrapper">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-full" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">입찰 공고 등록</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="sub-title mt-0">
                        <h3 class="">공고 정보 입력(*필수)</h3>
                    </div>
                    <div class="table table-view">
                        <table>
                            <colgroup>
                                <col class="col-md"/>
                                <col width="*"/>
                                <col class="col-md"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">메탈 구분<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="metalCode">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                                <th scope="row">브랜드<i class="icon icon-required"></i></th>
                                <td>
                                    <div class="form-set">
                                        <select class="form-select" id="brandGroupCode">
                                            <option value="브랜드그룹">브랜드그룹</option>
                                        </select>
                                        <select class="form-select" id="brandCode">
                                            <option value="브랜드">브랜드</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-lg" id="itmSn">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                                <th scope="row">권역<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="dstrctLclsfCode">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">수량 (톤)<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="bidWt">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                                <th scope="row">중량허용공차(±)<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="permWtRate">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">프리미엄 가격(USD/MT)<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <div class="table table-inner">
                                        <table>
                                            <colgroup>
                                                <col width="6%"/>
                                                <col width="*"/>
                                                <col width="40%"/>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="row">선택</th>
                                                <th scope="row">인도조건</th>
                                                <th scope="row">프리미엄 가격 설정</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="text-center"><input type="checkbox" class=""
                                                                               name="" value="" id="delyCnd01ApplcAt"
                                                                               checked/></td>
                                                <td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
                                                <td>
                                                    <div class="form-set">
                                                        <input type="text" class="input" value="0" id="delyCnd01StdrPc"
                                                               readonly="readonly">
                                                        <select class="form-select select-sm" id="delyCnd01PremiumPc">
                                                            <option value="1000">1000</option>
                                                            <option value="2000">2000</option>
                                                            <option value="3000">3000</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center"><input type="checkbox" class=""
                                                                               name="" value="" id="delyCnd02ApplcAt"
                                                                               checked/></td>
                                                <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                                <td>
                                                    <div class="form-set">
                                                        <input type="text" class="input" value="10000" id="delyCnd02StdrPc"
                                                               readonly="readonly">
                                                        <select class="form-select select-sm" id="delyCnd02PremiumPc">
                                                            <option value="1000">1000</option>
                                                            <option value="2000">2000</option>
                                                            <option value="3000">3000</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center"><input type="checkbox" class=""
                                                                               name="" value="" id="delyCnd03ApplcAt"
                                                                               checked/></td>
                                                <td>CIF INCHEON / CIF BUSAN</td>
                                                <td>
                                                    <div class="form-set">
                                                        <input type="text" class="input" value="20000" id="delyCnd03StdrPc"
                                                               readonly="readonly">
                                                        <select class="form-select select-sm" id="delyCnd03PremiumPc">
                                                            <option value="1000">1000</option>
                                                            <option value="2000">2000</option>
                                                            <option value="3000">3000</option>
                                                        </select>
                                                    </div>
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
                                        <li>기타1) 부산/인천 보세창고 상차도 조건일 경우 인천지역(+USD8/MT),부산지역(+USD10/MT)을 조정하여
                                            <u>환산 프리미엄으로 입찰 가격 적용</u></li>
                                        <li>기타2) 부산/인천 보세창고 낙찰될 경우 해당 운송에 대해서는 서린상사 지정 운송업체를 통해 운송시 서린상사가 해당
                                            금액을 포함한 <u>환산 프리미엄 가격으로 낙찰자에게 지불함</u></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="2">인도기한<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <div class="form-period-set">
                                        <div class="form-period-box">
                                            <!-- [D] 월 선택 경우 .form-month 추가 -->
                                            <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                            <div class="input-group date form-date">
                                                <input type="text" class="input" id="delyBeginDe" />
                                                <label for="delyBeginDe" class="btn has-icon"><i
                                                        class="icon icon-calendar">달력</i></label>
                                            </div>
                                            <span>~</span>
                                            <!-- [D] 월 선택 경우 .form-month 추가 -->
                                            <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                            <div class="input-group date form-date">
                                                <input type="text" class="input" id="delyEndDe" />
                                                <label for="delyEndDe" class="btn has-icon"><i
                                                        class="icon icon-calendar">달력</i></label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <input type="text" class="input" value="" id="delyPdCn" placeholder="코멘트를 입력해주세요.">
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="table table-view">
                        <table>
                            <colgroup>
                                <col class="col-md"/>
                                <col width="*"/>
                                <col class="col-md"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">가격지정기간<i class="icon icon-required"></i></th>
                                <td>
                                    <div class="form-period-set">
                                        <div class="form-period-box">
                                            <!-- [D] 월 선택 경우 .form-month 추가 -->
                                            <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                            <div class="input-group date form-date">
                                                <input type="text" class="input" id="pcAppnBeginDe" />
                                                <label for="pcAppnBeginDe" class="btn has-icon"><i
                                                        class="icon icon-calendar">달력</i></label>
                                            </div>
                                            <span>~</span>
                                            <!-- [D] 월 선택 경우 .form-month 추가 -->
                                            <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                            <div class="input-group date form-date">
                                                <input type="text" class="input" id="pcAppnEndDe"/>
                                                <label for="pcAppnEndDe" class="btn has-icon"><i
                                                        class="icon icon-calendar">달력</i></label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="pcAppnMthCode">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <div class="form-set">
                                        <select class="form-select" id="setleCrncyCode">
                                            <option value="선택">선택</option>
                                        </select>
                                        <select class="form-select" id="setleMthCode">
                                            <option value="선택">선택</option>
                                        </select>
                                        <select class="form-select" id="setlePdCode">
                                            <option value="선택">선택</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">기타 코멘트</th>
                                <td colspan="3">
                                    <input type="text" class="input" value="" id="etcCn" placeholder="코멘트를 입력해주세요.">
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
                                <col class="col-md"/>
                                <col width="*"/>
                                <col class="col-md"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">투찰 시작일<i class="icon icon-required"></i></th>
                                <td>
                                    <div class="form-set">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="bddprBeginDt"/>
                                            <label for="bddprBeginDt" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;" id="bddprBeginDt_ampm">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" value="" style="width:50px;" id="bddprBeginDt_hour">&nbsp;시
                                        <input type="text" class="input" value="" style="width:50px;" id="bddprBeginDt_min">&nbsp;분
                                        <input type="text" class="input" value="" style="width:50px;" id="bddprBeginDt_sec">&nbsp;초
                                    </div>
                                </td>
                                <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                                <td>
                                    <div class="form-set">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="bddprEndDt"/>
                                            <label for="bddprEndDt" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;" id="bddprEndDt_ampm">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" id="bddprEndDt_hour" value="" style="width:50px;">&nbsp;시
                                        <input type="text" class="input" id="bddprEndDt_min" value="" style="width:50px;">&nbsp;분
                                        <input type="text" class="input" id="bddprEndDt_sec" value="" style="width:50px;">&nbsp;초
                                    </div>
                            </tr>
                            <tr>
                                <th scope="row">투찰 취소기한<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 가능 여부</span> <input
                                        type="checkbox" class="" name="bddprCanclPossAt" value="" id="bddprCanclPossAt"/>
                                    <div class="form-set" style="margin-top:5px;">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="bddprCanclLmttDe" disabled />
                                            <label for="bddprCanclLmttDe" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;" id="bddprCanclLmttDe_ampm" disabled>
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" id="bddprCanclLmttDe_hour" value="" style="width:50px;" disabled>&nbsp;시
                                        <input type="text" class="input" id="bddprCanclLmttDe_min" value="" style="width:50px;" disabled>&nbsp;분
                                        <input type="text" class="input" id="bddprCanclLmttDe_sec" value="" style="width:50px;" disabled>&nbsp;초
                                        까지 투찰 취소 가능함.
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="sub-title">
                        <h3 class="">FO 전시 여부</h3>
                    </div>
                    <div class="table table-view">
                        <table>
                            <colgroup>
                                <col class="col-md"/>
                                <col width="*"/>
                                <col class="col-md"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">상태 설정<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <input type="radio" name="dspyAt" value="Y" />전시
                                    <input type="radio" name="dspyAt" value="N" />비전시
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="sub-title" id="udtBidTitle">
                        <h3 class="">공고 수정</h3>
                    </div>
                    <div class="table table-view" id="udtBidContent">
                        <table>
                            <colgroup>
                                <col class="col-md"/>
                                <col width="*"/>
                                <col class="col-md"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">수정내용</th>
                                <td colspan="3">
                                    <input type="text" class="input" id="bidUpdtCn" value="" placeholder="수정내용" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">수정사유</th>
                                <td colspan="3">
                                    <input type="text" class="input" id="bidUpdtResn" value="" placeholder="수정사유" />
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer" id="bidNoticeModal">
                    <div class="btn-box">
                        <button type="button" class="btn" id="submitBid">입찰 공고 등록</button>
                        <button type="button" class="btn btn-gray" id="cancelCreBid" data-dismiss="modal">등록 취소</button>
                        <button type="button" class="btn btn-gray" id="cancelUdtBid" data-dismiss="modal">수정 취소</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="pop-modal pop-toast" id="creBidSuccess">
            <div class="pop-inner">
                <p>
                    입찰 공고가 저장되었습니다. <br>
                    목록에서 확인하세요.
                </p>
            </div>
        </div>
        <div class="pop-modal pop-toast" id="udtBidSuccess">
            <div class="pop-inner">
                <p>
                    수정되었습니다.
                </p>
            </div>
        </div>
        <div class="pop-modal pop-toast2" id="udtConfirm1">
            <div class="pop-inner">
                <p>시작일이 당일이며, 상태가 활성입니다. <br>
                    해당 정보로 수정 저장 시, 입찰 시작됩니다. <br>
                    진행 하시겠습니까?</p>
                <div class="buttonConfirm">
                    <button type="button" class="btn btn-gray" id="udtCancelConfrim1">취소</button>
                    <button type="button" class="btn" id="udtSubmitConfirm1">수정</button>
                </div>
            </div>
        </div>
        <div class="pop-modal pop-toast2" id="udtConfirm2">
            <div class="pop-inner">
                <p>시작일이 미래이며, 상태가 활성입니다. <br>
                    해당 정보로 수정 저장 시, 입찰예정으로 노출됩니다. <br>
                    진행 하시겠습니까?</p>
                <div class="buttonConfirm">
                    <button type="button" class="btn btn-gray" id="udtCancelConfrim2">취소</button>
                    <button type="button" class="btn" id="udtSubmitConfirm2">수정</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            startBidModal();
        });

        /* ================================== ❗공통 함수❗ ================================== */
        function startBidModal() {
            var bidWt = $('#bidWt');
            var permWtRate = $('#permWtRate');

            bidWt.empty();
            permWtRate.empty();

            for (var i = 100; i <= 2000; i += 100) {
                var option = $("<option>").val(i).text(i);
                bidWt.append(option);
            }

            for (var i = 1; i <= 10; i += 1) {
                var option = $("<option>").val(i).text(i + "%");
                permWtRate.append(option);
            }

            getOptions('metal', 'metalCode', 'codeDctwo', 'subCode', 'METAL_CODE');
            getOptions('dstrct', 'dstrctLclsfCode', 'codeNm', 'subCode', 'DSTRCT_LCLSF_CODE');
            getOptions('currency', 'setleCrncyCode', 'subCode', 'subCode', 'CURRENCY');
            getOptions('priceSpmtc', 'pcAppnMthCode', 'codeNm', 'subCode', 'PRICE_SPMTC_CODE');
            getOptions('pymntMt', 'setleMthCode', 'codeNm', 'subCode', 'PYMNT_MT_CODE');
            getOptions('pymntPr', 'setlePdCode', 'codeNm', 'subCode', 'PYMNT_PR_CODE');
        }

        // 공고 모달 등록 / 수정
        function openBidModal(text, isEditMode) {
            if (isEditMode) { // 수정
                $('#exampleModal h5.modal-title').text(text);
                $('#submitBid').text(text);
                $('#udtBidTitle').show();
                $('#udtBidContent').show();
                $('#cancelCreBid').hide();
                $('#cancelUdtBid').show();
            } else { // 등록
                $('#exampleModal h5.modal-title').text(text);
                $('#submitBid').text(text);
                $('#udtBidTitle').hide();
                $('#udtBidContent').hide();
                $('#cancelUdtBid').hide();
                $('#cancelCreBid').show();
            }
        }

        // 옵션 조회 공통 함수
        function getOptions(endPoint, elementId, textParam, valueParam, code) {
            return new Promise(function (resolve, reject) {
                var param = {};

                if (code) {
                    param.subCode = code;
                }

                $.ajax({
                    type: 'POST',
                    url: '/bo/bid/modal/' + endPoint,
                    contentType: 'application/json',
                    data: JSON.stringify(param),
                    success: function (response) {
                        var selectElement = $('#' + elementId);

                        selectElement.empty();

                        selectElement.append($('<option>').text('선택').val('선택'));

                        if (response.result.length > 0) {
                            response.result.forEach(function (data) {
                                var text = data[textParam];
                                var value = data[valueParam];

                                selectElement.append($('<option>').text(text).val(value));
                            });
                        }

                        resolve();
                    },
                    error: function (error) {
                        console.error(error);
                        reject(error);
                    }
                });
            });
        }

        function showToastPopup(id) {
            //토스트팝업
            $('#' + id).fadeIn(300);

            setTimeout(function () {
                $('#' + id).fadeOut(300);
            }, 2000);
        }

        function appendOpt(elementId) {
            var selectElement = $('#' + elementId);
            selectElement.val('').append($('<option>').text('선택').val('선택'));
        }

        function resetForm() {
            startBidModal();
            appendOpt('bidWt');
            appendOpt('permWtRate');
            appendOpt('itmSn');
            appendOpt('brandGroupCode');
            appendOpt('brandCode');
            $('#delyCnd01PremiumPc').val('1000');
            $('#delyCnd02PremiumPc').val('1000');
            $('#delyCnd03PremiumPc').val('1000');
            $('#delyBeginDe').val('');
            $('#delyEndDe').val('');
            $('#delyPdCn').val('');
            $('#pcAppnBeginDe').val('');
            $('#pcAppnEndDe').val('');
            $('#pcAppnMthCode').val('');
            $('#setleCrncyCode').val('');
            $('#setleMthCode').val('');
            $('#setlePdCode').val('');
            $('#etcCn').val('');
            $('#bddprBeginDt').val('');
            $('#bddprEndDt').val('');
            $('#bddprCanclLmttDe').val('');
            $('#bddprCanclPossAt').prop('checked', false);
            $('input[name="dspyAt"]').prop('checked', false);
            $('#bddprCanclLmttDe').prop('disabled', true);
            $('#bddprCanclLmttDe_ampm').prop('disabled', true);
            $('#bddprCanclLmttDe_hour').prop('disabled', true);
            $('#bddprCanclLmttDe_min').prop('disabled', true);
            $('#bddprCanclLmttDe_sec').prop('disabled', true);

            $('#bddprBeginDt_hour').val('');
            $('#bddprBeginDt_min').val('');
            $('#bddprBeginDt_sec').val('');
            $('#bddprEndDt_hour').val('');
            $('#bddprEndDt_min').val('');
            $('#bddprEndDt_sec').val('');
            $('#bddprCanclLmttDe_hour').val('');
            $('#bddprCanclLmttDe_min').val('');
            $('#bddprCanclLmttDe_sec').val('');
            $('#bidUpdtCn').val('');
            $('#bidUpdtResn').val('');
            $('#delyCnd01ApplcAt').prop('checked', true);
            $('#delyCnd02ApplcAt').prop('checked', true);
            $('#delyCnd03ApplcAt').prop('checked', true);
        }

        function udtCheckboxValue(elementId) {
            $('#' + elementId).change(function () {
                var value = $(this).prop('checked') ? 'Y' : 'N';
                $('#' + elementId).val(value);
            });
        }

        // 필수 입력 검증 함수
        var requiredElement = [
            {id: 'metalCode', label: '메탈 구분'},
            {id: 'brandGroupCode', label: '브랜드 그룹'},
            {id: 'brandCode', label: '브랜드'},
            {id: 'itmSn', label: '아이템 상품명'},
            {id: 'dstrctLclsfCode', label: '권역'},
            {id: 'bidWt', label: '수량 (톤)'},
            {id: 'permWtRate', label: '중량허용공차'},
            {id: 'delyBeginDe', label: '인도 시작 일자'},
            {id: 'delyEndDe', label: '인도 종료 일자'},
            {id: 'pcAppnBeginDe', label: '가격 지정 시작 일자'},
            {id: 'pcAppnEndDe', label: '가격 지정 종료 일자'},
            {id: 'pcAppnMthCode', label: '가격 지정 방법'},
            {id: 'setleCrncyCode', label: '결제 통화 코드'},
            {id: 'setleMthCode', label: '결제 방법 코드'},
            {id: 'setlePdCode', label: '결제 기간 코드'},
            {id: 'bddprBeginDt', label: '투찰 시작 일시'},
            {id: 'bddprBeginDt_hour', label: '투찰 시작 일시 [시]'},
            {id: 'bddprBeginDt_min', label: '투찰 시작 일시 [분]'},
            {id: 'bddprBeginDt_sec', label: '투찰 시작 일시 [초]'},
            {id: 'bddprEndDt', label: '투찰 종료 일시'},
            {id: 'bddprEndDt_hour', label: '투찰 종료 일시 [시]'},
            {id: 'bddprEndDt_min', label: '투찰 시작 일시 [분]'},
            {id: 'bddprEndDt_sec', label: '투찰 시작 일시 [초]'},
            {id: 'dspyAt', label: '전시 여부'}
        ];

        var requiredElementDate = [
            {id: 'bddprCanclLmttDe', label: '투찰 취소 제한일'},
            {id: 'bddprCanclLmttDe_hour', label: '투찰 취소 제한 [시]'},
            {id: 'bddprCanclLmttDe_min', label: '투찰 취소 제한 [분]'},
            {id: 'bddprCanclLmttDe_sec', label: '투찰 취소 제한 [초]'},
        ]

        function validateField(field) {
            var value = $('#' + field.id).val();
            if (value === '' || value === '선택') {
                alert(field.label + '을(를) 입력 하세요.');
                return false;
            } else if (field.id === 'bddprCanclLmttDe') {
                return true;
            }
            return true;
        }

        function validateSubmitForm() {
            var isValid = true;
            var canclPossAt = $('#bddprCanclPossAt').val();

            if (canclPossAt === 'Y') {
                requiredElementDate.forEach(function (field) {
                    isValid = isValid && validateField(field);
                });
            } else {
                requiredElement.forEach(function (field) {
                    isValid = isValid && validateField(field);
                });
            }

            return isValid;
        }
        /* ================================== ❗공통 함수❗ ================================== */


        /* ================================== ❗수정 관련❗ ================================== */
        function chgModalOpen() {
            if (chgPblancId) {
                getBidNoticeByPblancId(chgPblancId);
            }
        }

        // 상세 정보 조회
        function getBidNoticeByPblancId(bidPblancId) {
            var param = {
                bidPblancId: bidPblancId
            };

            $.ajax({
                type: 'POST',
                url: '/bo/bid/modal/bidDetail',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    if (response.result) {
                        var data = response.result;

                        getOptions('brandGrp', 'brandGroupCode', 'codeNm', 'subCode', data.metalCode)
                            .then(function () {
                                return getOptions('item', 'itmSn', 'itmPrdlstKorean', 'itmSn', data.metalCode);
                            })
                            .then(function () {
                                return getOptions('brand', 'brandCode', 'brandNm', 'brandCode', data.brandGroupCode);
                            })
                            .then(function () {
                                $('#metalCode').val(data.metalCode);
                                $('#brandGroupCode').val(data.brandGroupCode);
                                $('#brandCode').val(data.brandCode);
                                $('#itmSn').val(data.itmSn);
                                $('#dstrctLclsfCode').val(data.dstrctLclsfCode);
                                $('#bidWt').val(data.bidWt);
                                $('#permWtRate').val(data.permWtRate);
                                $('#delyCnd02StdrPc').val(data.delyCnd02StdrPc);
                                $('#delyCnd03StdrPc').val(data.delyCnd03StdrPc);
                                $('#delyPdCn').val(data.delyPdCn);
                                $('#pcAppnMthCode').val(data.pcAppnMthCode);
                                $('#setleCrncyCode').val(data.setleCrncyCode);
                                $('#setleMthCode').val(data.setleMthCode);
                                $('#setlePdCode').val(data.setlePdCode);
                                $('#etcCn').val(data.etcCn);

                                $('#delyCnd01ApplcAt').prop('checked', data.delyCnd01ApplcAt === 'Y');
                                $('#delyCnd02ApplcAt').prop('checked', data.delyCnd02ApplcAt === 'Y');
                                $('#delyCnd03ApplcAt').prop('checked', data.delyCnd03ApplcAt === 'Y');

                                $('#bddprCanclPossAt').prop('checked', data.bddprCanclPossAt === 'Y');
                                if (data.bddprCanclPossAt === 'Y') {
                                    $('#bddprCanclLmttDe, #bddprCanclLmttDe_ampm, #bddprCanclLmttDe_hour, #bddprCanclLmttDe_min, #bddprCanclLmttDe_sec').prop('disabled', false);
                                    setDateTimeFields(data.bddprCanclLmttDe, 'bddprCanclLmttDe', 'bddprCanclLmttDe_ampm', 'bddprCanclLmttDe_hour', 'bddprCanclLmttDe_min', 'bddprCanclLmttDe_sec');
                                } else {
                                    $('#bddprCanclLmttDe, #bddprCanclLmttDe_ampm, #bddprCanclLmttDe_hour, #bddprCanclLmttDe_min, #bddprCanclLmttDe_sec').prop('disabled', true);
                                }

                                $('input[name="dspyAt"][value="' + data.dspyAt + '"]').prop('checked', true);

                                /* ========================== 날짜(시,분,초) ========================== */
                                setDateTimeFields(data.bddprBeginDt, 'bddprBeginDt', 'bddprBeginDt_ampm', 'bddprBeginDt_hour', 'bddprBeginDt_min', 'bddprBeginDt_sec');
                                setDateTimeFields(data.bddprEndDt, 'bddprEndDt', 'bddprEndDt_ampm', 'bddprEndDt_hour', 'bddprEndDt_min', 'bddprEndDt_sec');
                                /* ========================== 날짜(시,분,초) ========================== */

                                var delyBeginDe = data.delyBeginDe;
                                delyBeginDe = formatYyyy_mm_dd(delyBeginDe);
                                $('#delyBeginDe').val(delyBeginDe);

                                var delyEndDe = data.delyEndDe;
                                delyEndDe = formatYyyy_mm_dd(delyEndDe);
                                $('#delyEndDe').val(delyEndDe);

                                var pcAppnBeginDe = data.pcAppnBeginDe;
                                pcAppnBeginDe = formatYyyy_mm_dd(pcAppnBeginDe);
                                $('#pcAppnBeginDe').val(pcAppnBeginDe);

                                var pcAppnEndDe = data.pcAppnEndDe;
                                pcAppnEndDe = formatYyyy_mm_dd(pcAppnEndDe);
                                $('#pcAppnEndDe').val(pcAppnEndDe);

                                // 단위 변환
                                var stdrPc01 = data.delyCnd01StdrPc;
                                stdrPc01 = parseInt(stdrPc01, 10);
                                $('#delyCnd01StdrPc').val(stdrPc01);

                                var stdrPc02 = data.delyCnd02StdrPc;
                                stdrPc02 = parseInt(stdrPc02, 10);
                                $('#delyCnd02StdrPc').val(stdrPc02);

                                var stdrPc03 = data.delyCnd03StdrPc;
                                stdrPc03 = parseInt(stdrPc03, 10);
                                $('#delyCnd03StdrPc').val(stdrPc03);

                                var prePc01 = data.delyCnd01PremiumPc;
                                prePc01 = parseInt(prePc01, 10);
                                $('#delyCnd01PremiumPc').val(prePc01);

                                var prePc02 = data.delyCnd02PremiumPc;
                                prePc02 = parseInt(prePc02, 10);
                                $('#delyCnd02PremiumPc').val(prePc02);

                                var prePc03 = data.delyCnd03PremiumPc;
                                prePc03 = parseInt(prePc03, 10);
                                $('#delyCnd03PremiumPc').val(prePc03);
                            })
                            .catch(function (error) {
                                console.error(error);
                            });
                    }
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }

        function setDateTimeFields(dateTime, dateField, ampmField, hourField, minField, secField) {
            var dateValue = dateTime.substr(0, 8); // yyyymmdd

            if (dateValue === '') {
                $('#' + dateField).val(yyyymmdd);
                return;
            }

            var yyyymmdd = dateValue;
            var year = yyyymmdd.substr(0, 4);
            var mon = yyyymmdd.substr(4, 2);
            var day = yyyymmdd.substr(6, 2);
            var yyyymmdd = year + '-' + mon + '-' + day;

            var hourValue = dateTime.substr(8, 2).replace(/^0/, '');
            var minValue = dateTime.substr(10, 2).replace(/^0/, '');
            var secValue = dateTime.substr(12, 2).replace(/^0/, '');

            $('#' + dateField).val(yyyymmdd);

            if (hourValue < 12) {
                $('#' + ampmField).val('am');
                $('#' + hourField).val(hourValue);
            } else {
                $('#' + ampmField).val('pm');
                $('#' + hourField).val(hourValue - 12);
            }

            $('#' + minField).val(minValue);
            $('#' + secField).val(secValue);
        }

        function udtBidNotice(udtCase) {
            var metalCode = $('#metalCode').val();
            var brandGroupCode = $('#brandGroupCode').val();
            var brandCode = $('#brandCode').val();
            var itmSn = $('#itmSn').val();
            var dstrctLclsfCode = $('#dstrctLclsfCode').val();
            var bidWt = $('#bidWt').val();
            var permWtRate = $('#permWtRate').val();
            var delyCnd01ApplcAt = $('#delyCnd01ApplcAt').val();
            var delyCnd01StdrPc = $('#delyCnd01StdrPc').val();
            var delyCnd01PremiumPc = $('#delyCnd01PremiumPc').val();
            var delyCnd02ApplcAt = $('#delyCnd02ApplcAt').val();
            var delyCnd02StdrPc = $('#delyCnd02StdrPc').val();
            var delyCnd02PremiumPc = $('#delyCnd02PremiumPc').val();
            var delyCnd03ApplcAt = $('#delyCnd03ApplcAt').val();
            var delyCnd03StdrPc = $('#delyCnd03StdrPc').val();
            var delyCnd03PremiumPc = $('#delyCnd03PremiumPc').val();
            var delyPdCn = $('#delyPdCn').val();
            var pcAppnMthCode = $('#pcAppnMthCode').val();
            var setleCrncyCode = $('#setleCrncyCode').val();
            var setleMthCode = $('#setleMthCode').val();
            var setlePdCode = $('#setlePdCode').val();
            var etcCn = $('#etcCn').val();
            var bddprCanclPossAt = $('#bddprCanclPossAt').prop('checked') ? 'Y' : 'N';
            var delyCnd01ApplcAt = $('#delyCnd01ApplcAt').prop('checked') ? 'Y' : 'N';
            var delyCnd02ApplcAt = $('#delyCnd02ApplcAt').prop('checked') ? 'Y' : 'N';
            var delyCnd03ApplcAt = $('#delyCnd03ApplcAt').prop('checked') ? 'Y' : 'N';
            var dspyAt = $('input[name="dspyAt"]:checked').val();

            // 📆날짜 관련
            // YYYY-MM-DD => YYYYMMDD
            var delyBeginDe = $('#delyBeginDe').val(); // 인도기한 시작
            delyBeginDe = delyBeginDe.replace(/-/g, '');

            var delyEndDe = $('#delyEndDe').val(); // 인도기한 종료
            delyEndDe = delyEndDe.replace(/-/g, '');

            var pcAppnBeginDe = $('#pcAppnBeginDe').val(); // 가격지정기간 시작
            pcAppnBeginDe = pcAppnBeginDe.replace(/-/g, '');

            var pcAppnEndDe = $('#pcAppnEndDe').val(); // 가격지정기간 종료
            pcAppnEndDe = pcAppnEndDe.replace(/-/g, '');

            // YYYY-MM-DD => YYYYmmDDHHMMSS
            // 투찰 시작일
            var bddprBeginDt = $('#bddprBeginDt').val();
            var bddprBeginDt_ampm = $('#bddprBeginDt_ampm').val();
            var bddprBeginDt_hour = $('#bddprBeginDt_hour').val();
            var bddprBeginDt_min = $('#bddprBeginDt_min').val();
            var bddprBeginDt_sec = $('#bddprBeginDt_sec').val();

            // 투찰 마감일
            var bddprEndDt = $('#bddprEndDt').val();
            var bddprEndDt_ampm = $('#bddprEndDt_ampm').val();
            var bddprEndDt_hour = $('#bddprEndDt_hour').val();
            var bddprEndDt_min = $('#bddprEndDt_min').val();
            var bddprEndDt_sec = $('#bddprEndDt_sec').val();

            // 투찰 취소기한
            var bddprCanclLmttDe = $('#bddprCanclLmttDe').val();
            var bddprCanclLmttDe_ampm = $('#bddprCanclLmttDe_ampm').val();
            var bddprCanclLmttDe_hour = $('#bddprCanclLmttDe_hour').val();
            var bddprCanclLmttDe_min = $('#bddprCanclLmttDe_min').val();
            var bddprCanclLmttDe_sec = $('#bddprCanclLmttDe_sec').val();

            bddprBeginDt = formatDate(bddprBeginDt, bddprBeginDt_ampm, bddprBeginDt_hour, bddprBeginDt_min, bddprBeginDt_sec);
            bddprEndDt = formatDate(bddprEndDt, bddprEndDt_ampm, bddprEndDt_hour, bddprEndDt_min, bddprEndDt_sec);

            if (bddprCanclPossAt === 'Y') {
                bddprCanclLmttDe = formatDate(bddprCanclLmttDe, bddprCanclLmttDe_ampm, bddprCanclLmttDe_hour, bddprCanclLmttDe_min, bddprCanclLmttDe_sec);
            } else if (bddprCanclPossAt === 'N') {
                bddprCanclLmttDe = '';
            }

            var bidUpdtCn = $('#bidUpdtCn').val();
            var bidUpdtResn = $('#bidUpdtResn').val();

            var param = {
                subCode: metalCode,
                metalCode: metalCode,
                brandGroupCode: brandGroupCode,
                brandCode: brandCode,
                itmSn: itmSn,
                dstrctLclsfCode: dstrctLclsfCode,
                bidWt: bidWt,
                permWtRate1: permWtRate,
                delyCnd01ApplcAt: delyCnd01ApplcAt,
                delyCnd01StdrPc: delyCnd01StdrPc,
                delyCnd01PremiumPc: delyCnd01PremiumPc,
                delyCnd02ApplcAt: delyCnd02ApplcAt,
                delyCnd02StdrPc: delyCnd02StdrPc,
                delyCnd02PremiumPc: delyCnd02PremiumPc,
                delyCnd03ApplcAt: delyCnd03ApplcAt,
                delyCnd03StdrPc: delyCnd03StdrPc,
                delyCnd03PremiumPc: delyCnd03PremiumPc,
                delyBeginDe: delyBeginDe,
                delyEndDe: delyEndDe,
                delyPdCn: delyPdCn,
                pcAppnBeginDe: pcAppnBeginDe,
                pcAppnEndDe: pcAppnEndDe,
                pcAppnMthCode: pcAppnMthCode,
                setleCrncyCode: setleCrncyCode,
                setleMthCode: setleMthCode,
                setlePdCode: setlePdCode,
                etcCn: etcCn,
                bddprBeginDt: bddprBeginDt,
                bddprEndDt: bddprEndDt,
                bddprCanclPossAt: bddprCanclPossAt,
                bddprCanclLmttDe: bddprCanclLmttDe,
                dspyAt: dspyAt,
                bidUpdtCn: bidUpdtCn,
                bidUpdtResn: bidUpdtResn,
                bidPblancId: chgPblancId,
                udtCase: udtCase
            };

            $.ajax({
                type: 'POST',
                url: '/bo/bid/modal/chgBid',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    if (response.success) {
                        showToastPopup('udtBidSuccess');

                        setTimeout(function () {
                            $('#udtBidSuccess').fadeOut(300, function () {
                                resetForm();
                                $('#exampleModal').modal('hide');
                                getSearchBtn(response.location);
                            });
                        }, 2000);
                    }
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }
        /* ================================== ❗수정 관련❗ ================================== */


        /* ================================== ❗등록 관련❗ ================================== */
        // 입찰 공고 등록
        function creBidNotice() {
            var metalCode = $('#metalCode').val();
            var brandGroupCode = $('#brandGroupCode').val();
            var brandCode = $('#brandCode').val();
            var itmSn = $('#itmSn').val();
            var dstrctLclsfCode = $('#dstrctLclsfCode').val();
            var bidWt = $('#bidWt').val();
            var permWtRate = $('#permWtRate').val();
            var delyCnd01StdrPc = $('#delyCnd01StdrPc').val();
            var delyCnd01PremiumPc = $('#delyCnd01PremiumPc').val();
            var delyCnd02StdrPc = $('#delyCnd02StdrPc').val();
            var delyCnd02PremiumPc = $('#delyCnd02PremiumPc').val();
            var delyCnd03StdrPc = $('#delyCnd03StdrPc').val();
            var delyCnd03PremiumPc = $('#delyCnd03PremiumPc').val();
            var delyPdCn = $('#delyPdCn').val();
            var pcAppnMthCode = $('#pcAppnMthCode').val();
            var setleCrncyCode = $('#setleCrncyCode').val();
            var setleMthCode = $('#setleMthCode').val();
            var setlePdCode = $('#setlePdCode').val();
            var etcCn = $('#etcCn').val();
            var bddprCanclPossAt = $('#bddprCanclPossAt').prop('checked') ? 'Y' : 'N';
            var delyCnd01ApplcAt = $('#delyCnd01ApplcAt').prop('checked') ? 'Y' : 'N';
            var delyCnd02ApplcAt = $('#delyCnd02ApplcAt').prop('checked') ? 'Y' : 'N';
            var delyCnd03ApplcAt = $('#delyCnd03ApplcAt').prop('checked') ? 'Y' : 'N';
            var dspyAt = $('input[name="dspyAt"]:checked').val();

            // 📆날짜 관련
            // YYYY-MM-DD => YYYYMMDD
            var delyBeginDe = $('#delyBeginDe').val(); // 인도기한 시작
            delyBeginDe = delyBeginDe.replace(/-/g, '');

            var delyEndDe = $('#delyEndDe').val(); // 인도기한 종료
            delyEndDe = delyEndDe.replace(/-/g, '');

            var pcAppnBeginDe = $('#pcAppnBeginDe').val(); // 가격지정기간 시작
            pcAppnBeginDe = pcAppnBeginDe.replace(/-/g, '');

            var pcAppnEndDe = $('#pcAppnEndDe').val(); // 가격지정기간 종료
            pcAppnEndDe = pcAppnEndDe.replace(/-/g, '');

            // YYYY-MM-DD => YYYYmmDDHHMMSS
            // 투찰 시작일
            var bddprBeginDt = $('#bddprBeginDt').val();
            var bddprBeginDt_ampm = $('#bddprBeginDt_ampm').val();
            var bddprBeginDt_hour = $('#bddprBeginDt_hour').val();
            var bddprBeginDt_min = $('#bddprBeginDt_min').val();
            var bddprBeginDt_sec = $('#bddprBeginDt_sec').val();

            // 투찰 마감일
            var bddprEndDt = $('#bddprEndDt').val();
            var bddprEndDt_ampm = $('#bddprEndDt_ampm').val();
            var bddprEndDt_hour = $('#bddprEndDt_hour').val();
            var bddprEndDt_min = $('#bddprEndDt_min').val();
            var bddprEndDt_sec = $('#bddprEndDt_sec').val();

            // 투찰 취소기한
            var bddprCanclLmttDe;
            var bddprCanclLmttDe_ampm;
            var bddprCanclLmttDe_hour;
            var bddprCanclLmttDe_min;
            var bddprCanclLmttDe_sec;
            if (bddprCanclPossAt === 'Y') {
                bddprCanclLmttDe = $('#bddprCanclLmttDe').val();
                bddprCanclLmttDe_ampm = $('#bddprCanclLmttDe_ampm').val();
                bddprCanclLmttDe_hour = $('#bddprCanclLmttDe_hour').val();
                bddprCanclLmttDe_min = $('#bddprCanclLmttDe_min').val();
                bddprCanclLmttDe_sec = $('#bddprCanclLmttDe_sec').val();
                bddprCanclLmttDe = formatDate(bddprCanclLmttDe, bddprCanclLmttDe_ampm, bddprCanclLmttDe_hour, bddprCanclLmttDe_min, bddprCanclLmttDe_sec);
            } else {
                bddprCanclLmttDe = '';
            }

            bddprBeginDt = formatDate(bddprBeginDt, bddprBeginDt_ampm, bddprBeginDt_hour, bddprBeginDt_min, bddprBeginDt_sec);
            bddprEndDt = formatDate(bddprEndDt, bddprEndDt_ampm, bddprEndDt_hour, bddprEndDt_min, bddprEndDt_sec);

            var param = {
                subCode: metalCode,
                metalCode: metalCode,
                brandGroupCode: brandGroupCode,
                brandCode: brandCode,
                itmSn: itmSn,
                dstrctLclsfCode: dstrctLclsfCode,
                bidWt: bidWt,
                permWtRate1: permWtRate,
                delyCnd01ApplcAt: delyCnd01ApplcAt,
                delyCnd01StdrPc: delyCnd01StdrPc,
                delyCnd01PremiumPc: delyCnd01PremiumPc,
                delyCnd02ApplcAt: delyCnd02ApplcAt,
                delyCnd02StdrPc: delyCnd02StdrPc,
                delyCnd02PremiumPc: delyCnd02PremiumPc,
                delyCnd03ApplcAt: delyCnd03ApplcAt,
                delyCnd03StdrPc: delyCnd03StdrPc,
                delyCnd03PremiumPc: delyCnd03PremiumPc,
                delyBeginDe: delyBeginDe,
                delyEndDe: delyEndDe,
                delyPdCn: delyPdCn,
                pcAppnBeginDe: pcAppnBeginDe,
                pcAppnEndDe: pcAppnEndDe,
                pcAppnMthCode: pcAppnMthCode,
                setleCrncyCode: setleCrncyCode,
                setleMthCode: setleMthCode,
                setlePdCode: setlePdCode,
                etcCn: etcCn,
                bddprBeginDt: bddprBeginDt,
                bddprEndDt: bddprEndDt,
                bddprCanclPossAt: bddprCanclPossAt,
                bddprCanclLmttDe: bddprCanclLmttDe,
                dspyAt: dspyAt
            };

            $.ajax({
                type: 'POST',
                url: '/bo/bid/modal/creBid',
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (response) {
                    if (response.success) {
                        showToastPopup('creBidSuccess');

                        setTimeout(function () {
                            $('#creBidSuccess').fadeOut(300, function () {
                                $('#exampleModal').hide();
                                resetForm();
                                location.href = "/bo/bid/noticeMngForm";
                            });
                        }, 2000);
                    }
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }

        // Request
        function formatDate(date, ampm, hour, min, sec) {
            if (ampm === 'pm') {
                hour = ('0' + (parseInt(hour) + 12)).slice(-2);
            }

            date = date.replace(/-/g, '');
            date = date + ('0' + hour).slice(-2) + ('0' + min).slice(-2) + ('0' + sec).slice(-2);

            return date;
        }
        /* ================================== ❗등록 관련❗ ================================== */

        /* ==================================== ❗기타❗ ==================================== */
        $('#metalCode').change(function () {
            var selected = $(this).val();
            getOptions('brandGrp', 'brandGroupCode', 'codeNm', 'subCode', selected);
            getOptions('item', 'itmSn', 'itmPrdlstKorean', 'itmSn', selected);
        });

        $('#brandGroupCode').change(function () {
            var selected = $(this).val();
            getOptions('brand', 'brandCode', 'brandNm', 'brandCode', selected);
        });

        $('#bddprCanclPossAt').change(function () {
            if ($(this).is(':checked')) {
                $('#bddprCanclLmttDe, #bddprCanclLmttDe_ampm, #bddprCanclLmttDe_hour, #bddprCanclLmttDe_min, #bddprCanclLmttDe_sec').prop('disabled', false);
            } else {
                $('#bddprCanclLmttDe, #bddprCanclLmttDe_ampm, #bddprCanclLmttDe_hour, #bddprCanclLmttDe_min, #bddprCanclLmttDe_sec').prop('disabled', true);
            }
        });

        udtCheckboxValue('bddprCanclPossAt');
        udtCheckboxValue('delyCnd01ApplcAt');
        udtCheckboxValue('delyCnd02ApplcAt');
        udtCheckboxValue('delyCnd03ApplcAt');

        $('#udtCancelConfrim1').on('click', function () {
           $('#udtConfirm1').hide();
        });

        $('#udtCancelConfrim2').on('click', function () {
            $('#udtConfirm2').hide();
        });

        $('#udtSubmitConfirm1').on('click', function () {
            $('#udtConfirm1').hide();
            if (validateSubmitForm()) {
                udtBidNotice(1);
            }
        });

        $('#udtSubmitConfirm2').on('click', function () {
            $('#udtConfirm2').hide();
            if (validateSubmitForm()) {
                udtBidNotice(2);
            }
        });

        $('#submitBid').on('click', function () {
            var btnText = $('#submitBid').text();

            if (btnText === '입찰 공고 등록') {
                if (validateSubmitForm()) {
                    creBidNotice();
                }
            } else { // 입찰 수정 등록
                // 케이스 별 처리
                var todayDate = new Date();

                var bddprBeginDt = $('#bddprBeginDt').val();
                var bddprBeginDt_ampm = $('#bddprBeginDt_ampm').val();
                var bddprBeginDt_hour = $('#bddprBeginDt_hour').val();
                var bddprBeginDt_min = $('#bddprBeginDt_min').val();
                var bddprBeginDt_sec = $('#bddprBeginDt_sec').val();
                var beginDateObject = processDateAndTime(bddprBeginDt, bddprBeginDt_ampm, bddprBeginDt_hour, bddprBeginDt_min, bddprBeginDt_sec);
                // ===========================================================================
                var bddprEndDt = $('#bddprEndDt').val(); // yyyy-mm-dd
                var bddprEndDt_ampm = $('#bddprEndDt_ampm').val(); // 'am' or 'pm'
                var bddprEndDt_hour = $('#bddprEndDt_hour').val();
                var bddprEndDt_min = $('#bddprEndDt_min').val();
                var bddprEndDt_sec = $('#bddprEndDt_sec').val();
                var endDateObject = processDateAndTime(bddprEndDt, bddprEndDt_ampm, bddprEndDt_hour, bddprEndDt_min, bddprEndDt_sec);

                var dspyAt = $('input[name="dspyAt"]:checked').val();

                if (todayDate >= beginDateObject && todayDate <= endDateObject && dspyAt === 'Y') {
                    // bddprBeginDt < 현재 날짜 < bddprEndDt && '활성'
                    $('#udtConfirm1').show();
                } else if (todayDate < beginDateObject && dspyAt === 'Y') {
                    // 현재 날짜 < bddprBeginDt ~ bddprEndDt && '활성'
                    $('#udtConfirm2').show();
                } else if ((todayDate >= beginDateObject && todayDate <= endDateObject) || todayDate < beginDateObject) {
                    if (dspyAt === 'N') {
                        // (bddprBeginDt < 현재 날짜 < bddprEndD ||  현재 날짜 < bddprBeginDt ~ bddprEndDt) && '비활성'
                        if (validateSubmitForm()) {
                            udtBidNotice(3);
                        }
                    } else {
                        if (validateSubmitForm()) {
                            udtBidNotice(0);
                        }
                    }
                } else {
                    if (validateSubmitForm()) {
                        udtBidNotice(0);
                    }
                }
            }
        });

        $('#exampleModal').on('hidden.bs.modal', function (e) {
            // .modal-backdrop.show 제거
            $('.modal-backdrop.show').remove();
            resetForm();
        });

        function processDateAndTime(bddprEndDt, bddprEndDt_ampm, bddprEndDt_hour, bddprEndDt_min, bddprEndDt_sec) {
            // 12시간제 => 24시간제
            if (bddprEndDt_ampm === 'pm' && bddprEndDt_hour !== '12') {
                bddprEndDt_hour = (parseInt(bddprEndDt_hour, 10) + 12).toString();
            } else if (bddprEndDt_ampm === 'am' && bddprEndDt_hour === '12') {
                bddprEndDt_hour = '00';
            }

            // 두 자리로 만들기
            bddprEndDt_hour = String(bddprEndDt_hour).padStart(2, '0');
            bddprEndDt_min = String(bddprEndDt_min).padStart(2, '0');
            bddprEndDt_sec = String(bddprEndDt_sec).padStart(2, '0');

            // 최종 날짜 형식 생성
            var bddprEnd = bddprEndDt + '-' + bddprEndDt_hour + '-' + bddprEndDt_min + '-' + bddprEndDt_sec;

            // 날짜 정보 추출
            var endYear = bddprEnd.substring(0, 4);
            var endMonth = bddprEnd.substr(5, 2) - 1;
            var endDay = bddprEnd.substr(8, 2);
            var endHour = bddprEnd.substr(11, 2);
            var endMinute = bddprEnd.substr(14, 2);
            var endSecond = bddprEnd.substr(16, 2);

            // Date 객체 생성
            var endDateObject = new Date(endYear, endMonth, endDay, endHour, endMinute, endSecond);

            return endDateObject;
        }

        function formatYyyy_mm_dd(date) {
            var year = date.substr(0, 4);
            var mon = date.substr(4, 2);
            var day = date.substr(6, 2);
            return year + '-' + mon + '-' + day;
        }

        // function formatDate2(date) {
        //     return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
        // }
        //
        // // 투찰 기간 날짜 배열 담기
        // function appendBddprDate(beginDt, endDt) {
        //     var datesEnabled = [];
        //     var startDate = new Date(beginDt);
        //     var endDate = new Date(endDt);
        //
        //     while (startDate <= endDate) {
        //         var formattedDate = formatDate2(startDate);
        //         datesEnabled.push(formattedDate);
        //         startDate.setDate(startDate.getDate() + 1);
        //     }
        //     return datesEnabled;
        // }
        //
        // var isEndDtSet = false; // 마감일자가 설정 여부 확인용
        // function updateCanclLmttDeRange() {
        //     var datesE;
        //     var endDt;
        //
        //     var beginDtStr = $('#bddprBeginDt').val();
        //     var endDtStr = $('#bddprEndDt').val();
        //     var beginDt = new Date(beginDtStr);
        //
        //     if (endDtStr) {
        //         console.log('들어갔는지 확인!');
        //         endDt = new Date(endDtStr);
        //         datesE = appendBddprDate(beginDt, endDt); // ['2024-1-23', '2024-1-24', '2024-1-25']
        //         console.log('datesE 들어갈 때 : ', datesE);
        //         isEndDtSet = true;
        //     }
        //
        //     console.log('datesE : ', datesE);
        //     $('#bddprCanclLmttDe').datepicker({
        //         format: 'yyyy-mm-dd',
        //         beforeShowDay: function(date) {
        //             if (!isEndDtSet) {
        //                 return true;
        //             }
        //
        //             console.log('isEndDtSet : ', isEndDtSet);
        //
        //             var allDates = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
        //
        //             if(datesE.indexOf(allDates) !== -1) {
        //                 console.log('true');
        //                 return true;
        //             } else {
        //                 console.log('false');
        //                 return false;
        //             }
        //         }
        //     });
        // }
        //
        // $('#bddprBeginDt, #bddprEndDt').on('change', function () {
        //     updateCanclLmttDeRange();
        // });

        /* ==================================== ❗기타❗ ==================================== */
    </script>
</div>
</body>
</html>