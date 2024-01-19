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
	                                    <input type="text" name="uid" id="uid" placeholder="아이디 (4~12자 이내의 영문 또는 영문+숫자 조합 )">
	                                </span>
	                                <span class="t-info id">아이디는 12자 이내여야 합니다.</span>
	                            </div>
	                            <div class="tr">
	                                <label for="upw">비밀번호</label>
	                                <span class="limit-width">
	                                    <input type="password" name="upw" id="upw" placeholder="비밀번호(영문 숫자 특수기호 조합 8~12자로 입력)">
	                                </span>
	                                <span class="t-info pwd">영문자, 숫자, 특수문자 조합을 입력해야 합니다.</span>
	                            </div>
	                            <div class="tr">
	                                <label for="upw2">비밀번호 확인</label>
	                                <span class="limit-width">
	                                    <input type="password" name="upw2" id="upw2" placeholder="비밀번호 확인">
	                                </span>
	                                <span class="t-info pwdCheck">암호를 다시 확인해주세요.</span>
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
	                                        <span class="button"><button type="button" id="ipCoRegiNoCheckBtn" class="btn-blue-big narrow" onclick="coRegiNoChk($('#ipCoRegiNo').val())">확인</button></span>
	                                    </span>
	                                </span>
	                                <span class="t-info t2" style="display: none">사업자등록번호를 다시 확인해 주세요.</span>
	                            </div>
	                            <div class="tr">
	                                <div class="file-upload">
	                                    <input type="text" class="upload-name" id="updFileName1" placeholder="사업자등록증 첨부" disabled="disabled">
	                                    <span class="file-cancel"><img src="/guide/images/us/icon_file_cancel.png"></span>
										<span class="btn-up-file">
											<label for="updFile1" class="">파일첨부</label>
											<input type="file" name="updFile1" id="updFile1" class="hidden-file" accept=".pdf, .jpg, .jpeg, .png">
										</span>
	                                </div>
	                            </div>

	                            <!-- 주소 제거
	                            <div class="tr tr-foreigner-add1">
	                                <label for="foreignerZinCode">외국 업체 주소 직접 입력</label>
	                                <span class="input-complex">
		                                <span class="zip-code">
		                                    <input type="tel" name="foreignerZinCode" id="foreignerZinCode" placeholder="우편번호">
		                                </span>
		                                <span class="input">
		                                    <input type="text" name="foreigneradd1" id="foreigneradd1" placeholder="주소1">
		                                </span>
	                                </span>
	                            </div>
	                            <div class="tr tr-foreigner-add2">
	                                <label for="foreigneradd2">외국 업체 주소 직접 입력</label>
	                                <span class="limit-width">
	                                    <input type="text" name="foreigneradd2" id="foreigneradd2" placeholder="주소2">
	                                </span>
	                            </div>
	                            /주소제거 -->

	                            <div class="tr tr-bid-email">
	                                <label for="ipUserEmail">이메일</label>
	                                <div class="email-wrap">
	                                    <span class="limit-width e-address">
	                                        <input type="text" name="ipUserEmail" id="ipUserEmail" placeholder="이메일">
	                                    </span>
	                                    <span class="email-at">@</span>
	                                    <span class="limit-width e-domain">
	                                        <span class="input-complex">
	                                            <span class="email-input-domain"><input type="text" class="emailDomain" name="ipUserEmailDomain" id="ipUserEmailDomain" title="이메일 도메인 입력"></span>
	                                            <span class="email-select-domain">
	                                                <select name="selUserEmailDomain" id="ipUserEmailDomain_select" class="dropdown" title="이메일 도메인 선택">
	                                                    <option value="">직접입력</option>
                                                        <option value="gmail.com">gmail</option>
                                                        <option value="naver.com">naver</option>
                                                        <option value="kakao.com">kakao</option>
                                                        <option value="hanmail.net">hanmail</option>
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
									        <option value="+82">+82(대한민국)</option>
                                            <option value="+1">+1(미국&캐나다)</option>
                                            <option value="+81">+81(일본)</option>
                                            <option value="+84">+84(베트남)</option>
									    </select>
									    <span class="input">
		                                    <input type="tel" name="mobile2" id="mobile2" placeholder="휴대폰 번호">
		                                </span>
	                                </div>
	                            </div>

	                            <!-- 전화번호 제거
	                            <div class="tr tr-bid-tel">
	                                <label for="">회사 전화 번호</label>
	                               	<div class="input-complex">
		                                <select class="dropdown" name="telPhone1" id="telPhone1">
									        <option value="+82">+82(대한민국)</option>
                                            <option value="+1">+1(미국&캐나다)</option>
                                            <option value="+81">+81(일본)</option>
                                            <option value="+84">+84(베트남)</option>
									    </select>
									    <span class="input">
		                                    <input type="tel" name="telPhone2" id="telPhone2" placeholder="회사 전화 번호">
		                                </span>
	                                </div>
	                            </div>
	                            /전화번호 제거 -->
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
	                                        <span class="button"><button type="button" class="btn-blue-big narrow" onclick="coRegiNoChk($('#vrsc_ipCoRegiNo').val())">확인</button></span>
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
	                                            <span class="email-input-domain"><input type="text" class="emailDomain" name="vrsc_ipUserEmailDomain2" id="vrsc_ipUserEmailDomain2" title="이메일 도메인 입력"></span>
	                                            <span class="email-select-domain">
	                                                <select name="selUserEmailDomain" id="vrsc_ipUserEmailDomain2_select" class="dropdown" title="이메일 도메인 선택">
	                                                    <option value="">직접입력</option>
	                                                    <option value="gmail.com">gmail</option>
	                                                    <option value="naver.com">naver</option>
	                                                    <option value="kakao.com">kakao</option>
	                                                    <option value="hanmail.net">hanmail</option>
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
									        <option value="+82">+82(대한민국)</option>
									        <option value="+1">+1(미국&캐나다)</option>
										    <option value="+81">+81(일본)</option>
										    <option value="+84">+84(베트남)</option>
									    </select>
									    <span class="input">
		                                    <input type="tel" name="vrsc_mobile2" id="vrsc_mobile2" placeholder="휴대폰 번호">
		                                </span>
	                                </div>
	                            </div>
	                            <!-- 회사 전화번호 제거
	                            <div class="tr tr-bid-tel">
	                                <label for="">회사 전화 번호</label>
	                               	<div class="input-complex">
		                                <select class="dropdown" name="vrsc_telPhone1" id="vrsc_telPhone1">
									        <option value="+82">+82(대한민국)</option>
                                            <option value="+1">+1(미국&캐나다)</option>
                                            <option value="+81">+81(일본)</option>
                                            <option value="+84">+84(베트남)</option>
									    </select>
									    <span class="input">
		                                    <input type="tel" name="vrsc_telPhone2" id="vrsc_telPhone2" placeholder="회사 전화 번호">
		                                </span>
	                                </div>
	                            </div>
	                            -->
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
var fileList = [];

$(document).ready(function(){

    // 약관동의 없이 넘어온경우
    var terms = "${terms}";
    if (terms === null || terms === "") {
        alert("잘못된 접근입니다.");
        location.href="/fo/member/create_1";
    }

    $('.t-info').hide();

	$(".hidden-file").each(function(){
		$(this).on('change',function(){
			let fileName = $(this).val();
			// console.log(fileName);
			$(this).parent().parents(".file-upload").find(".upload-name").val(fileName);
			const a = $(this).parent().parents(".file-upload").find(".upload-name");
		});
	});
});

// 외국업체 체크
$('#foreign').on('click',function () {
    if ($('#foreign').prop('checked')) {
        // 회사 사업자등록번호 : disabled
        $('#ipCoRegiNo').val('');
        $('#ipCoRegiNo').addClass('etr');
        $('#ipCoRegiNo').attr("disabled", true);
        $('#ipCoRegiNoCheckBtn').attr("disabled", true);

        // 파일첨부 : disabled
        $('#updFileName1').val('');
        $('#updFileName1').addClass('etr');
        // $('#updFile1').addClass('btn-blue-big');
        $('#updFile1')[0].files = null;
        $('#updFile1').attr("disabled",true);

    } else {
        // 사업자등록번호
        $('#ipCoRegiNo').removeClass('etr');
        $('#ipCoRegiNo').attr("disabled", false);
        $('#ipCoRegiNoCheckBtn').attr("disabled", false);

        // 파일첨부
        $('#updFileName1').removeClass('etr');
        // $('#updFile1').removeClass('btn-blue-big');
        $('#updFile1').attr("disabled",false);
    }
});

// 위 정보와 동일 체크 => 회사정보 = 대행정보 입력
$('#agreeAll2').on('click',function () {
    if ($('#agreeAll2').prop('checked')) {

        $('#vrsc_cname').val($('#cname').val());
        $('#vrsc_ipCoRegiNo').val($('#ipCoRegiNo').val());
        $('#vrsc_ipUserEmail').val($('#ipUserEmail').val());
        $('#vrsc_ipUserEmailDomain2').val($('#ipUserEmailDomain').val());

        $('#vrsc_mobile1').val($('#mobile1').val());
        $('#vrsc_mobile2').val($('#mobile2').val());

        // 전화번호 제거
        // $('#vrsc_telPhone1').val($('#telPhone1').val());
        // $('#vrsc_telPhone2').val($('#telPhone2').val());
    }
});

// 이전 페이지 버튼
$('#prevBtn').on('click', function(){
   if (confirm("이전 페이지로 이동하시겠습니까? 작성된 정보는 삭제됩니다.")) {
        window.history.back();
   }
});

// 사업자등록번호 체크
function coRegiNoChk(value){

    alert("사업자가 확인되었습니다.");
}

// 이메일 선택
$('#ipUserEmailDomain_select').on('change',function(){
    $('#ipUserEmailDomain').val($('#ipUserEmailDomain_select').val());
});
$('#vrsc_ipUserEmailDomain2_select').on('change',function(){
    $('#vrsc_ipUserEmailDomain2').val($('#vrsc_ipUserEmailDomain2_select').val());
});


// 회원가입 조건처리

function chkInfo(form){

    // 정규표현식 필터
    var idFilter1 = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/g;
    var idFilter2 = /^[a-zA-Z]{4,12}$/g;
    var pwdFilter = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,12}$/;
    var mobileFilter = /^\d{10,11}$/;

    // 아이디
    if (form.bidMberId === null || form.bidMberId.length <= 0) {
        alert('아이디를 입력해주세요');
        $('#uid').focus();
        return false;
    } else if (!(idFilter1.test(form.bidMberId) || idFilter2.test(form.bidMberId))) {
        alert('아이디는 4-12자 이내의 문자 또는 문자+숫자만 사용 가능합니다');
        $('#uid').focus();
        return false;
    }
    //

    // 비밀번호
    if (form.bidMberSecretNo === null || form.bidMberSecretNo.length <= 0) {
        alert('비밀번호를 입력해주세요');
        $('#upw').focus();
        return false;
    } else if (!pwdFilter.test(form.bidMberSecretNo)) {
        alert('비밀번호는 8~12자 이내의 영문+숫자+특수문자만 사용 가능합니다.');
        $('#upw').focus();
        return false;
    }

    // 비밀번호 확인
    if (form.bidMberSecretNo !== form.bidMberSecretNoCheck) {
        alert('비밀번호가 확인란과 일치하지 않습니다.');
        $('#upw2').focus();
        return false;
    }

    // 회사명
    if (form.entrpsNm === null || form.entrpsNm <= 0) {
        alert('회사명을 입력해주세요.');
        $('#cname').focus();
        return false;
    }

    // 사업자번호
    if(form.frntnEntrpsAt === 'N' && (form.bsnmRegistNo === null || form.bsnmRegistNo.length <= 0)) {
        alert('사업자번호를 입력해주세요.');
        $('#ipCoRegiNo').focus();
        return false;
    }

    // 사업자등록증
    if (form.frntnEntrpsAt === 'N' && $('#updFile1')[0].files[0] == null) {
        alert('사업자등록증을 첨부해주세요.');
        $('#updFile1').click();
        return false;
    }

    // 이메일
    if (($('#ipUserEmail').val() === null || $('#ipUserEmail').val() <= 0) || ($('#ipUserEmailDomain').val() === null || $('#ipUserEmailDomain').val().length <= 0)) {
        alert('이메일을 입력해주세요.');
        $('#ipUserEmail').focus();
        return false;
    }

    // 휴대폰번호
    if (($('#mobile1').val() === null || $('#mobile1').val() <= 0) || ($('#mobile2').val() === null || $('#mobile2').val().length <= 0)) {
        alert('휴대폰 번호를 입력해주세요.');
        $('#mobile2').focus();
        return false;
    } else if (!mobileFilter.test($('#mobile2').val())) {
        alert('휴대폰 번호는 - 없이 10~11자리 숫자를 입력해야합니다.');
        $('#mobile2').focus();
        return false;
    }

    // ** 대행업체
    // 업체명
    if (form.vrscEntrpsNm === null || form.vrscEntrpsNm.length <= 0) {
        alert('대행 업체명을 입력해주세요.');
        $('#vrsc_cname').focus();
        return false;
    }

    // 사업자번호
    if (form.vrscBsnmRegistNo === null || form.vrscBsnmRegistNo.length <= 0) {
        alert('대행 사업자번호를 입력해주세요.');
        $('#vrsc_ipCoRegiNo').focus();
        return false;
    }

    // 사업자 등록증
    if ($('#updFile2')[0].files[0] == null) {
        alert('대행 사업자등록증을 첨부해주세요.');
        $('#updFile2').click();
        return false;
    }

    // 이메일
    if (($('#vrsc_ipUserEmail').val() === null || $('#vrsc_ipUserEmail').val().length <= 0) || ($('#vrsc_ipUserEmailDomain2').val() === null || $('#vrsc_ipUserEmailDomain2').val().length <= 0)) {
        alert('대행 업체 이메일을 입력해주세요.');
        $('#vrsc_ipUserEmail').focus();
        return false;
    }

    // 휴대폰 번호
    if (($('#vrsc_mobile1').val() === null || $('#vrsc_mobile1').val().length <= 0) || ($('#vrsc_mobile2').val() === null || $('#vrsc_mobile2').val().length <= 0)) {
        alert('대행 업체 휴대폰 번호를 입력해주세요.');
        $('#vrsc_mobile2').focus();
        return false;
    } else if (!mobileFilter.test($('#vrsc_mobile2').val())) {
        alert('휴대폰 번호는 - 없이 10~11자리 숫자를 입력해야합니다.');
        $('#vrsc_mobile2').focus();
        return false;
    }

    return true;
}

// 가입신청 버튼 클릭
$('#submitBtn').on('click',function(){

    var form = {};
    // 회사 기본 정보입력

    form.bidMberId = $('#uid').val(); // 아이디
    form.bidMberSecretNo = $('#upw').val(); // 비밀번호
    form.bidMberSecretNoCheck = $('#upw2').val(); // 비밀번호 확인
    form.entrpsNm = $('#cname').val(); // 회사명
    form.bsnmRegistNo = $('#ipCoRegiNo').val(); // 사업자번호

    form.frntnEntrpsAt = $('#foreign').prop('checked') ? 'Y' : 'N' // 외부업체 여부

    form.bidMberEmail = $('#ipUserEmail').val() + "@" + $('#ipUserEmailDomain').val(); // 이메일

    form.moblphoneNo2 = $('#mobile1').val() + " " + $('#mobile2').val(); // 휴대폰 번호


    // 입찰 대리 정보

    form.vrscEntrpsNm = $('#vrsc_cname').val(); // 대행 업체명
    form.vrscBsnmRegistNo = $('#vrsc_ipCoRegiNo').val(); // 대행 사업자번호
    form.vrscBidMberEmail = $('#vrsc_ipUserEmail').val() + "@" + $('#vrsc_ipUserEmailDomain2').val();
    form.vrscMoblphonNo = $('#vrsc_mobile1').val() + " " + $('#vrsc_mobile2').val();

    // 약관 정보
    // 필수약관
    form.useStplatAgreAt = "${terms.useStplatAgreAt}";
    form.indvdlInfoThreemanProvdAgreAt = "${terms.indvdlInfoThreemanProvdAgreAt}";
    form.indvdlInfoProcessPolcyAgreAt = "${terms.indvdlInfoProcessPolcyAgreAt}";

    // 선택약관
    form.marktRecptnAgreAt = "${terms.marktRecptnAgreAt}";
    form.mberChrctrRecptnAgreAt = "${terms.mberChrctrRecptnAgreAt}";
    form.mberEmailRecptnAgreAt = "${terms.mberEmailRecptnAgreAt}";
    form.mberPushRecptnAgreAt = "${terms.mberPushRecptnAgreAt}";

    console.log(form);

    // 필수 조건 검증

    if (!chkInfo(form)) {
        return;
    }

    const formData = new FormData();
    // 고객정보
    formData.append('BidMemberVO',JSON.stringify(form));

    // 사업자등록증 회사/대행
    if ($('#updFile1')[0].files[0] != null) {
        formData.append('docFiles',$('#updFile1')[0].files[0]);
    }
    formData.append('docFiles',$('#updFile2')[0].files[0]);

    $.ajax({
        type : 'POST',
        url : '/fo/member/creMember',
        processData : false,
        contentType: false,
        data : formData,
        success : function (response) {
            if (response.success) {
                location.href="/fo/member/create_3";
            }
            alert(response.message);
        },
        error : function (error) {
            console.log(error);
        }
    });
});
</script>

</body>
</html>