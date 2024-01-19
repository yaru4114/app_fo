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
                                    <select class="form-select select-sm" id="metal">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                                <th scope="row">브랜드<i class="icon icon-required"></i></th>
                                <td>
                                    <div class="form-set">
                                        <select class="form-select" id="brandGrp">
                                            <option value="브랜드그룹">브랜드그룹</option>
                                        </select>
                                        <select class="form-select" id="brand">
                                            <option value="브랜드">브랜드</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">아이템 상품명<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="item">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                                <th scope="row">권역<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="dstrct">
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
                                                                               name="" value="Y" id=""
                                                                               checked/></td>
                                                <td>서린상사 지정 보세창고 도착도(FCA 서린상사 지정 보세창고)</td>
                                                <td>
                                                    <div class="form-set">
                                                        <input type="text" class="input" value="0"
                                                               readonly="readonly">
                                                        <select class="form-select select-sm">
                                                            <option value="1000">1000</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2000">3000</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center"><input type="checkbox" class=""
                                                                               name="" value="Y" id=""
                                                                               checked/></td>
                                                <td>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</td>
                                                <td>
                                                    <div class="form-set">
                                                        <input type="text" class="input" value="10000"
                                                               readonly="readonly">
                                                        <select class="form-select select-sm">
                                                            <option value="1000">1000</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2000">3000</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-center"><input type="checkbox" class=""
                                                                               name="" value="Y" id=""
                                                                               checked/></td>
                                                <td>CIF INCHEON / CIF BUSAN</td>
                                                <td>
                                                    <div class="form-set">
                                                        <input type="text" class="input" value="20000"
                                                               readonly="readonly">
                                                        <select class="form-select select-sm">
                                                            <option value="1000">1000</option>
                                                            <option value="2000">2000</option>
                                                            <option value="2000">3000</option>
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
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <input type="text" class="input" value="" placeholder="코멘트를 입력해주세요.">
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
                                                <input type="text" class="input" id="datepicker3"/>
                                                <label for="datepicker3" class="btn has-icon"><i
                                                        class="icon icon-calendar">달력</i></label>
                                            </div>
                                            <span>~</span>
                                            <!-- [D] 월 선택 경우 .form-month 추가 -->
                                            <!-- [D] 날짜 선택 경우 .form-date 추가 -->
                                            <div class="input-group date form-date">
                                                <input type="text" class="input" id="datepicker4"/>
                                                <label for="datepicker4" class="btn has-icon"><i
                                                        class="icon icon-calendar">달력</i></label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">가격지정방법<i class="icon icon-required"></i></th>
                                <td>
                                    <select class="form-select select-sm" id="priceSpmtc">
                                        <option value="선택">선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">결제 조건<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <div class="form-set">
                                        <select class="form-select" id="currency">
                                            <option value="선택">선택</option>
                                        </select>
                                        <select class="form-select">
                                            <option value="선택">선택</option>
                                        </select>
                                        <select class="form-select">
                                            <option value="선택">선택</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">기타 코멘트<i class="icon icon-required"></i></th>
                                <td colspan="3">
                                    <input type="text" class="input" value="" placeholder="코멘트를 입력해주세요.">
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
                                            <input type="text" class="input" id="datepicker5"/>
                                            <label for="datepicker5" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;시
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;분
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;초
                                    </div>
                                </td>
                                <th scope="row">투찰 마감일<i class="icon icon-required"></i></th>
                                <td>
                                    <div class="form-set">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="datepicker6"/>
                                            <label for="datepicker6" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;시
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;분
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;초
                                    </div>
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
                                    <span style="font-weight: 500; font-size: 0.80rem;">투찰 취소 불가</span>&nbsp;<input
                                        type="checkbox" class="" name="" value="N" id=""/>
                                    <div class="form-set" style="margin-top:5px;">
                                        <div class="input-group date form-date">
                                            <input type="text" class="input" id="datepicker6"/>
                                            <label for="datepicker6" class="btn has-icon"><i
                                                    class="icon icon-calendar">달력</i></label>
                                        </div>
                                        <select class="form-select" style="width:80px;">
                                            <option value="am">am</option>
                                            <option value="pm">pm</option>
                                        </select>
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;시
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;분
                                        <input type="text" class="input" value="" style="width:50px;">&nbsp;초
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
                                    <input type="radio" name="radio" id="radio-basic" value="'N'" />비활성(비전시)
                                    <input type="radio" name="radio" id="radio-advanced" value="'Y'" />활성(전시)
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-box">
                        <button type="button" class="btn">입찰 공고 등록</button>
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

            getOptions('metal', 'metal', 'codeDctwo', 'subCode', 'METAL_CODE');
            getOptions('dstrct', 'dstrct', 'codeNm', 'subCode', 'DSTRCT_LCLSF_CODE');
            getOptions('currency', 'currency', 'subCode', 'subCode', 'CURRENCY');
            getOptions('priceSpmtc', 'priceSpmtc', 'codeNm', 'subCode', 'PRICE_SPMTC_CODE');
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
                    console.log('response : ', response);
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

        $('#metal').change(function () {
            var selected = $(this).val();
            getOptions('brandGrp', 'brandGrp', 'codeNm', 'subCode', selected);
            getOptions('item', 'item', 'itmPrdlstKorean', 'itmCode', selected);
        });

        $('#brandGrp').change(function () {
            var selected = $(this).val();
            getOptions('brand', 'brand', 'brandNm', 'brandCode', selected);
        });
    </script>
</div>
</body>
</html>