<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매입찰시스템 | SORIN e-Commerce</title>
<link rel="shortcut icon" href="/guide/images/favicon.ico">
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
				<!-- main visual :: START -->
				<div class="main-visual">
					<div class="inwrap">
						<!-- main visual > left :: START -->
						<div>
		                    <p class="banner_st">서린닷컴 입찰 회원 전용</p>
		                    <h2 class="banner_tt">구매입찰 시스템</h2>
		                    <p class="banner_ft">공고 확인부터 투찰, 낙찰까지 스마트하게 참여하세요.</p>
		                    <div class="btn_cont left">
		                        <a class="btn" href="#">서비스 소개</a>
		                        <a class="btn" href="#">매뉴얼 보기</a>
		                    </div>
		                </div>
		                <!-- main visual > left :: END -->
		                <!-- main visual > right :: START -->
		              <c:choose>
		                	<c:when test="${loginYn eq 'N'}">
		                		<div class="login_container">
				                   <p>서린닷컴에 오신것을 환영합니다.</p>
				                   <input id="inputLoginId" type="text" placeholder="아이디 입력" maxlength="13">
				                   <input id="inputLoginPwd" type="password" placeholder="패스워드 입력" maxlength="13">
				                   <a id="loginSubmitBtn" class="btn primary_bg">로그인 하기</a>

				                   <!-- 미구현 (아이디 저장, 아이디찾기, 비밀번호찾기)
				                   <div class="sub_area">
				                       <div class="checkbox-container">
				                           <label class="checkbox-label" for="save_id">
				                               <input type="checkbox" name="save_id" id="save_id" value="">
				                               <span class="checkbox-custom rectangular"></span>
				                           </label>
				                           <div class="input-title">아이디 저장</div>
				                       </div>
				                       <div>
				                           <a href="#">아이디찾기</a>
				                           <a href="#">비밀번호 찾기</a>
				                       </div>
				                   </div>
				                   -->
	<!-- 			                   <hr> -->
				                   <a href="/fo/member/create_1" class="btn text ico">
				                       <span class="material-symbols-outlined">
				                       person
				                       </span>
				                       <span>입찰 시스템 가입하기</span>
				                   </a>
				                </div>
		                	</c:when>
		                	<c:otherwise>
			                	<div class="login_container log_on">
				                   <a href="javascript:;" class="btn_nav"><span class="bold">${loginUser.userNm}</span>님 입찰현황</a>
								   <div class="dashboard">
								   	 <div class="item" data-tab="01">
								   	 	<a href="javascript:;">
									   	 	<h4>투찰건</h4>
									   	 	<p class="bid">${bidDashBoardList.bddprTotCnt}</p>							   	 	
								   	 	</a>
								   	 </div>
								   	 <div class="item" data-tab="02">
								   	 	<a href="javascript:;">							   	 
									   	 	<h4>낙찰건</h4>
									   	 	<p class="win">${bidDashBoardList.scsbidTotCnt}</p>
									   	</a> 	
								   	 </div>		
								   	 <div class="item" data-tab="03">
								   	 	<a href="javascript:;">							   	 
									   	 	<h4>패찰건</h4>
									   	 	<p class="lose">${bidDashBoardList.defeatTotCnt}</p>
									   	</a> 								   	 	
								   	 </div>		
								   	 <div class="item" data-tab="04">
								   	 	<a href="javascript:;">							   	 
									   	 	<h4>관심건</h4>
									   	 	<p id="intrstCnt">${bidIntrstCnt }</p>
									   	</a> 								   	 	
								   	 </div>							   	 						   	 					   	 
								   </div>
			               		</div>	
		                	</c:otherwise> 
		                </c:choose> 
					</div>
				</div>
				<!-- main visual :: END -->
				
				<!-- section #1 구매입찰 공고 LIST :: START -->
				<div class="section prod-list-wrap bid">
					<div class="inwrap">
			            <!-- ITEM TITLE :: START  -->
			            <h2 class="h2-new">알루미늄</h2>
			            <!-- ITEM TITLE :: END  -->
			            <!-- FILTER AREA :: START -->
			            <div class="filter_area">
			                <div class="opt">
			                    <label for="">검색조건</label>
			                    <select id="filter" class="filter">
			                      <option></option>
			                      <option value="01" selected>공고일</option>
			                      <option value="02">마감일</option>
			                    </select>
			                </div>
			                <div class="cal">
			                    <div class="datepicker-wrap">
			                        <input type="text" class="datepicker from center validate[required,custom[date]]" id="startDate" desc="날짜" placeholder="시작 일자" style="font-size: 1.4rem !important;" readonly>
			                    </div>
			                    <div class="tilde">~</div>
			                    <div class="datepicker-wrap">
			                        <input type="text" class="datepicker to center validate[required,custom[date]]" id="endDate" desc="날짜" placeholder="종료 일자" style="font-size: 1.4rem !important;" readonly>
			                    </div>
			                </div>
			                <div class="input-button-wrap">
			                    <label class="radio-btn active" id="periodBtn1"><input type="radio" name="periodBtn" value="" checked="checked"><span>전체</span></label>
			                    <label class="radio-btn" id="periodBtn2"><input type="radio" name="periodBtn" value="1"><span>1개월</span></label>
			                    <label class="radio-btn" id="periodBtn3"><input type="radio" name="periodBtn" value="3"><span>3개월</span></label>
			                    <label class="radio-btn" id="periodBtn4"><input type="radio" name="periodBtn" value="6"><span>6개월</span></label>
			                </div>
			            </div>
			            <!-- main visual > right :: END -->
			            <!-- FILTER AREA :: END -->
			            <!-- TAB BUTTON :: START :: todo: 탭기능 example 추가 -->
			            <ul class="tab_btn_group">
			                <li class="item on" data-value="" >
			                    <a href="javascript:;">전체 (<span id="totalCnt"></span>)</a>
			                </li>
			                <li class="item" data-value="12">
			                    <a href="javascript:;">입찰예정 (<span id="exceptCnt"></span>)</a>
			                </li>
			                <li class="item" data-value="13">
			                    <a href="javascript:;">투찰중 (<span id="bddprCnt"></span>)</a>
			                </li>
			                <li class="item" data-value="30">
			                    <a href="javascript:;">마감 (<span id="endCnt"></span>)</a>
			                </li>
			            </ul>
			            <!-- TAB BUTTON :: END -->
			            <div id="tab-1" class="tab-content on">
			                <div class="tit_cont">
			                    <h2 class="h3-new" id="tab-value"></h2>
			                    <div class="opt_group">
			                        <div class="opt_item">
			                            <label for="brand">브랜드</label>
			                            <select name="" id="brand" class="brand">
			                                <option value="">브랜드(전체)</option>
			                                <c:forEach var="list" items="${brandGroupList}">
			                                	<option value="${list.subCode }">${list.codeDcone }</option>
			                                </c:forEach>
			                            </select>
			                        </div>
			                        <div class="opt_item">
			                            <label for="">권역</label>
			                            <select name="" id="area" class="area">
			                                <option value="">권역(전체)</option>
			                                <c:forEach var="list" items="${dstrctLclsfList}">
			                                	<option value="${list.subCode }">${list.codeNm }</option>
			                                </c:forEach>
			                            </select>
			                        </div>
			                    </div>
			                </div>
			                <ul class="list t2" id="bdDiv">
			                  
			                </ul>
			            </div>
					</div>

			    <!-- 공지사항 & FAQ :: START -->
			    <div class="section notice-wrap type2">
			        <div class="inwrap">
			            <!-- 공지사항 :: START -->
			            <div class="notice-area type2">
			                <div class="tit">
			                    <h5>공지사항</h5>
			                    <a href="/guide/html/bid/SOREC-SC-BID-026.html" class="more">더보기</a>
			                </div>
			                <ul class="cont">
			                    <li><a href="#">서린닷컴에서 구매입찰 시스템을 런칭하였습니다.</a></li>
			                    <li><a href="#">서린닷컴 10월 19일 긴급점검 안내</a></li>
			                    <li><a href="#">8월 29일 휴무 안내 -SUMMER BANK HOLIDAY</a></li>
			                    <li><a href="#">부산 지역 VEDANTA / HINDALCO AD 비서구산 입고</a></li>
			                </ul>
			            </div>
			            <!-- 공지사항 :: END -->
			            <!-- FAQ :: START -->
			            <div class="faq">
			                <div class="tit">
			                    <h5>자주하는 질문</h5>
			                    <a href="/guide/html/bid/SOREC-SC-BID-025.html" class="more">더보기</a>
			                </div>
			                <ul class="cont">
			                    <li><a href="#">구매입찰 시스템이란?</a></li>
			                    <li><a href="#">구매입찰 시스템 참여자격 안내</a></li>
			                    <li><a href="#">7월부터 로그인 후 실시간 가격 및 차트를 확인 가능</a></li>
			                    <li><a href="#">서린닷컴 기업회원 가입 절차 안내</a></li>
			                </ul>
			            </div>
			            <!-- FAQ :: END -->
			        </div>
			    </div>
			    <!-- 공지사항 & FAQ :: END -->

			    <!-- 서비스 소개 :: START -->
			    <div class="section services-wrap type2">
		            <div class="inwrap">
		                <div class="intro">
		                    <a href="#" class="wrap">
		                        <div class="cont">
		                            <h5>서비스 소개</h5>
		                            <p>스마트한 입찰시스템을 소개합니다.</p>
		                        </div>
		                        <div class="arrow next"></div>
		                    </a>
		                    <a href="#" class="wrap">
		                        <div class="cont">
		                            <h5>매뉴얼 보기</h5>
		                            <p>입찰 참여 과정을 알아보세요.</p>
		                        </div>
		                        <div class="arrow next">
		                        </div>
		                    </a>
		                </div>
		                <div class="estimate">
		                    <div class="services-con">
		                        <h2 class="h2">견적문의 및 상담</h2>
		                        <p class="cs-number"><span>02</span><span>6952</span><span>5095</span></p>
		                        <p class="cs-email"><a href="mailto:webmasters@metalsorin.com">webmasters@metalsorin.com</a></p>
		                        <p class="cs-p">평일 : 09:00~17:00<br>
		                                        점심 : 12:30~13:30(주말/공휴일 휴무)</p>
		                    </div>
		                </div>
		            </div>
			    </div>
			    <!-- 서비스 소개 :: END -->


			</div>
			<!-- container :: END -->
		</div>
		<!-- body-main :: END -->
		
		<!-- 23.10.16 | footer include :: START -->
		<div class="footer bid"></div>
        <script type="text/javascript"> $(".footer.bid").load("/guide/html/bid/include/footer.html");</script>
        <!-- // 23.10.16 | footer include :: END -->
        
    </div>
    </div>
    <!-- wrapper :: END -->

<!-- script custom :: START -->
<!-- <script src="/guide/js/common.js"></script> -->
<script src="/guide/js/sorin.js"></script>
<!-- <script src="/guide/js/sorin-ma.js"></script>main js -->
<!-- script custom :: END -->
<script>
var loginYn = "${loginYn}";
var bidEntrpsNo = "${bidEntrpsNo}";

$(function(){
	

	// =============== SELECT BOX ==================
	$('.brand').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    placeholder: '브랜드(전체)',
	    selectOnClose: true
	});
	$('.area').select2({
	    width: 'element',
	    minimumResultsForSearch: Infinity,
	    placeholder: '권역',
	    selectOnClose: true
	});
	$('.filter').select2({
	    width: 'element',
	    placeholder: '공고일',
	    minimumResultsForSearch: Infinity,
	    selectOnClose: true
	});
	
	
	//리스트 조회
	selectBdList(-1);
})
	
	$("#filter, #brand, #area").change(function(){
		//리스트 조회
		selectBdList(-1);
	})
	

	// =============== TAB ==================
	$('.tab_btn_group li').click(function(e){
	    var tabSttus = $(this).attr('data-value');
	    $('.tab_btn_group li').removeClass('on');
	    $(this).addClass('on');
	    
	  	//리스트 조회
	    selectBdList(tabSttus);
	})

	// =============== BTN.LIKE ==================
	$(document).on('click', ".ico.like", function(e) {
		if(loginYn == 'N'){
			alert("로그인이 필요한 화면입니다.");
			return;
		}
		
		var bidPblancId = $(this).attr('data-bid-id');
		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo
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
	 				$("#intrstCnt").text(parseInt($("#intrstCnt").text()) + 1);
	 				
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
	 				likeBtn.removeClass('active');
	 				$("#intrstCnt").text(parseInt($("#intrstCnt").text()) - 1);
	 			},
	 			error : function(request, status, error) {
	 				console.log("error")
	 			} 
	 		});
	 	}
	  
	    
	})

	
	// =============== DATEPICKER ==================
	$(".datepicker").change(function(){
		$(".radio-btn").each(function(){
			$(this).removeClass("active");
		});

		if($("#startDate").val() >= $("#endDate").val() && $("#endDate").val() != ""){
			$(this).val("");
		}
	
		//리스트 조회
		selectBdList(-1);
	})
	
	$('input[name="periodBtn"]').click(function(){
		$(".radio-btn").each(function(){
			$(this).removeClass('active');
		})
		$(this).parent().addClass('active');
		
		fnSetDate($(this).val());
		
		//리스트 조회
		selectBdList(-1);
	})
	
	function fnSetDate(period){
		
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0'+ (today.getMonth() + 1)).slice(-2);
		var day = ('0'+today.getDate()).slice(-2);
		
		var d1 = new Date();
		var d2 = year + '-' + month + '-' + day;
		
		switch (period){
		case '':
			$("#startDate").val('');
			$("#endDate").val('');
			break;
		case '1':
			d1 = new Date(year, today.getMonth() - 1, today.getDate());
			dateFormat(d1, d2)
			break;
		case '3':
			d1 = new Date(year, today.getMonth() - 3, today.getDate());
			dateFormat(d1, d2)
			break;
		case '6':
			d1 = new Date(year, today.getMonth() - 6, today.getDate());
			dateFormat(d1, d2)
			break;
		}
		
	}
	
	function dateFormat(d1, d2){
		var year = d1.getFullYear();
		var month = ('0'+ (d1.getMonth() + 1)).slice(-2);
		var day = ('0'+d1.getDate()).slice(-2);
		d1 = year + '-' + month + '-' + day;
		$('#startDate').val(d1);
		$('#endDate').val(d2);
	}
	
	
	// =============== 목록 조회 ==================
	function selectBdList(bidSttusCode){
	
		if(bidSttusCode == -1){
			bidSttusCode = $("li[class='item on']").attr('data-value');
		}
	
		var params = {
			"bidSttusCode" : bidSttusCode,
			"filter" : $("#filter").val(), 
			"startDate" : $("#startDate").val().replaceAll("-", ""),
			"endDate" : $("#endDate").val().replaceAll("-", ""),
			"brandGroupCode" : $("#brand").val(),
			"dstrctLclsfCode" : $("#area").val(),
			"bidEntrpsNo" : bidEntrpsNo,
			"loginYn" : loginYn
		}
		console.log(params)
		
		$.ajax({
			type : 'post',
			url : '/fo/selectBidList',
			dataType : 'json',
			data : JSON.stringify(params),
			contentType : 'application/json',
			success : function(res) {
				console.log(res)
				selectBdListGrid(res);
			},
			error : function(request, status, error) {
				console.log("error")
			} 
		});
		
		
	}
	
	
	function selectBdListGrid(res){
		$("#totalCnt").text(res.totalCnt);
		$("#exceptCnt").text(res.exceptCnt);
		$("#bddprCnt").text(res.bddprCnt);
		$("#endCnt").text(res.endCnt);
		
		$("#bdDiv").empty();
		var html = '';
		for(let i=0; i<res.bidList.length;i++){
			html +=	'	<li>';
			if(res.bidList[i].bidSttusCode == '30' || res.bidList[i].bidSttusCode == '31' || res.bidList[i].bidSttusCode == '32'){
				html += '       <div class="cart-item-wrap type4 finish">';
			}else{
				html += '       <div class="cart-item-wrap type4">';	
			}
			html += '           <figure class="figure figure1">';
			html += '               <img src="'+res.bidList[i].pcImageOneCours+'" alt="알루미늄" class="w">';
			html += '           </figure>';
			html += '           <div class="figure-con">';
			html += '               <div class="pd-brand-info">';
			html += '               	<h3 class="pd-bid-no">'+res.bidList[i].bidPblancId+'</h3>';
			html += '                   <div class="pd-wrap">';
			html += '                       <div class="pd-brand">';
			html += '                           <div class="pd-label">AL</div>';
			html += '                           <div class="brand-nation">';
			html += '                               <img src="'+res.bidList[i].nationUrl+'">';
			html += '                           </div>';
			html += '                           '+res.bidList[i].brandCode;
			html += '                       </div>';
			html += '                       <div class="pd-like">';
			html += '                           <ul class="company">';
			html += '                               <li>';
			html += '                                   <span>참여기업</span>';
			html += '                                   <span>'+res.bidList[i].partcptnEntrpsQy+'</span>';
			html += '                               </li>';
			html += '                               <li>';
			html += '                                   <span>관심기업</span>';
			html += '                                   <span>'+res.bidList[i].intrstEntrpsQy+'</span>';
			html += '                               </li>';
			html += '                           </ul>';
			if(loginYn == 'Y'){
				if(res.bidList[i].intrstAt == 'N'){
					html += '                           <a href="javascript:;" class="ico like active" data-bid-id="'+res.bidList[i].bidPblancId+'">'
				}else{
					html += '                           <a href="javascript:;" class="ico like" data-bid-id="'+res.bidList[i].bidPblancId+'">'	
				}
				html += '                               <span class="material-symbols-outlined">favorite</span>';
				html += '                               <span>관심추가</span>';
				html += '                           </a>';	
			}else{
				html += '                           <a href="javascript:;" class="ico like">'
				html += '                               <span class="material-symbols-outlined">favorite</span>';
				html += '                               <span>관심추가</span>';
				html += '                           </a>';	
			}
			html += '                       </div>';
			html += '                   </div>';
			html += '                   <div class="pd-name">';
			html += '                       <span class="item">'+res.bidList[i].dspyGoodsNm+'</span>';
			html += '                       <span class="wrhous">출고권역 - '+res.bidList[i].dstrctLclsfCodeNm+'</span>';
			html += '                       <span class="brand-group">'+res.bidList[i].brandGroupCodeNm+'</span>';
			html += '                   </div>';
			html += '                   <div class="pd-period">';
			html += '                   	<span class="qty">수량 <span class="highlight">'+res.bidList[i].bidWt+'MT</span></span>';	
			html += '                       <span class="date">투찰기간 <span class="highlight">'+ res.bidList[i].bddprBeginDt +' ~ '+ res.bidList[i].bddprBeginDt+'</span></span>';
			//html += '                       <span class="date">투찰기간 <span class="highlight">'+ viewDateFmt(res.bidList[i].bddprBeginDt) +' ~ '+ viewDateFmt(res.bidList[i].bddprBeginDt)+'</span></span>'; 
			if(res.bidList[i].bidSttusCode == '12' || res.bidList[i].bidSttusCode == '13'){
				html += '                       <span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>';
			}
			html += '                   </div>';
			html += '               </div>';
			html += '           </div>';
			if(res.bidList[i].bidSttusCode == '12' ){
				html += '           <div class="btns">';
				html += '               <a href="javascript:;" class="btn-bid-stroke" name="bidDetail" data-bid-id="'+res.bidList[i].bidPblancId+'">입찰예정</a>';
				html += '           </div>';
				html += '           <span class="bid-d-day abs-info">';
				html += '       		투찰 시작까지 <span class="time"></span>';
				html += '       	</span>';
			}else if(res.bidList[i].bidSttusCode == '13' ){
				html += '           <div class="btns">';
				html += '               <a href="javascript:;" class="btn-bid-blue" name="bidDetail" data-bid-id="'+res.bidList[i].bidPblancId+'">투찰중</a>';
				html += '           </div>';
				html += '           <span class="bid-d-day abs-info">';
				html += '       		투찰 마감까지 <span class="time">- 3일 3시간 20분 36초</span>';
				html += '       	</span>';
			}else if(res.bidList[i].bidSttusCode == '30' || res.bidList[i].bidSttusCode == '31' || res.bidList[i].bidSttusCode == '32' ){
				html += '           <div class="btns">';
				html += '               <a href="javascript:;" class="btn-bid-black" name="bidDetail" data-bid-id="'+res.bidList[i].bidPblancId+'">마감</a>';
				html += '           </div>';
				if(res.bidList[i].bidSttusCode == '30' ){
					html += '           <span class="t-info abs-info">기한마감</span>';
				}else if(res.bidList[i].bidSttusCode == '32' ){
					html += '           <span class="t-info abs-info">유찰공고</span>';
				}
			}
			html += '       </div>';
			html += '   </li>';
				
		}
		$("#bdDiv").append(html)
		
    
		if(res.bidList.length == 0){	
			$("#bdDiv").append("<div class='no-data empty-content'>데이터가 존재하지 않습니다.</div>")
		}
		

		$("#tab-value").empty();
		$("#tab-value").text($("li[class='item on']").text());
		
	}
	

	
	
	$(document).on('click', "a[name='bidDetail']", function(e) {
 		if(loginYn == 'N'){
			alert("로그인이 필요한 화면입니다.");
			return;
		}
		
		var bidPblancId = $(this).attr('data-bid-id');
		var params = {"bidPblancId" : bidPblancId};
		/*		
		location.href="/fo/mypage?bidPblancId="+bidPblancId;
 */ 		
/* 		$.ajax({
			type : 'post',
			url : '/fo/mypage',
			dataType : 'json',
			data : JSON.stringify(params),
			contentType : 'application/json',
			success : function(res) {
				console.log(res)
				 location.href="/fo/selectMypage";
			},
			error : function(request, status, error) {
				console.log("error")
			} 
		}); */
	    
	})
	
	function viewDateFmt(date){
		return date.substring(2,4)+"."+date.substring(4,6)+"."+date.substring(6,8)+" "+date.substring(8,10)+":"+date.substring(10,12)+":"+date.substring(12,14);
	}
	
	//대쉬보드 클릭 시 마이페이지 공고 및 관심목록 이동
	$(".dashboard .item, .btn_nav").click(function(){
		var tabCode = $(this).attr("data-tab");
		if(tabCode == '04'){
			location.href="/fo/intrstList?bidEntrpsNo="+bidEntrpsNo;
		}else{
			location.href="/fo/mypage?bidEntrpsNo="+bidEntrpsNo+"&tabCode="+tabCode;	
		}
	})

	$("#inputLoginId, #inputLoginPwd").on('keydown',function(e){
	    if(e.code == 'Enter'){
	        $("#loginSubmitBtn").click();
	    }
	});

	$('#loginSubmitBtn').on('click',function (){
	    var loginForm = {
	        userId: $('#inputLoginId').val(),
	        userPwd: $('#inputLoginPwd').val()
	    };

	    $.ajax({
	        url: '/fo/member/login',
	        data: JSON.stringify(loginForm),
	        type: 'POST',
	        contentType: 'application/json',
	        success: function(response){
	            alert(response.message);
                if(response.success){
                    location.href="/fo/bid";
                }
	        },
	        error: function(error){
                console.log(error);
	        }
	    });
	});
	
	
	
</script>
</body>
</html>