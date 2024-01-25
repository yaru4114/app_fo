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
        <!-- <script type="text/javascript"> $(".header.bid").load("/guide/html/bid/include/header.html");</script> -->
        <script type="text/javascript"> $(".header.bid").load("/fo/header");</script>
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
			                                                <span class="intrstEntrpsCnt">${bidBasInfo.intrstEntrpsQy}</span>
			                                            </li>
			                                        </ul>
													<c:if test="${bidBasInfo.intrstAt eq 'N'}">
			                                        	<a href="javascript:;" class="ico like active" data-bid-id="${bidBasInfo.bidPblancId}">
													</c:if>
													<c:if test="${bidBasInfo.intrstAt ne 'N'}">
			                                        	<a href="javascript:;" class="ico like" data-bid-id="${bidBasInfo.bidPblancId}">
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
											<c:when test="${bidBasInfo.bidSttusCode == '30' || bidBasInfo.bidSttusCode == '31' }">
												<div class="btn-bid-black">마감</div>
											</c:when>
										</c:choose>
 									</div>
		                        	<p class="bid-d-day abs-info"> <!-- <p class="bid-d-day pre abs-info"> -->
										<c:if test="${bidBasInfo.bidSttusCode == '12'}">
											투찰 시작까지 <span class="time" id="time${bidBasInfo.bidPblancId}">${bidBasInfo.bidTimer}</span>
										</c:if>
										<c:if test="${bidBasInfo.bidSttusCode == '13'}">
											투찰 마감까지 <span class="time" id="time${bidBasInfo.bidPblancId}">${bidBasInfo.bidTimer}</span>
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
								<div class="section fixes-wrap" id="bidHistContainer" style="display: none;">
									<div class="tbl-list-summary">
										수정 사항
									</div>
									<ul class="list t2">
										<li>
											<div class="balance-manage-result">
												<div class="date">2022.10.20 17:52</div>
												<div class="figure-con">
													<p class="pd-name">뮤지엄에서 마주한 고요와 아우성의 시간들</p>
													<p class="pd-order">
														<span>백 번의 전시는 백 번의 ‘케바케’ 내가 전시 기획이란 것을 처음 배운 곳은 책이다. 학예사 자격증을 받기 위해서 박물관학과 전시에 관한 책들을 읽고
															교육을 받으면서 나는 전시 기획이 뭔지 알게 되었다.</span>
													</p>
												</div>
											</div>
										</li>                         
										<li>
											<div class="balance-manage-result">
												<div class="date">2022.10.20 17:52</div>
												<div class="figure-con">
													<p class="pd-name">유찰사유에 대한 제목이 들어갑니다.</p>
													<p class="pd-order">
														<span>오언은 내가 물건을 잃어버리는 방식에 관해, 잃어버리는 행위를 내 나름의 예술로 승화해나가는 방식에 관해 이야기하면서 나를 놀리곤 했다.</span>
													</p>
												</div>
											</div>
										</li>                            
									</ul>
								</div>
								<div class="section fixes-wrap" id="bidResultContainer" style="display: none;"></div>
			                    <div class="btn-wrap" id="btnContainer">
			                        <button type="button" class="btn-gray-big btn-list" onclick="toBidList()">공고 목록가기</button>
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
	<div class="popup modal alert" id="memberPwAuth">
		<div class="modal-content w500px">
			<div class="modal-header">
                <h1>비밀번호 확인</h1>
                <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
            </div>
			<div class="max-width" style="padding: 0 4rem 4rem 4rem; ">
				<form class="form-chk">
					<div class="section">
						<div class="article">
							<div class="alert-con">최종 인증을 진행합니다.<br/>가입 시 등록한 비밀번호를 입력해주세요.</div>
							<input type="password" placeholder="패스워드 입력" class="full"
									style="background: #f6f6f6;border: 1px solid #dedede;color: #999aa9;padding: 0 2rem;">
							<div class="btn-wrap">
								<button type="button" class="btn-blue-big modal-x modal-ok">확인</button>
							</div>
						</div>
					</div>
				</form>	        
			</div>
		</div>
	</div>
	<!--// Modal Popup : 구매입찰 상세 > 투찰 접수 및 취소 최종 인증 -->   

	<!-- Modal Popup : 구매입찰 상세 > 투찰 취소 동의 -->
	<div class="popup modal alert" id="bddprCanclAlert">
		<div class="modal-content w500px">
			<div class="modal-header">
                <h1>알림</h1>
                <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
            </div>
			<div class="max-width" style="padding: 0 4rem 4rem 4rem; ">
				<form class="form-chk">
					<div class="section">
						<div class="alert-con">
							해당 공고는 투찰 접수된 상태입니다.<br/>취소 시, 입찰 정보가 사라지며<br/>동일 입찰건은 재입찰이 불가능합니다.
							<br/><br/>취소하시겠습니까?
						</div>
						<div class="checkbox-container" style="align-items: right;">
							<label class="checkbox-label" for="agree_cancl">
								<input type="checkbox" name="agree_cancl" id="agree_cancl" value="" checked>
								<span class="checkbox-custom rectangular"></span>
							</label>
							<div class="input-title">확인&nbsp;후&nbsp;취소합니다.</div>
						</div>
						<div class="btn-wrap">
							<button type="button" class="btn-gray-big modal-x">닫기</button>
							<button type="button" class="btn-blue-big modal-x modal-ok" onclick="canclAgreeValid()">투찰 취소합니다.</button>
						</div>
					</div>
				</form>	        
			</div>
		</div>
	</div>
	<!--// Modal Popup : 구매입찰 상세 > 투찰 취소 동의 -->   

	<!-- Modal Popup : 구매입찰 상세 > 얼럿창 공통 -->
	<div class="popup modal alert" id="bddprAlert">
        <div class="modal-content w490px">
            <div class="modal-header">
                <h1>알림메세지</h1>
                <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
            </div>
            <div class="max-width">
                <div class="alert-con">내용을 다시 확인해주세요.</div>
            </div>
            <div class="modal-btns">
                <button type="button" class="btn-blue-big modal-x modal-ok">확인</button>
            </div>
        </div>
    </div>
	<!--// Modal Popup : 구매입찰 상세 > 얼럿창 공통 -->   

	<!-- Modal Popup : 구매입찰 상세 > 투찰 성공 메시지 -->
	<div class="popup modal confirm" id="bddprSuccess">
        <div class="modal-content w490px">
            <div class="modal-header">
                <h1>알림메세지</h1>
                <div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div>
            </div>
            <div class="max-width">
                <div class="alert-con"></div>
            </div>
            <div class="modal-btns">
                <button type="button" class="btn-gray-big modal-x" onclick="location.reload(true)">확인</button>
				<button type="button" class="btn-blue-big modal-x" onclick="toMyPage()">마이페이지</button>
            </div>
        </div>
    </div>
	<!--// Modal Popup : 구매입찰 상세 > 투찰 성공 메시지 -->   

    <!-- wrapper :: END -->

    <!-- script custom :: START -->
	<script src="/guide/js/common.js"></script>
	<script src="/guide/js/sorin.js"></script>
	<script src="/guide/js/sorin-ma.js"></script><!-- main js -->
	<!-- script custom :: END -->
	<script>
	// =============== BTN.LIKE ==================
	$(document).on('click', ".ico.like", function(e) {
		if(loginYn == 'N'){
			alert("로그인이 필요한 화면입니다.");
			return;
		}
		
		var bidPblancId = $(this).attr('data-bid-id');
		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : $("#bidEntrpsNo").val()
		};
		var likeBtn = $(this);

	 	if(!$(this).hasClass('active')){
	 		 $.ajax({
	 			type : 'post',
	 			url : '/fo/insertIntrstPblanc',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
	 				likeBtn.toggleClass('active');
	 				var intrstEntrpsCnt = likeBtn.siblings().find(".intrstEntrpsCnt");
	 				intrstEntrpsCnt.text(parseInt(intrstEntrpsCnt.text())+1);
	 			},
	 			error : function(request, status, error) {
	 				alert("오류가 발생했습니다")
	 				location.href="/fo/bid";
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
	 				likeBtn.removeClass('active');
	 				var intrstEntrpsCnt = likeBtn.siblings().find(".intrstEntrpsCnt");
	 				intrstEntrpsCnt.text(parseInt(intrstEntrpsCnt.text())-1);
	 			},
	 			error : function(request, status, error) {
	 				alert("오류가 발생했습니다")
	 				location.href="/fo/bid";
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
		
		//타이머 설정
		setFmtDate("${bidBasInfo.bddprBeginDt}","${bidBasInfo.bddprEndDt}","time${bidBasInfo.bidPblancId}", "${bidBasInfo.bidSttusCode}")
	});
	
	function setFmtDate(startDate, endDate, id, bidSttusCode){
		setTimeout(function(){$("#"+id).html(" ");} , 0);
		setInterval(function(){
			var now = new Date();
			var startFmtDate = new Date((String)(new Date().getFullYear()).substring(0,2)+startDate);
			var endFmtDate = new Date((String)(new Date().getFullYear()).substring(0,2)+endDate);
			
			$("#"+id).html("");
			if(bidSttusCode == "12" && startFmtDate >= now){
				$("#"+id).html(" - " + Math.floor((startFmtDate-now) / (1000*60*60*24)) +"일 "+Math.floor(((startFmtDate-now) / (1000*60*60)) % 24) +"시간 "
						+Math.floor(((startFmtDate-now) / (1000*60)) % 60) +"분 "+Math.floor((startFmtDate-now) / 1000 % 60) + "초");
			}else if(bidSttusCode == "13" && endFmtDate >= now){
				$("#"+id).html(" - " + Math.floor((endFmtDate-now) / (1000*60*60*24)) +"일 "+Math.floor(((endFmtDate-now) / (1000*60*60)) % 24) +"시간 "
						+Math.floor(((endFmtDate-now) / (1000*60)) % 60) +"분 "+Math.floor((endFmtDate-now) / 1000 % 60) + "초");
			}else{
				$("#"+id).html("");    
			}
        },1000); //1초마다 
        
	}
	
	
	function toMyPage() {
		const bidEntrpsNo = $("#bidEntrpsNo").val();
		location.href=`/fo/mypage?bidEntrpsNo=\${bidEntrpsNo}`;
	}
	
	function toBidList() {
		location.href='/fo/bid'
	}

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
					setBidResultContainer(res);
					setBidHistContainer(res);
	 			},
	 			error : function(request, status, error) {
					popup("bddprAlert", 'alert', "오류가 발생하였습니다.");
	 			} 
	 		});
	}

	function formatDateString(date) {
		const valid_date = date.toString().replace(/[^-0-9]/gi, '') || '';

		if(!valid_date) return '';

		const format_date = valid_date.replace(/(\d{4})(\d{2})(\d{2})(\d{2})?(\d{2})?(\d{2})?/, '$1.$2.$3');

		return format_date;
	}

	function formatDatetime(date) {
		const valid_date = date.toString().replace(/[^-0-9]/gi, '') || '';

		if(!valid_date) return '';

		const format_date = valid_date.replace(/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/, '$1.$2.$3 $4:$5');

		return format_date;
	}

	function maskingPrice(price) {
		return price.toString().replace(/(^\d$)|\d(?=\d)/g, '*');
	}

	function setBidHistContainer(res) {
		const bidDtlInfo = res.bidDtlInfo;
		if(!bidDtlInfo || !bidDtlInfo.bidHistList) {
			$("#bidHistContainer").hide();
			return;
		}

		var bidHistContainer = "";

		
		bidHistContainer += `
			<div class="hgroup">
				<h2 class="h3">수정 사항</h2>
			</div>
			<table class="tbl t3 bid">
				<caption>투찰 결과</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:20%;">
					<col style="width:20%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="rank">수정일</th>
						<th scope="col" class="company">수정내용</th>
						<th scope="col" class="date">수정사유</th>
					</tr>
				</thead>
				<tbody>`;
		
		bidDtlInfo.bidHistList.forEach((bidHist) => {
			bidHistContainer += `
				<tr>
					<td class="center">\${formatDatetime(bidHist.frstRegistDt)}</td>
					<td class="center">\${bidHist.bidUpdtCn}</td>
					<td class="center">\${bidHist.bidUpdtResn}</td>
				</tr>`;
		});
		bidHistContainer += `
			</tbody>
		</table>`;

		$("#bidHistContainer").html(bidHistContainer);
		$("#bidHistContainer").show();
	}

	function setBidResultContainer(res) {
		const bidDtlInfo = res.bidDtlInfo;
		
		if(!bidDtlInfo || (bidDtlInfo.bidSttusCode != '30' && bidDtlInfo.bidSttusCode != '31' && bidDtlInfo.bidSttusCode != '32')) {
			$("#bidResultContainer").hide();
			return;
		}

		var bidResultContainer = "";

		if(bidDtlInfo.bidSttusCode == '32') {
			bidResultContainer += `
				<div class="tbl-list-summary">
					유찰 사유
				</div>
				<ul class="list t2">
					<li>
						<div class="balance-manage-result">
							<div class="date">\${formatDatetime(bidDtlInfo.failBidDt)}</div>
							<div class="figure-con">
								<p class="pd-name fc-red">\${bidDtlInfo.dspyGoodsNm}</p>
								<p class="pd-order">
									<span>
										\${bidDtlInfo.failBidResn}
									</span>
								</p>
							</div>
						</div>
					</li>                               
				</ul>`;
		} else {
			bidResultContainer += `
			<div class="hgroup">
				<h2 class="h3">투찰 결과</h2>
			</div>
			<table class="tbl t3 bid">
				<caption>투찰 결과</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:20%;">
					<col style="width:20%;">
					<col style="width:20%;">
					<col style="width:20%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="rank">순위</th>
						<th scope="col" class="company">기업명</th>
						<th scope="col" class="date">접수일</th>
						<th scope="col" class="premium">프리미엄가</th>
						<th scope="col" class="result">결과</th>
					</tr>
				</thead>
				<tbody>`
			bidDtlInfo.bddprEntrpsList.forEach((bddprEntrps) => {
				bidResultContainer += 
					`<tr class="\${bddprEntrps.scsbidAt == 'Y' ? 'active' : ''}">
						<td class="center">\${bddprEntrps.rank}</td>
						<td class="center">\${bddprEntrps.entrpsNm}</td>
						<td class="center">\${formatDatetime(bddprEntrps.bddprDt)}</td>
						<td class="center">\${maskingPrice(bddprEntrps.bddprPremiumPc)}</td>
						<td class="center">\${bddprEntrps.scsbidAt == 'Y' ? '낙찰' : '패찰'}</td>
					</tr>`
			});
			bidResultContainer += 
				`</tbody>
			</table>`;
		}
		$("#bidResultContainer").html(bidResultContainer);
		$("#bidResultContainer").show();

	}

	function setBtnContainer(res) {
		const bidDtlInfo = res.bidDtlInfo;
		if(!bidDtlInfo) return;

		var btnContainer = "";

		const bidSttusCode = bidDtlInfo.bidSttusCode

		const toListBtn = `<button type="button" class="btn-gray-big btn-list" onclick="toBidList()">공고 목록가기</button>`;
		const toMyPageBtn = `<button type="button" class="btn-stroke-big blue" onclick="toMyPage()">마이페이지</button>`;
		const submitBtn = `<button type="button" class="btn-blue-big" onclick="handleSubmit()">투찰하기</button>`;
		const canclBtn = `<button type="button" class="btn-black-big" onclick="handleCancl()">투찰취소</button>`;

		if(bidSttusCode == "12") {
			btnContainer += toListBtn;
		}else if(bidSttusCode == "13") {
			btnContainer += toListBtn;
			
			if(bidDtlInfo.bddprAt == 'Y') {
				btnContainer += bidDtlInfo.canclAt == 'Y' ? toMyPageBtn : canclBtn;
			}else {
				btnContainer +=  submitBtn;
			}
		}else {
			btnContainer += toListBtn + toMyPageBtn;
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
		if(bidDtlInfo.bidSttusCode == '12') {
			tbody += `
			<tr>
				<th scope="row">인도 조건</th>
				<td colspan="3"><span class="icon-info-txt">\${bidDtlInfo.bidSttusNotice}</span></td>
			</tr>
			<tr>
				<th scope="row">프리미엄 가격(USD/MT)</th>
				<td colspan="3"><span class="icon-info-txt">\${bidDtlInfo.bidSttusNotice}</span></td>
			</tr>`;
		}else {
			let disabled = bidDtlInfo.bidSttusCode != '13' || bidDtlInfo.bddprAt == 'Y' 
								|| bidDtlInfo.canclAt == 'Y' ? "disabled" : "";
			tbody += `
			<tr class="bid-condition">
				<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
				<td colspan="2">
					<div class="tb-select">
						<label for="shippingAddr">검색조건</label>
						<select name="shippingAddr" id="shippingAddr" \${disabled}>
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
			<tr>
				<td class="center" colspan="2">
					<input class="input-md" type="text" name="bddprPremiumPc" id="bddprPremiumPc" placeholder=""
						value="\${formatNumberComma(bidDtlInfo.bddprPremiumPc)}"
						onkeyup="handleChangePremiumPc(\${bidDtlInfo.cnvrsPremiumAmount}, \${bidDtlInfo.delyCndStdrPc}, \${bidDtlInfo.bidWt})"
						\${disabled} >/MT
				</td>
				<td class="center" colspan="1"><span id="bddprFinalAmount">\${formatNumberComma(bidDtlInfo.bddprFinalAmount)}</span> 원</td>
			</tr>`;
		}
		tbody += `
			<tr>
				<th class="multi" scope="row">인도 기한</th>
				<td class="multi" colspan="3">\${formatDateString(bidDtlInfo.delyBeginDe)} ~ \${formatDateString(bidDtlInfo.delyEndDe)}<br>
					<span class="t-info">인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함.</span>
				</td>
			</tr>
			<tr>
				<th scope="row">가격지정기간</th>
				<td>
					<div class="read">\${formatDateString(bidDtlInfo.pcAppnBeginDe)} ~ \${formatDateString(bidDtlInfo.pcAppnEndDe)}</div>
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
		if(data.delyCnd01ApplcAt == "Y") {
			optionList += `<option value="01" \${data.delyCndCode == "01" ? "selected" : ""}>서린상사 지정 보세창고 도착도 (FCA서린상사 지정 보세창고)</option>`;
		}
		if(data.delyCnd02ApplcAt == "Y") {
			optionList += `<option value="02" \${data.delyCndCode == "02" ? "selected" : ""}>기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</option>`;
		}
		if(data.delyCnd03ApplcAt == "Y") {
			optionList += `<option value="03" \${data.delyCndCode == "03" ? "selected" : ""}>CIF INCHEON / CIF BUSAN</option>`;
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
			popup('bddprAlert', 'alert', '내용을 다시 확인해주세요.');
			return;
		}
		if(!$("#agree_all").is(':checked')) {
			popup('bddprAlert', 'alert', '내용을 다시 확인해주세요.');
			return;
		}
		popup('memberPwAuth', 'modal', '', doBddpr);
	}

	async function handleCancl() {
		const dateValidPromise = await canclDateValid();
		
		if(!dateValidPromise.result) {
			popup('bddprAlert', 'alert', '취소접수 기한이 지나 취소가 불가능합니다.')
		}else {
			popup('bddprCanclAlert', 'modal');
		}
	}

	// 투찰취소 가능 기한 validation
	function canclDateValid(date) {
		const bidPblancId = $("#bidPblancId").val();
		var params = {
			"bidPblancId" : bidPblancId,
		}

		return $.ajax({
	 			type : 'post',
	 			url : '/fo/bid/detail/canclDateValid',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json'
		});
	}

	// 취소 확인 체크여부 validation
	function canclAgreeValid() {
		if($("#agree_cancl").is(":checked")) {
			popup('memberPwAuth', 'modal', '', canclBddpr);
		}else {
			popup('bddprAlert', 'alert', '취소 확인에 체크해주세요.', ()=>{
				$("#agree_cancl").prop("checked", true);
			});
		}
	}

	function memberPwAuth() {
		let params = {
			userId: $("#bidMberId").val(),
	        userPwd: $("#memberPwAuth input[type='password']").val()
	    };
		$("#memberPwAuth input[type='password']").val("");
		
		return $.ajax({
	 			type : 'post',
	 			url : '/fo/member/auth',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 		});
	}

	async function doBddpr() {
		const memberAuthResult = await memberPwAuth();

		if(!memberAuthResult.success) {
			popup("bddprAlert", 'alert', "비밀번호를 확인해주세요.");
			return;
		}

		const bidPblancId = $("#bidPblancId").val();
		const bidEntrpsNo = $("#bidEntrpsNo").val();
		const bidMberId = $("#bidMberId").val();
		
		const bddprPremiumPc = commaToNumber($("#bddprPremiumPc").val());
		const cnvrsPremiumAmount = commaToNumber($("#cnvrsPremiumAmount").val());
		const delyCndStdrPc = commaToNumber($("#delyCndStdrPc").val());
		const delyCndCd = $("#shippingAddr option:selected").val();
		
		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo,
				"bidMberId" : bidMberId,
				"bddprPremiumPc" : bddprPremiumPc,
				"cnvrsPremiumAmount" : cnvrsPremiumAmount,
				"delyCndStdrPc" : delyCndStdrPc,
				"delyCndCd" : delyCndCd,
		}

		$.ajax({
	 			type : 'post',
	 			url : '/fo/bid/detail/doBddpr',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
					if(res.result == "success") {
						popup("bddprSuccess", 'alert', "정상 접수 되었습니다.<br/>내가 참여한 입찰 내역은<br/>[마이페이지]<br/>확인 가능합니다. 감사합니다.");
					}else if(res.result == "fail") {
						popup("bddprAlert", 'alert', res.message);
					}
	 			},
	 			error : function(request, status, error) {
					popup("bddprAlert", 'alert', "오류가 발생하였습니다.<br/>" + error);
	 			} 
	 		});
	}

	async function canclBddpr() {
		const memberAuthResult = await memberPwAuth();

		if(!memberAuthResult.success) {
			popup("bddprAlert", 'alert', "비밀번호를 확인해주세요.");
			return;
		}

		const bidPblancId = $("#bidPblancId").val();
		const bidEntrpsNo = $("#bidEntrpsNo").val();
		const bidMberId = $("#bidMberId").val();

		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo,
				"bidMberId" : bidMberId,
		}

		$.ajax({
				type : 'post',
				url : '/fo/bid/detail/canclBddpr',
				dataType : 'json',
				data : JSON.stringify(params),
				contentType : 'application/json',
				success : function(res) {
					if(res.result == "success") {
						popup("bddprSuccess", 'alert', "투찰 접수 건이 취소 되었습니다.<br/>내가 취소한 투찰 건은 [마이페이지]<br/>확인 가능합니다. 감사합니다.");
					}else if(res.result == "fail") {
						popup("bddprAlert", 'alert', res.message);
					}
				},
				error : function(request, status, error) {
					popup("bddprAlert", 'alert', "오류가 발생하였습니다.");
				} 
			});
	}

	function popup(dataTarget, dataPopup, msg, callbackFunc){
		let dataId = '#' + dataTarget;
		if (dataPopup == 'modal') { // 일반 modal 
			$(dataId).addClass('active');
		} else if (dataPopup == 'bottomsheet') { // 주문 modal
			$(dataId).addClass('active');
		} else if (dataPopup == 'alert') { // alert modal
			$(dataId).find('.alert-con').html(msg);
			$(dataId).addClass('active');
		} else if (dataPopup == 'confirm') { // confirm modal
			$(dataId).find('.alert-con').html(msg);
			$(dataId).addClass('active');
		}

		$(dataId).find(".modal-ok").off('click').on('click', function(e){       
			if(typeof callbackFunc != 'undefined' && callbackFunc){
				if(typeof callbackFunc == 'function'){
					if(callbackFunc() == true) {
						$(dataId).closest('.popup').removeClass('active');
					}
				}
			}
		});
	}
	</script>
</body>
</html>