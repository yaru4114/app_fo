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
    <script type="text/javascript" src="/bo/guide/js/realgridCustom.js"></script><!-- 퍼블 작성 -->
    <script type="text/javascript" src="/bo/guide/js/common.js"></script><!-- 퍼블 작성 -->
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
                                    <select class="form-select select-sm" id="itmSn">
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
                                                                               name="" value="Y" id="delyCnd01ApplcAt"
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
                                                                               name="" value="Y" id="delyCnd02ApplcAt"
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
                                                                               name="" value="Y" id="delyCnd03ApplcAt"
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
                                <th scope="row">기타 코멘트<i class="icon icon-required"></i></th>
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
                                    <span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 불가</span> <input
                                        type="checkbox" class="" name="" value="" id="bddprCanclPossAt"/>
                                    <div class="form-set" style="margin-top:5px;">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="bddprCanclLmttDe" />
                                            <label for="bddprCanclLmttDe" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;" id="bddprCanclLmttDe_ampm">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" id="bddprCanclLmttDe_hour" value="" style="width:50px;">&nbsp;시
                                        <input type="text" class="input" id="bddprCanclLmttDe_min" value="" style="width:50px;">&nbsp;분
                                        <input type="text" class="input" id="bddprCanclLmttDe_sec" value="" style="width:50px;">&nbsp;초
                                        까지 투찰 취소 가능함.
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="sub-title">
                        <h3 class="">해당 공고 전시 여부</h3>
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
                                    <input type="radio" name="dspyAt" value="N" />비활성(비전시)
                                    <input type="radio" name="dspyAt" value="Y" />활성(전시)
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-box">
                        <button type="button" class="btn" id="submitBid">입찰 공고 등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var bidWt = $('#bidWt');
            var permWtRate = $('#permWtRate');

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
        });

        // 옵션 조회 공통 함수
        function getOptions(endPoint, elementId, textParam, valueParam, code) {
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
                    // console.log('response : ', response);
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
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }

        // 입찰 공고 등록
        function creBidNotice() {
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
            var bddprCanclPossAt = $('#bddprCanclPossAt').val();
            var dspyAt = $('input[name="dspyAt"]:checked').val();

            // ❗날짜 관련
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
            bddprCanclLmttDe = formatDate(bddprCanclLmttDe, bddprCanclLmttDe_ampm, bddprCanclLmttDe_hour, bddprCanclLmttDe_min, bddprCanclLmttDe_sec);

            var param = {
                subCode: metalCode,
                metalCode: metalCode,
                brandGroupCode: brandGroupCode,
                brandCode: brandCode,
                itmSn: itmSn,
                dstrctLclsfCode: dstrctLclsfCode,
                bidWt: bidWt,
                permWtRate: permWtRate,
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
                    console.log('등록 결과 : ', response);
                },
                error: function (error) {
                    console.error(error);
                }
            });
        }

        function formatDate(date, ampm, hour, min, sec) {
            if (ampm === 'pm') {
                hour = ('0' + (parseInt(hour) + 12)).slice(-2);
            }

            date = date.replace(/-/g, '');
            date = date + ('0' + hour).slice(-2) + ('0' + min).slice(-2) + ('0' + sec).slice(-2);

            return date;
        }

        $('#metalCode').change(function () {
            var selected = $(this).val();
            getOptions('brandGrp', 'brandGroupCode', 'codeNm', 'subCode', selected);
            getOptions('item', 'itmSn', 'itmPrdlstKorean', 'itmCode', selected);
        });

        $('#brandGroupCode').change(function () {
            var selected = $(this).val();
            getOptions('brand', 'brandCode', 'brandNm', 'brandCode', selected);
        });

        $('#bddprCanclPossAt').change(function () {
            if ($(this).is(':checked')) {
                $('#bddprCnlPeriod input, #cancelPeriod select').prop('disabled', true);
            } else {
                $('#bddprCnlPeriod input, #cancelPeriod select').prop('disabled', false);
            }
        });

        $('#bddprCanclPossAt').change(function () {
            var value = $(this).prop('checked') ? 'Y' : 'N';
        });

        $('#submitBid').on('click', function () {
            creBidNotice();
        })
    </script>
</div>
</body>
</html>