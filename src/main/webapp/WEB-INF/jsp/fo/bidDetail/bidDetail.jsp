<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="서린상사">
    <link rel="shortcut icon" href="/guide/images/favicon.ico">
    <meta name="keywords" content="서린상사, 서린상사(주), 비철금속전문기업, 아연, 황산">
    <meta name="description" content="세계를 선도하는 종합비철무역상사 - 서린상사">
    <title>구매입찰시스템 | SORIN e-Commerce</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="/guide/css/common.css">
    <link rel="stylesheet" href="/guide/css/sorin.css">
    <link rel="stylesheet" href="/guide/css/select2/select2.min.css">
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
        
		<!-- body-main :: START -->
		<div class="body-main">
			<!-- container :: START -->
			<div class="container">
				<!-- section #1 구매입찰 공고 LIST :: START -->
				<div class="section prod-detail-wrap bid">
					<div class="inwrap">
			            <!-- ITEM TITLE :: START  -->
			            <h2 class="h2-new">공고 상세 정보</h2>
			            <!-- ITEM TITLE :: END  -->	            
			            <!-- ITEM DETAIL AREA :: START -->
						<ul class="list t2">
			                <!-- LIST ITEM DETAIL : 입찰예정 :: START -->
			                <li>
			                    <div class="cart-item-wrap type4">
			                        <figure class="figure figure1">	
			                            <img src="/images/my/al_sum.jpg" alt="알루미늄" class="w">
			                        </figure>
			                        <div class="figure-con">
			                            <div class="pd-brand-info">
			                            	<h3 class="pd-bid-no">${bidBasInfo.bidPblancId}</h3>
			                                <div class="pd-wrap">
			                                    <div class="pd-brand">
			                                        <div class="pd-label">${bidBasInfo.metalCodeShort}</div>
			                                        <div class="brand-nation">
			                                            <img src="https://sorincorp.blob.core.windows.net/secs-t/odflag/flag_mcht_australia.png">
			                                        </div>
			                                        ${bidBasInfo.brandCode}
			                                    </div>
			                                    <div class="pd-like">
			                                        <ul class="company">
			                                            <li>
			                                                <span>참여기업</span>
			                                                <span>${bidBasInfo.partcptnEntrpsQy}</span>
			                                            </li>
			                                            <li>
			                                                <span>관심기업</span>
			                                                <span>${bidBasInfo.intrstEntrpsQy}</span>
			                                            </li>
			                                        </ul>
													<c:if test="${bidBasInfo.intrstAt eq 'N'}">
			                                        	<a href="#" class="ico like active">
													</c:if>
													<c:if test="${bidBasInfo.intrstAt ne 'N'}">
			                                        	<a href="#" class="ico like">
													</c:if>
			                                            <span class="material-symbols-outlined">favorite</span>
			                                            <span>관심추가</span>
			                                        </a>
			                                    </div>
			                                </div>
			                                <div class="pd-name">
			                                    <span class="item">Primary Aluminium Ingot (p1020)_434</span>
			                                    <span class="wrhous">출고권역 - ${bidBasInfo.dstrctLclsfCodeNm}</span>
			                                    <span class="brand-group">${bidBasInfo.brandGroupCodeNm}</span>
			                                </div>
			                                <div class="pd-period">
			                                    <span class="qty">수량 <span class="highlight">${bidBasInfo.bidWt}MT</span></span>	
			                                    <!-- <span class="date">투찰기간 <span class="highlight">22.10.20 11:00:00 ~ 22.10.30 18:00:00</span></span>  -->
												<span class="date">투찰기간 <span class="highlight">${bidBasInfo.bddprBeginDt} ~ ${bidBasInfo.bddprEndDt}</span></span> 
			                                	<span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="btns bid-state">
										<c:choose>
											<c:when test="${bidBasInfo.bidSttusCode == '12'}">
											<div class="btn-bid-stroke">입찰예정</div>
											</c:when>
											<c:when test="${bidBasInfo.bidSttusCode == '13'}">
												<div class="btn-bid-stroke blue">투찰중</div>
											</c:when>
											<c:when test="${bidBasInfo.bidSttusCode == '21'}">
												<div class="btn-bid-stroke blue">개찰</div>
											</c:when>
											<c:when test="${bidBasInfo.bidSttusCode == '32'}">
												<div class="btn-bid-black">유찰</div>
											</c:when>
											<c:when test="${bidBasInfo.bidSttusCode == '30'}">
												<div class="btn-bid-black">마감</div>
											</c:when>
										</c:choose>
 									</div>
		                        	<p class="bid-d-day abs-info"> <!-- <p class="bid-d-day pre abs-info"> -->
										<c:if test="${bidBasInfo.bidSttusCode == '12'}">
											투찰 시작까지 <span class="time">- ${bidBasInfo.bidTimer}</span>
										</c:if>
										<c:if test="${bidBasInfo.bidSttusCode == '13'}">
											투찰 마감까지 <span class="time">- ${bidBasInfo.bidTimer}</span>
										</c:if>
		                        	</p>
			                    </div>
			                </li>
			                <!-- item 1 입찰예정 :: END -->
			                <!-- 투찰 정보 입력 TABLE :: START -->
			                <div class="section bid-tbl-wrap">
			                    <div class="hgroup">
			                        <h2 class="h3">투찰 정보 입력</h2>
			                    </div>
								<div class="hidden">
									<input type="hidden" readonly disabled id="loginYn" value="${loginYn}" />
									<input type="hidden" readonly disabled id="bidPblancId" value="${bidPblancId}" />
									<input type="hidden" readonly disabled id="bidEntrpsNo" value="${bidEntrpsNo}" />
									<input type="hidden" readonly disabled id="bidMberId" value="${bidMberId}" />
								</div>
			                    <table class="tbl-v bid th-left">
			                        <caption>투찰정보 - 메탈구분, 브랜드, 아이템 상품명, 권역, 수량, 중량허용공차 제공</caption>
			                        <colgroup>
			                            <col style="width:20rem;">
			                            <col>
			                            <col style="width:20rem;">
			                            <col>
			                        </colgroup>
			                        <tbody id="bddprInfoTable">
			                            <tr>
			                                <th scope="row">메탈구분</th>
			                                <td>
			                                    <div class="read">AL</div>
			                                </td>
			                                <th scope="row">아이템 상품명</th>
			                                <td>
			                                    <div class="read">PRIMARY AL INGOT P1020</div>
			                                </td>	
			                            </tr>
			                            <tr>
			                                <th scope="row">권역</th>
			                                <td>
			                                    <div class="read">인천</div>
			                                </td>
			                                <th scope="row">브랜드</th>
			                                <td>
			                                    <div class="read">알루미늄(서구산) / 브랜드 무관</div>
			                                </td>			                                
			                            </tr>
			                            <tr>
			                                <th scope="row">수량(개)</th>
			                                <td>
			                                    <div class="read">2000</div>
			                                </td>
			                                <th scope="row">중량허용공차(±)</th>
			                                <td>
			                                    <div class="read">10%</div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">인도 조건</th>
			                                <td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
			                            </tr>
			                            <tr>
			                                <th scope="row">프리미엄 가격(USD/MT)</th>
			                                <td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
			                            </tr>
			                            <tr>
			                                <th class="multi" scope="row">인도 기한</th>
			                                <td class="multi" colspan="3">2022.10.20 ~ 2022.10.30<br>
			                                    <span class="t-info">인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함.</span>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">가격지정기간</th>
			                                <td>
			                                    <div class="read">2022.10.15 ~ 2022.10.19</div>
			                                </td>
			                                <th scope="row">가격지정방법</th>
			                                <td>
			                                    <div class="read">Monthly Avg *</div>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th scope="row">결제 조건</th>
			                                <td colspan="3">USD T/T AGAINST CONDITIONAL RELEASE ISSUED BY WAREHOUSE</td>
			                            </tr>
			                            <tr>
			                                <th scope="row">기타 코멘트</th>
			                                <td colspan="3">LME Warrant 제품 납품 불가</td>
			                            </tr>
			                        </tbody>
			                    </table>
			                    <div class="btn-wrap" id="btnContainer">
			                        <button type="button" class="btn-gray-big btn-list" onclick="location.href='/guide/html/bid/SOREC-SB-BID-001-2.html'">공고 목록가기</button>
			                    </div>
			                </div>
			                <!-- 투찰 정보 입력 TABLE :: END -->
			            </ul>			            
	            		<!-- ITEM DETAIL AREA :: END -->	            				
					</div>
				</div>
				<!-- section #1 구매입찰 공고 LIST :: END -->		    		
			</div>		
			<!-- container :: END -->
		</div>	
		<!-- body-main :: END -->

		<!-- 23.10.16 | footer include :: START -->
		<div class="footer bid"></div>
        <script type="text/javascript"> $(".footer.bid").load("/guide/html/bid/include/footer.html");</script>
        <!-- // 23.10.16 | footer include :: END -->

    </div>

	<!-- Modal Popup : 구매입찰 상세 > 투찰 접수 및 취소 최종 인증 -->
	<div class="popup modal alert" id="bddprPwValidate">
		<div class="modal-content w500px">
			<div class="modal-close">
				<button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button>
			</div>
			<div class="max-width" style="padding: 6rem 4rem; ">
				<form class="form-chk">
					<div class="section">
						<div class="article">
							<h1 class="h2-pd">비밀번호 확인</h1>
							<div class="alert-con">최종 인증을 진행합니다.<br/>가입 시 등록한 비밀번호를 입력해주세요.</div>
							<input type="password" placeholder="패스워드 입력" class="full"
									style="background: #f6f6f6;border: 1px solid #dedede;color: #999aa9;padding: 0 2rem;">
							<div class="btn-wrap">
								<button type="button" class="btn-blue-big modal-x" onclick="">확인</button>
							</div>
						</div>
					</div>
				</form>	        
			</div>
		</div>
	</div>
	<!--// Modal Popup : 구매입찰 상세 > 투찰 접수 및 취소 최종 인증 -->   

	<!-- Modal Popup : 구매입찰 상세 > 입력값 validate -->
	<div class="popup modal alert" id="bddprValidate">
        <div class="modal-content w490px">
            <div class="modal-header">
                <h1>알림메세지</h1>
                <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
            </div>
            <div class="max-width">
                <div class="alert-con">내용을 다시 확인해주세요.</div>
            </div>
            <div class="modal-btns">
                <button type="button" class="btn-blue-big modal-x">확인</button>
            </div>
        </div>
    </div>
	<!--// Modal Popup : 구매입찰 상세 > 입력값 validate -->   

    <!-- wrapper :: END -->

    <!-- script custom :: START -->
	<script src="/guide/js/common.js"></script>
	<script src="/guide/js/sorin.js"></script>
	<script src="/guide/js/sorin-ma.js"></script><!-- main js -->
	<!-- script custom :: END -->
	<script>

	// =============== BTN.LIKE ==================
	$(document).on('click', ".ico.like", function(e) {
		const loginYn = $("#loginYn").val();
		if(loginYn == 'N'){
			alert("로그인이 필요한 화면입니다.");
			return;
		}
		
		const bidPblancId = $("#bidPblancId").val();
		const bidEntrpsNo = $("#bidEntrpsNo").val();

		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo
		};
		var like = $(this);
	 	if(!$(this).hasClass('active')){
	 		 $.ajax({
	 			type : 'post',
	 			url : '/fo/insertIntrstPblanc',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
	 				like.toggleClass('active');
	 			},
	 			error : function(request, status, error) {
	 				console.log("error")
	 			} 
	 		});
	 	}else{
	 		 $.ajax({
	 			type : 'post',
	 			url : '/fo/deleteIntrstPblanc',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
	 				like.removeClass('active');
	 			},
	 			error : function(request, status, error) {
	 				console.log("error")
	 			} 
	 		});
	 	}
	  
	    
	})

	// =============== SELECT BOX ==================
	$('#shippingAddr').select2({
		width: 'element',
		minimumResultsForSearch: Infinity,
		selectOnClose: true
	});

	</script>

	<script>
	$(function(){
		setBddpDtlInfo();
	});

	function setBddpDtlInfo () {
		const bidPblancId = $("#bidPblancId").val();
		const bidEntrpsNo = $("#bidEntrpsNo").val();

		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo
		}
		$.ajax({
	 			type : 'post',
	 			url : '/fo/bid/detail/getBidDtlInfo',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
					setBddrDtlTable(res);
					setBtnContainer(res);
	 			},
	 			error : function(request, status, error) {
	 				console.log("error")
	 			} 
	 		});
	}

	function setBtnContainer(res) {
		const bidDtlInfo = res.bidDtlInfo;
		if(!bidDtlInfo) return;

		var btnContainer = "";

		const bidSttusCode = bidDtlInfo.bidSttusCode

		const toListBtn = `<button type="button" class="btn-gray-big btn-list" onclick="location.href='/fo/bid'">공고 목록가기</button>`;
		const toMyPageBtn = `<button type="button" class="btn-stroke-big blue" onclick="location.href='/fo/mypage?bidEntrpsNo=\${bidDtlInfo.bidEntrpsNo}'>마이페이지</button>`;
		const submitBtn = `<button type="button" class="btn-blue-big" onclick="handleSubmit()">투찰하기</button>`;
		const canclBtn = `<button type="button" class="btn-black-big" onclick="">투찰취소</button>`;

		if(bidSttusCode == "12") {
			btnContainer += toListBtn;
		}else if(bidSttusCode == "13") {
			btnContainer += toListBtn;
			
			if(bidDtlInfo.bddprAt == 'Y') {
				btnContainer += bidDtlInfo.canclAt == 'Y' ? toMyPageBtn : canclBtn;
			}else {
				btnContainer +=  submitBtn;
			}
		}else if(bidSttusCode == "30") {
			btnContainer += toListBtn + toMyPageBtn;
		}else {
			btnContainer += toListBtn;
		}

		$("#btnContainer").html(btnContainer);
	}

	function setBddrDtlTable(res) {
		const bidDtlInfo = res.bidDtlInfo;
		if(!bidDtlInfo) return;
		
		var tbody = "";
		tbody += `
			<tr>
				<th scope="row">메탈구분</th>
				<td>
					<div class="read">\${bidDtlInfo.metalCodeShort}</div>
				</td>
				<th scope="row">아이템 상품명</th>
				<td>
					<div class="read">\${bidDtlInfo.dspyGoodsNm}</div>
				</td>	
			</tr>
			<tr>
				<th scope="row">권역</th>
				<td>
					<div class="read">\${bidDtlInfo.dstrctLclsfCodeNm}</div>
				</td>
				<th scope="row">브랜드</th>
				<td>
					<div class="read">\${bidDtlInfo.brandGroupCodeNm}</div>
				</td>			                                
			</tr>
			<tr>
				<th scope="row">수량(개)</th>
				<td>
					<div class="read">\${bidDtlInfo.bidWt}</div>
				</td>
				<th scope="row">중량허용공차(±)</th>
				<td>
					<div class="read">\${bidDtlInfo.permWtRate}%</div>
				</td>
			</tr>`;
		if(bidDtlInfo.bidSttusCode != '13') {
			tbody += `
			<tr>
				<th scope="row">인도 조건</th>
				<td colspan="3"><span class="icon-info-txt">\${bidDtlInfo.bidSttusNotice}</span></td>
			</tr>
			<tr>
				<th scope="row">프리미엄 가격(USD/MT)</th>
				<td colspan="3"><span class="icon-info-txt">\${bidDtlInfo.bidSttusNotice}</span></td>
			</tr>`;
		}else if(bidDtlInfo.bidSttusCode == '13') {
			tbody += `
			<tr class="bid-condition">
				<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
				<td colspan="2">
					<div class="tb-select">
						<label for="shippingAddr">검색조건</label>
						<select name="shippingAddr" id="shippingAddr">
							<option value="">옵션</option>
							\${makeOption(bidDtlInfo)}
						</select>                    
					</div>
				</td>
				<td colspan="1">
					<input class="input-lg" type="text" disabled readonly name="delyCndStdrPc" id="delyCndStdrPc" value="\${formatNumberComma(bidDtlInfo.delyCndStdrPc)}" placeholder="">
					<input type="hidden" disabled readonly id="delyCnd01StdrPc" value="\${formatNumberComma(bidDtlInfo.delyCnd01StdrPc)}" >
					<input type="hidden" disabled readonly id="delyCnd02StdrPc" value="\${formatNumberComma(bidDtlInfo.delyCnd02StdrPc)}" >
					<input type="hidden" disabled readonly id="delyCnd03StdrPc" value="\${formatNumberComma(bidDtlInfo.delyCnd03StdrPc)}" >
				</td>
			</tr>
			<tr class="bid-condition bid-condition2">
				<td class="right-narrow" colspan="2">
					<div class="input-btn-wrap">
						<div class="r-info">+전환 프리미엄가</div>
						<div class="btns">
							<a href="#" class="btn-navy-md">인도조건창고 목록</a>
						</div>
					</div>
				</td>
				<td colspan="1">
					<input class="input-lg" type="text" disabled readonly name="cnvrsPremiumAmount" id="cnvrsPremiumAmount" value="\${formatNumberComma(bidDtlInfo.cnvrsPremiumAmount)}" placeholder="">
					<input type="hidden" disabled readonly id="delyCnd01PremiumPc" value="\${formatNumberComma(bidDtlInfo.delyCnd01PremiumPc)}" >
					<input type="hidden" disabled readonly id="delyCnd02PremiumPc" value="\${formatNumberComma(bidDtlInfo.delyCnd02PremiumPc)}" >
					<input type="hidden" disabled readonly id="delyCnd03PremiumPc" value="\${formatNumberComma(bidDtlInfo.delyCnd03PremiumPc)}" >
				</td>                                
			</tr>			                            
			<tr>
				<th class="fc-red" rowspan="2" scope="row">프리미엄 가격(USD/MT)</th>
				<td class="bg-orange1" colspan="2">투찰 프리미엄 가격</td>
				<td class="bg-orange2" colspan="1">투찰 최종 가격</td>
			</tr>		
			<tr>`
			if(bidDtlInfo.bddprAt == 'Y') {
				tbody += `
				<td class="center" colspan="2">
					<input class="input-md" type="text" readonly disabled name="bddprPremiumPc" id="bddprPremiumPc" value="\${formatNumberComma(bidDtlInfo.bddprPremiumPc)}" placeholder="">/MT
				</td>
				<td class="center" colspan="1"><span id="bddprFinalAmount">\${formatNumberComma(bidDtlInfo.bddprFinalAmount)}</span> 원</td>`;
			}else {
				tbody += `
				<td class="center" colspan="2">
					<input class="input-md" type="text" name="bddprPremiumPc" id="bddprPremiumPc" value="\${formatNumberComma(bidDtlInfo.bddprPremiumPc)}" placeholder=""
						onkeyup="handleChangePremiumPc(\${bidDtlInfo.cnvrsPremiumAmount}, \${bidDtlInfo.delyCndStdrPc}, \${bidDtlInfo.bidWt})">/MT
				</td>
				<td class="center" colspan="1"><span id="bddprFinalAmount">\${formatNumberComma(bidDtlInfo.bddprFinalAmount)}</span> 원</td>`;
			}
			tbody += `</tr>`;
		}
		tbody += `
			<tr>
				<th class="multi" scope="row">인도 기한</th>
				<td class="multi" colspan="3">\${bidDtlInfo.delyBeginDe} ~ \${bidDtlInfo.delyEndDe}<br>
					<span class="t-info">인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함.</span>
				</td>
			</tr>
			<tr>
				<th scope="row">가격지정기간</th>
				<td>
					<div class="read">\${bidDtlInfo.pcAppnBeginDe} ~ \${bidDtlInfo.pcAppnEndDe}</div>
				</td>
				<th scope="row">가격지정방법</th>
				<td>
					<div class="read">\${bidDtlInfo.pcAppnMthCodeNm}</div>
				</td>
			</tr>
			<tr>
				<th scope="row">결제 조건</th>
				<td colspan="3">
					\${bidDtlInfo.setleCrncyCodeNm ? bidDtlInfo.setleCrncyCodeNm + " " : ""}
					\${bidDtlInfo.setleMthCodeNm ? bidDtlInfo.setleMthCodeNm + " " : ""}
					\${bidDtlInfo.setlePdCodeNm ? bidDtlInfo.setlePdCodeNm : ""}
				</td>
			</tr>
			<tr>
				<th scope="row">기타 코멘트</th>
				<td colspan="3">\${bidDtlInfo.etcCn ? bidDtlInfo.etcCn : ""}</td>
			</tr>
		`;
		if(bidDtlInfo.bidSttusCode == '13') {
			tbody += `
				<tr>
					<th scope="row">입찰 참여 동의</th>
					<td colspan="3">
						<div class="checkbox-container">
							<label class="checkbox-label" for="agree_all">
								<input type="checkbox" name="agree_all" id="agree_all" value="" checked>
								<span class="checkbox-custom rectangular"></span>
							</label>
							<div class="input-title">상기&nbsp;내용에&nbsp;입찰&nbsp;동의합니다.</div>
						</div>   
					</td>
				</tr>
			`;
		}
		
		$("#bddprInfoTable").html(tbody);

		$('#shippingAddr').select2({
			width: 'element',
			minimumResultsForSearch: Infinity,
			selectOnClose: true
		});
	}

	// 인도 조건 옵션 선택 이벤트
	$(document).on('change', "#shippingAddr", function(e) {
		const selected = e.target.value;

		$("#delyCndStdrPc").val($(`#delyCnd\${selected}StdrPc`).val());
		$("#cnvrsPremiumAmount").val($(`#delyCnd\${selected}PremiumPc`).val());
	});

	// 인도 조건 옵션 생성
	function makeOption (data) {
		if(!data) return;

		var optionList = "";
		if(data.delyCnd01ApplcAt != "Y") {
			optionList += `<option value="01" selected>서린상사 지정 보세창고 도착도 (FCA서린상사 지정 보세창고)</option>`;
		}
		if(data.delyCnd02ApplcAt != "Y") {
			optionList += `<option value="02">기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</option>`;
		}
		if(data.delyCnd03ApplcAt != "Y") {
			optionList += `<option value="03">CIF INCHEON / CIF BUSAN</option>`;
		}

		return optionList;
	}
	
	// 투찰 프리미엄 가격 입력 이벤트
	function handleChangePremiumPc(cnvrsPremiumAmount, delyCndStdrPc, bidWt) {
		const inputValue = $("#bddprPremiumPc").val();
		$("#bddprPremiumPc").val(formatNumberComma(inputValue));

		// 투찰 최종 가격 수정
		const bddprPremiumPc = commaToNumber($("#bddprPremiumPc").val());
		var bddprFinalAmount = bidWt * (delyCndStdrPc + bddprPremiumPc + cnvrsPremiumAmount);
		$("#bddprFinalAmount").text(formatNumberComma(bddprFinalAmount));
	};

	function formatNumberComma (number) {
		var num = number.toString().replace(/[^-0-9]/gi, '') || 0;
		return parseInt(num).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function commaToNumber (text) {
		return parseInt(text.toString().replace(/[^-0-9]/gi, ''));
	}

	function handleSubmit () {
		if(!$("#shippingAddr option:selected").val()) {
			popup('bddprValidate', 'alert');
			return;
		}
		if(!$("#agree_all").is(':checked')) {
			popup('bddprValidate', 'alert');
			return;
		}
		popup('bddprPwValidate', 'alert');
	}

	$(document).on('click', "#bddprPwValidate button", function(e) {
		const bidPblancId = $("#bidPblancId").val();
		const bidEntrpsNo = $("#bidEntrpsNo").val();
		const bidMberId = $("#bidMberId").val();
		
		const bddprPremiumPc = commaToNumber($("#bddprPremiumPc").val());
		const cnvrsPremiumAmount = commaToNumber($("#cnvrsPremiumAmount").val());
		const delyCndStdrPc = commaToNumber($("#delyCndStdrPc").val());
		const shippingAddr = $("#shippingAddr option:selected").val();
		
		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo,
				"bidMberId" : bidMberId,
				"bddprPremiumPc" : bddprPremiumPc,
				"cnvrsPremiumAmount" : cnvrsPremiumAmount,
				"delyCndStdrPc" : delyCndStdrPc,
				"shippingAddr" : shippingAddr,
		}

		$.ajax({
	 			type : 'post',
	 			url : '/fo/bid/detail/doBddpr',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
					location.reload(true);
	 			},
	 			error : function(request, status, error) {
	 				console.log("error")
	 			} 
	 		});
	});

	</script>
</body>
</html>