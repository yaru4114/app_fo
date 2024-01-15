<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <!-- <meta name="robots" content="ALL"> -->
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>회원가입 STEP2 | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <!-- script core :: START -->
    <script src="/guide/js/jquery-3.6.0.min.js"></script>
	<script src="/guide/js/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="/guide/js/select2/select2.min.js"></script>
    <!-- script core :: END -->
</head>
<body>
	<!-- wrapper :: START -->
	<div class="wrapper pt0">

	    <!-- 23.10.16 | header include -->
	    <div class="header bid"></div>
	    <script type="text/javascript"> $(".header.bid").load("/guide/html/bid/include/header.html");</script>
	    <!-- // 23.10.16 | header include -->

	    <!-- container :: START -->
	    <div class="container">
	        <!-- 본문 -->
	        <div class="section us type2 bid">
	            <div class="inwrap">
	                <div class="hgroup">
	                    <div>
	                        <h2 class="h2">구매입찰 시스템 가입하기</h2>
	                    </div>
	                </div>

	                <!-- step 시작 -->
	                <div class="article step-area">
	                  <div class="step1 success">
	                      <span class="hidden">현재 페이지</span>
	                      <span class="step">1</span><span>약관동의</span>
	                  </div>
	                  <div class="step2 active">
	                      <span class="step">2</span><span>정보입력</span>
	                  </div>
	                  <div class="step3">
	                      <span class="step">3</span><span>가입승인</span>
	                  </div>
	              </div>
	              <!-- // step 끝 -->
					<div class="bid guide-txt">
						<p>구매입찰시스템 가입 후, 입찰 낙찰자의 경우<br>계약을 위한 추가 정보 입력을 요청할 수 있습니다.</p>
					</div>
					<div class="article mt60 box-agree-top">
	                    <div class="agree-title">
	                        <h3 class="signup-h3">회사 기본 정보입력</h3>
	                        <div class="form-chk">
	                            <input type="checkbox" id="foreign">
	                            <label for="foreign">외국 업체입니다.</label>
	                        </div>
	                    </div>
	                    <span class="icon-info-txt mb10">사업자등록증을 준비해주세요.</span>
	                </div>
	                <div class="article mt20 join-info-wrap">
	                    <div class="box-stroke no-box signup-box mb20">
	                        <div>
	                            <div class="tr">
	                                <label for="uid">아이디</label>
	                                <span class="limit-width">
	                                    <input type="text" name="uid" id="uid" placeholder="아이디 (12자 이내의 영문 또는 영문+숫자 조합 )">
	                                </span>
	                                <span class="t-info">아이디는 12자 이내여야 합니다.</span>
	                            </div>
	                            <div class="tr">
	                                <label for="upw">비밀번호</label>
	                                <span class="limit-width">
	                                    <input type="password" name="upw" id="upw" placeholder="비밀번호(영문 숫자 특수기호 조합 8~12자로 입력)">
	                                </span>
	                                <span class="t-info">영문자, 숫자, 특수문자 조합을 입력해야 합니다.</span>
	                            </div>
	                            <div class="tr">
	                                <label for="upw2">비밀번호 확인</label>
	                                <span class="limit-width">
	                                    <input type="password" name="upw2" id="upw2" placeholder="비밀번호 확인">
	                                </span>
	                                <span class="t-info">암호를 다시 확인해주세요.</span>
	                            </div>
	                            <div class="tr">
	                                <label for="cname">회사 이름</label>
	                                <span class="limit-width">
	                                    <input type="text" name="cname" id="cname" placeholder="회사 이름 입력">
	                                </span>
	                            </div>

	                            <!-- 23.10.12 | [참고] 상단 '외국 업체입니다.' 체크시: '회사 기본 정보입력 > 사업자등록번호 관련 영역' display: none 처리 {-->
	                            <div class="tr">
	                                <label for="ipCoRegiNo">사업자등록번호</label>
	                                <span class="limit-width">
	                                    <span class="input-complex">
	                                        <span class="input"><input type="tel" name="ipCoRegiNo" id="ipCoRegiNo" placeholder="사업자등록번호"></span>
	                                        <span class="button"><button type="button" id="ipCoRegiNoCheckBtn" class="btn-blue-big narrow">확인</button></span>
	                                    </span>
	                                </span>
	                                <span class="t-info t2" style="display: none">사업자등록번호를 다시 확인해 주세요.</span>
	                            </div>
	                            <div class="tr">
	                                <div class="file-upload">
	                                    <input type="text" class="upload-name" value="" placeholder="사업자등록증 첨부" disabled="disabled">
	                                    <span class="file-cancel"><img src="/guide/images/us/icon_file_cancel.png"></span>
										<span class="btn-up-file">
											<label for="updFile1" class="">파일첨부</label>
											<input type="file" name="updFile1" id="updFile1" class="hidden-file" accept=".pdf, .jpg, .jpeg, .png">
										</span>
	                                </div>
	                            </div>
	                            <!--} // 23.10.12 | [참고] -->

	                            <!--
	                             <div class="tr">
	                                <label for="ipCoAddress">회사주소</label>
	                                <span class="limit-width">
	                                    <span class="input-complex">
	                                        <span class="input">
	                                            <input type="text" name="ipCoAddress" id="ipCoAddress" placeholder="회사주소는 ‘주소찾기’ 버튼을 눌러주세요." readonly>
	                                        </span>
	                                        <span class="button">
	                                            <button type="button" class="btn-stroke-big narrow blue">주소찾기</button>
	                                        </span>
	                                    </span>
	                                </span>
	                            </div>
	                            <div class="tr">
	                                <label for="ipCoAddressDetail">상세주소</label>
	                                <span class="limit-width">
	                                    <input type="text" name="ipCoAddressDetail" id="ipCoAddressDetail" placeholder="나머지 상세 주소       도로명 주소 기준으로 지번주소가 보여집니다.">
	                                </span>
	                            </div>
	                            -->

	                            <!-- 23.11.13 | 영문ver > 주소 정보 입력 영역(모두 직접 입력으로 변경) 시작 {-->
	                            <div class="tr tr-foreigner-add1">
	                                <label for="foreignerZinCode">외국 업체 주소 직접 입력</label>
	                                <span class="input-complex">
		                                <span class="zip-code">
		                                    <input type="text" name="foreignerZinCode" id="foreignerZinCode" placeholder="우편번호">
		                                </span>
		                                <span class="input">
		                                    <input type="text" name="foreigneradd1" id="foreigneradd1" placeholder="주소1">
		                                </span>
	                                </span>
	                            </div>
	                            <!-- // 23.11.13 | 영문ver > 주소 정보 입력 영역(모두 직접 입력으로 변경): 종료 {-->

	                            <div class="tr tr-foreigner-add2">
	                                <label for="foreigneradd2">외국 업체 주소 직접 입력</label>
	                                <span class="limit-width">
	                                    <input type="text" name="foreigneradd2" id="foreigneradd2" placeholder="주소2">
	                                </span>
	                            </div>

	                            <div class="tr tr-bid-email">
	                                <label for="ipUserEmail">이메일</label>
	                                <div class="email-wrap">
	                                    <span class="limit-width e-address">
	                                        <input type="text" name="ipUserEmail" id="ipUserEmail" placeholder="이메일">
	                                    </span>
	                                    <span class="email-at">@</span>
	                                    <span class="limit-width e-domain">
	                                        <span class="input-complex">
	                                            <span class="email-input-domain"><input type="text" name="ipUserEmailDomain" id="ipUserEmailDomain" title="이메일 도메인 입력"></span>
	                                            <span class="email-select-domain">
	                                                <select name="selUserEmailDomain" id="selUserEmailDomain" class="dropdown" title="이메일 도메인 선택">
	                                                    <option selected>직접입력</option>
	                                                    <option>gmail</option>
	                                                </select>
	                                            </span>
	                                        </span>
	                                    </span>
	                                </div>
	                            </div>
	                            <div class="tr tr-bid-tel">
	                                <label for="">휴대폰 번호</label>
	                               	<div class="input-complex">
		                                <select class="dropdown" name="mobile1" id="mobile1">
									        <option value="1" data-style="ff0000">+82</option>
										    <option value="2">옵션</option>
										    <option value="3">옵션</option>
									    </select>
									    <span class="input">
		                                    <input type="text" name="mobile2" id="mobile2" placeholder="휴대폰 번호">
		                                </span>
	                                </div>
	                            </div>
	                            <div class="tr tr-bid-tel">
	                                <label for="">회사 전화 번호</label>
	                               	<div class="input-complex">
		                                <select class="dropdown" name="telPhone1" id="telPhone1">
									        <option value="1">+82</option>
										    <option value="2">옵션</option>
										    <option value="3">옵션</option>
									    </select>
									    <span class="input">
		                                    <input type="text" name="telPhone2" id="telPhone2" placeholder="회사 전화 번호">
		                                </span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
					<div class="article mt60 box-agree-top">
	                    <div class="agree-title">
	                        <h3 class="signup-h3">입찰 대리 정보</h3>
	                        <div class="form-chk">
	                            <input type="checkbox" id="agreeAll2">
	                            <label for="agreeAll2">위 정보와 동일 적용</label>
	                        </div>
	                    </div>
	                </div>
	                <div class="article mt5 join-info-wrap">
	                    <div class="box-stroke no-box signup-box mb20">
	                        <div>
								<div class="tr">
								    <label for="vrsc_cname">회사 이름</label>
								    <span class="limit-width">
								        <input type="text" name="vrsc_cname" id="vrsc_cname" placeholder="회사 이름 입력">
								    </span>
								</div>
								<div class="tr">
	                                <label for="vrsc_ipCoRegiNo">사업자등록번호</label>
	                                <span class="limit-width">
	                                    <span class="input-complex">
	                                        <span class="input"><input type="tel" name="vrsc_ipCoRegiNo" id="vrsc_ipCoRegiNo" placeholder="사업자등록번호"></span>
	                                        <span class="button"><button type="button" class="btn-blue-big narrow">확인</button></span>
	                                    </span>
	                                </span>
	                                <span class="t-info t2">사업자등록번호를 다시 확인해 주세요.</span>
	                            </div>
	                            <div class="tr">
	                                <div class="file-upload">
	                                    <input type="text" class="upload-name" value="" placeholder="사업자등록증 첨부" disabled="disabled">
	                                    <span class="file-cancel"><img src="/guide/images/us/icon_file_cancel.png"></span>
										<span class="btn-up-file">
											<label for="updFile2" class="">파일첨부</label>
											<input type="file" name="updFile2" id="updFile2" class="hidden-file" accept=".pdf, .jpg, .jpeg, .png">
										</span>
	                                </div>
	                            </div>
	                            <div class="tr tr-bid-email">
	                                <label for="vrsc_ipUserEmail">이메일</label>
	                                <div class="email-wrap">
	                                    <span class="limit-width e-address">
	                                        <input type="text" name="vrsc_ipUserEmail" id="vrsc_ipUserEmail" placeholder="이메일">
	                                    </span>
	                                    <span class="email-at">@</span>
	                                    <span class="limit-width e-domain">
	                                        <span class="input-complex">
	                                            <span class="email-input-domain"><input type="text" name="vrsc_ipUserEmailDomain2" id="vrsc_ipUserEmailDomain2" title="이메일 도메인 입력"></span>
	                                            <span class="email-select-domain">
	                                                <select name="selUserEmailDomain" id="vrsc_ipUserEmailDomain2" class="dropdown" title="이메일 도메인 선택">
	                                                    <option>직접입력</option>
	                                                    <option>gmail</option>
	                                                </select>
	                                            </span>
	                                        </span>
	                                    </span>
	                                </div>
	                            </div>
	                            <div class="tr tr-bid-tel">
	                                <label for="">휴대폰 번호</label>
	                               	<div class="input-complex">
		                                <select class="dropdown" name="vrsc_mobile1" id="vrsc_mobile1">
									        <option value="1">+82</option>
										    <option value="2">옵션</option>
										    <option value="3">옵션</option>
									    </select>
									    <span class="input">
		                                    <input type="text" name="vrsc_mobile2" id="vrsc_mobile2" placeholder="휴대폰 번호">
		                                </span>
	                                </div>
	                            </div>
	                            <div class="tr tr-bid-tel">
	                                <label for="">회사 전화 번호</label>
	                               	<div class="input-complex">
		                                <select class="dropdown" name="vrsc_telPhone1" id="vrsc_telPhone1">
									        <option value="1">+82</option>
										    <option value="2">옵션</option>
										    <option value="3">옵션</option>
									    </select>
									    <span class="input">
		                                    <input type="text" name="vrsc_telPhone2" id="vrsc_telPhone2" placeholder="회사 전화 번호">
		                                </span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	               	<div class="text-center">
						<p>입찰 관련 정보가 전달됩니다. 정확하게 입력해주세요.</p>
					</div>
	                <div class="btn-wrap singup-btn-wrap mt40">
	                    <button type="button" id="prevBtn" class="btn-lgray-big">이전</button>
	                    <button type="button" id="submitBtn" class="btn-blue-big">가입승인 요청하기</button>
	                </div>
	            </div>
	        </div>
	        <!--// 본문 -->
	    </div>
		<!-- container :: END -->

		<!-- 23.10.16 | footer include :: START -->
		<div class="footer bid"></div>
	    <script type="text/javascript"> $(".footer.bid").load("/guide/html/bid/include/footer.html");</script>
	    <!-- // 23.10.16 | footer include :: END -->
	</div>
    <!-- wrapper :: END -->

<script src="/guide/js/modernizr/2.8.3/modernizr.min.js"></script>
<script src="/guide/js/prefixfree/1.0.0/prefixfree.min.js"></script>
<!-- script custom -->
<script src="/guide/js/sorin.js"></script>
<!-- embedded -->
<script>

$(document).ready(function(){

	$(".hidden-file").each(function(){
		$(this).on('change',function(){
			let fileName = $(this).val();
			console.log(fileName)
			$(this).parent().parents(".file-upload").find(".upload-name").val(fileName);
		});
	});
});

// 외국업체 체크
$('#foreign').on('click',function () {
    if ($('#foreign').prop('checked')) {
        $('#ipCoRegiNo').addClass('etr');
        // $('ipCoRegiNoCheckBtn').disabled = true;
    } else {
        $('#ipCoRegiNo').removeClass('etr');
        // $('ipCoRegiNoCheckBtn').disabled = false;
    }

    console.log($('ipCoRegiNoCheckBtn'));

});

// 위 정보와 동일 체크
$('#agreeAll2').on('click',function () {
    if ($('#agreeAll2').prop('checked')) {
        /*
        $('#vrsc_cname').value = '1';
        $('#vrsc_ipCoRegiNo').value = '1';
        $('#vrsc_ipUserEmail').value = '1';
        $('#vrsc_ipUserEmailDomain2').value = '1';

        $('#vrsc_mobile1').value = '1';
        $('#vrsc_mobile2').value = '1';
        $('#vrsc_telPhone1').value = '1';
        $('#vrsc_telPhone2').value = '1';
        */
    }
});

// 가입신청 버튼 클릭
$('#submitBtn').on('click',function(){



    var form = {};
    // 회사 기본 정보입력
    form.bidMberId = $('#uid').val(); // 아이디
    form.bidMberSecretNo = $('#upw').val(); // 비밀번호
    form.bidMberSecretNoCheck = $('#upw2').val(); // 비밀번호 확인
    form.entrpsNm = $('#cname').val(); // 회사명
    form.bsnmRegistNo = $('#ipCoRegiNo').val(); // 사업자번호

    form.postNo = $('#foreignerZinCode').val(); // 우편번호
    form.adres = $('#foreigneradd1').val(); // 주소1
    form.detailAdres = $('#foreigneradd2').val(); // 주소2

    form.bidMberEmail = $('#ipUserEmail').val() + "@" + $('#ipUserEmailDomain').val(); // 이메일

    form.moblphoneNo2 = $('#mobile1').val() + $('#mobile2').val(); // 휴대폰 번호
    form.entrpsTlphonNo = $('#telPhone1').val() + $('#telPhone2').val();; // 회사 전화 번호

    // 입찰 대리 정보

    form.vrscEntrpsNm = $('#vrsc_cname').val(); // 대행 업체명
    form.vrscBsnmRegistNo = $('#vrsc_ipCoRegiNo').val(); // 대행 사업자번호
    form.vrscBidMberEmail = $('#vrsc_ipUserEmail').val() + "@" + $('#vrsc_ipUserEmailDomain2').val();
    form.vrscMoblphonNo = $('#vrsc_mobile1').val() + $('#vrsc_mobile2').val();
    form.vrscTlphonNo = $('#vrsc_telPhone1').val() + $('#vrsc_telPhone2').val();

    const formData = new FormData();
    formData.append('BidMemberVO',JSON.stringify(form));
    console.log(formData);

/*
    $.ajax({
        type : 'POST',
        url : '/fo/member/creMember',
        // contentType: 'application/json',
        processData : false,
        contentType: false,
        // data : JSON.stringify(form),
        data : formData,
        success : function (response) {
            console.log(response);
            if (response.success) {
                location.href="/fo/member/create_3";
            }
            alert(response.message);
        },
        error : function (error) {
            console.log(error);
        }
    });
    */
});
</script>

</body>
</html>