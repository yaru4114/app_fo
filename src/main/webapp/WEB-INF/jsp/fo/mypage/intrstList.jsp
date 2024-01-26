<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 투찰내역 | SORIN e-Commerce</title>
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
        <script type="text/javascript"> $(".header.bid").load("/fo/header");</script>
        <!-- // 23.10.16 | header include -->
        
		<!-- body-main :: START -->
		<div class="body-main">
			<!-- container :: START -->
			<div class="container mypage-list">
				<!-- section #1 구매입찰 공고 LIST :: START -->
				<div class="section prod-list-wrap bid">
					<div class="inwrap bi">
			        	<!-- LEFT WING :: START -->
			        	<div class="left-wing">
			        		<ul>
			        			<li class="item" data-tab="nav-1"><a href="javascript:;">투찰 목록</a></li>
			        			<li class="item active" data-tab="nav-2"><a href="javascript:;">관심 공고</a></li>
			        		</ul>
			        	</div>
			        	<!-- LEFT WING :: END -->
			        	<!-- 2. 관심 공고(#NAV-2) :: START -->
                        <div id="nav-2" class="right on">
			                <div class="hgroup">
			                    <div>
			                        <h2 class="h2">관심 공고</h2>
			                    </div>
			                </div>
				            <div class="tab-content type2 mt20">
				                <div class="tab-content-top flex-ac-jfs">
						            <div class="all">
										All <span class="fc-red" id="intrstCnt"></span>개
						            </div>
				                </div>
				                <ul class="list t2" id="intrstDiv">
					                
				                </ul>
				                <%-- <c:choose>
				                	<c:when test="${empty bidIntrstList}">
										<div class="no-data empty-content">관심 목록에 추가한 내역이 없습니다.</div>
										<div class="btn-wrap">
											<button type="button" class="btn-blue-big btn-main" onclick="moveToMain()">입찰 공고 화면 가기</button>
										</div>
				                	</c:when>
				                	<c:otherwise>
				                		<ul class="list t2">
				                		<c:forEach var="list" items="${bidIntrstList }">
				                			<li>
					                			<div class="cart-item-wrap type3 <c:if test="${list.bidSttusCode == '30' || list.bidSttusCode == '31' || res.bidList[i].bidSttusCode == '32'}">finish</c:if>">
					                            <figure class="figure figure1">
					                                <img src="${list.pcImageOneCours }" alt="" class="w">
					                            </figure>
					                            <div class="figure-con">
					                                <div class="pd-brand-info">
					                                	<h3 class="pd-bid-no">${list.bidPblancId }</h3>
					                                    <div class="pd-wrap">
					                                        <div class="pd-brand">
					                                            <div class="pd-label">${list.metalCodeNm }</div>
					                                            <div class="brand-nation">
					                                                <img src="${list.nationUrl }">
					                                            </div>
					                                            ${list.brandCode }
					                                        </div>
					                                        <div class="pd-like">
					                                            <ul class="company">
					                                                <li>
					                                                    <span>참여기업</span>
					                                                    <span>${list.partcptnEntrpsQy }</span>
					                                                </li>
					                                                <li>
					                                                    <span>관심기업</span>
					                                                    <span>${list.intrstEntrpsQy }</span>
					                                                </li>
					                                            </ul>
					                                            <a href="javascript:;" class="ico like <c:if test="${list.deleteAt eq 'N'}">active</c:if>" data-bid-id="${list.bidPblancId }">
					                                                <span class="material-symbols-outlined">favorite</span>
					                                                <span class="tit">관심해제</span>
					                                                <span class="ico-txt">관심 해제합니다.</span>
					                                            </a>
				                                        	</div>
					                                    </div>
					                                    <div class="pd-name">
					                                        <span class="item">${list.dspyGoodsNm }</span>
					                                        <span class="wrhous">출고권역 - ${list.dstrctLclsfCodeNm }</span>
					                                        <span class="brand-group">${list.brandGroupCodeNm }</span>
					                                    </div>
					                                    <div class="pd-period">
						                                    <span class="qty">수량 <span class="highlight">${list.bidWt }MT</span></span>	
						                                    <span class="date">투찰기간 <span class="highlight">${list.bddprBeginDt } ~ ${list.bddprEndDt }
						                                    </span></span> 
						                                	<c:if test="${list.bidSttusCode eq '13'}">
						                                		<span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>
						                                	</c:if>
						                                </div>
					                                </div>
					                            </div>
					                            <div class="btns">
					                            	<c:if test="${list.bidSttusCode eq '12' }">
					                            		<a href="javascript:;" class="btn-bid-stroke">입찰예정</a>
					                            	</c:if>
					                            	<c:if test="${list.bidSttusCode eq '13' }">
					                            		<a href="javascript:;" class="btn-bid-blue">투찰중</a>
					                            	</c:if>
					                            	<c:if test="${list.bidSttusCode eq '30' || list.bidSttusCode eq '31' || list.bidSttusCode eq '32' }">
					                            		<a href="javascript:;" class="btn-bid-black">마감</a>
					                            	</c:if>
					                            </div>
					                            <c:if test="${list.bidSttusCode eq '12' || list.bidSttusCode eq '13' }">
					                            	<p class="bid-d-day pre abs-info">
					                        			투찰 마감까지 <span class="time" id="time${list.bidPblancId }" ></span>
					                        		</p>
					                        		<input type="hidden" id="${list.bidPblancId }" data-startDate="${list.bddprBeginDt }" data-endDate="${list.bddprEndDt }" data-sttus="${list.bidSttusCode }">
					                            </c:if>
							                </div>
							                </li>
						                </c:forEach>
						           		</ul>
				                	</c:otherwise>
				                </c:choose> --%>
				            </div>

                        </div>
                        <!-- // 2. 관심 공고(#NAV-2) :: END -->
                       
 					</div>
 				</div>
 			</div>
		</div>
		<!-- body-main :: END -->
		
		<!-- 23.10.16 | footer include :: START -->
		<div class="footer bid"></div>
        <script type="text/javascript"> $(".footer.bid").load("/guide/html/bid/include/footer.html");</script>
        <!-- // 23.10.16 | footer include :: END -->
        
    </div>
    <!-- wrapper :: END -->

    <!-- script custom :: START -->
	<script src="/guide/js/sorin.js"></script>
	<!-- script custom :: END -->
	<script>
	var bidEntrpsNo = "${bidEntrpsNo}";
	
	$(function(){
		selectMyIntrstList();
		
	})

	// =============== TAB ==================
	$('.tab_btn_group li').click(function(e){
	    e.preventDefault();
	    let tab_id = $(this).attr('data-tab');
	    $('.tab_btn_group li').removeClass('on');
	    $('.tab-content').removeClass('on');
	    $(this).addClass('on');
	    $("#"+tab_id).addClass('on');
	})

	// =============== LEFT WING NAV ==================
	$('.left-wing li').click(function(e){
	    let tab_id = $(this).attr('data-tab');
	    $('.left-wing ul li').removeClass('active');
	    $(this).addClass('active');

	    if(tab_id == 'nav-1'){
	    	location.href="/fo/mypage?bidEntrpsNo="+bidEntrpsNo;
	    }else{
	    	location.href="/fo/intrstList?bidEntrpsNo="+bidEntrpsNo
	    }
	    
	})

	// =============== BTN.LIKE ==================
	$(document).on('click', ".ico.like", function(e) {
		var bidPblancId = $(this).attr('data-bid-id');
		var params = {
				"bidPblancId" : bidPblancId,
				"bidEntrpsNo" : bidEntrpsNo
		};
		var likeBtn = $(this);

	 	if($(this).hasClass('active')){
 		 	$.ajax({
	 			type : 'post',
	 			url : '/fo/deleteIntrstPblanc',
	 			dataType : 'json',
	 			data : JSON.stringify(params),
	 			contentType : 'application/json',
	 			success : function(res) {
	 			
	 				likeBtn.parents("li").remove();
	 				$("#intrstCnt").text(parseInt($("#intrstCnt").text()) -1);
	 				if($(".intrstLi").length == 0){
	 					var html ='<div class="no-data empty-content" style="border-top:none";>관심 목록에 추가한 내역이 없습니다.</div>';
	 					html +='<div class="btn-wrap">';
	 					html +='	<button type="button" class="btn-blue-big btn-main" onclick="moveToMain()">입찰 공고 화면 가기</button>';
	 					html +='</div>';
	 					$("#intrstDiv").append(html);
	 				}
	 				//location.href="/fo/intrstList?bidEntrpsNo="+bidEntrpsNo;
	 			},
	 			error : function(request, status, error) {
	 				alert("오류가 발생했습니다")
	 				location.href="/fo/bid";
	 			} 
	 		});
	 	}
	  
	    
	})
	
	function setFmtDate(startDate, endDate, id, bidSttusCode){
		setTimeout(function(){$("#"+id).html(" ");} , 0);
		setInterval(function(){
			var now = new Date();
			var startFmtDate = new Date(viewDateFmt2(startDate));
			var endFmtDate = new Date(viewDateFmt2(endDate));

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
	
	function viewDateFmt(date){
		return date.substring(2,4)+"."+date.substring(4,6)+"."+date.substring(6,8)+" "+date.substring(8,10)+":"+date.substring(10,12)+":"+date.substring(12,14);
	}
	
	function viewDateFmt2(date){
		return date.substring(0,4)+"/"+date.substring(4,6)+"/"+date.substring(6,8)+" "+date.substring(8,10)+":"+date.substring(10,12)+":"+date.substring(12,14);
	}
	
	function selectMyIntrstList(){
		var params = {"bidEntrpsNo" : bidEntrpsNo}

		$.ajax({
			type : 'post',
			url : '/fo/selectIntrstList',
			dataType : 'json',
			data : JSON.stringify(params),
			contentType : 'application/json',
			success : function(res) {
				selectMyIntrstListGrid(res);
			},
			error : function(request, status, error) {
				console.log("error")
			} 
		});
		
		
	}
	
	function selectMyIntrstListGrid(res){
		$("#intrstCnt").text(res.bidIntrstCntList);
		$("#intrstDiv").empty();
		var html = '';
		for(let i=0; i<res.bidIntrstList.length;i++){
			html +=	'	<li class="intrstLi">';
			if(res.bidIntrstList[i].bidSttusCode == '30' || res.bidIntrstList[i].bidSttusCode == '31' || res.bidIntrstList[i].bidSttusCode == '32'){
				html += '       <div class="cart-item-wrap type3 finish">';
			}else{
				html += '       <div class="cart-item-wrap type3">';	
			}
			html += '           <figure class="figure figure1">';
			html += '               <img src="'+res.bidIntrstList[i].pcImageOneCours+'" alt="" class="w">';
			html += '           </figure>';
			html += '           <div class="figure-con">';
			html += '               <div class="pd-brand-info">';
			html += '               	<h3 class="pd-bid-no">'+res.bidIntrstList[i].bidPblancId+'</h3>';
			html += '                   <div class="pd-wrap">';
			html += '                       <div class="pd-brand">';
			html += '                           <div class="pd-label">'+res.bidIntrstList[i].metalCodeNm+'</div>';
			html += '                           <div class="brand-nation">';
			html += '                               <img src="'+res.bidIntrstList[i].nationUrl+'">';
			html += '                           </div>';
			html += '                           '+res.bidIntrstList[i].brandCode;
			html += '                       </div>';
			html += '            <div class="pd-like">';
			html += '                <ul class="company">';
			html += '                    <li>';
			html += '                        <span>참여기업</span>';
			html += '                    	 <span>'+res.bidIntrstList[i].partcptnEntrpsQy+'</span>';
			html += '                    </li>';
			html += '                    <li>';
			html += '                        <span>관심기업</span>';
			html += '                        <span>'+res.bidIntrstList[i].intrstEntrpsQy+'</span>';
			html += '                    </li>';
			html += '                </ul>';
			html += '	<a href="javascript:;" class="ico like active" data-bid-id="'+res.bidIntrstList[i].bidPblancId+'">';
            html += '                    <span class="material-symbols-outlined">favorite</span>';
            html += '                   <span class="tit">관심해제</span>';
            html += '                   <span class="ico-txt">관심 해제합니다.</span>';
            html += '                   </a>';
            html += '           		</div>';
			html += '                   </div>';
            html += '                   <div class="pd-name">';
			html += '                       <span class="item">'+res.bidIntrstList[i].dspyGoodsNm+'</span>';
			html += '                       <span class="wrhous">출고권역 - '+res.bidIntrstList[i].dstrctLclsfCodeNm+'</span>';
			html += '                       <span class="brand-group">'+res.bidIntrstList[i].brandGroupCodeNm+'</span>';
			html += '                   </div>';
			html += '                   <div class="pd-period">';
			html += '                   	<span class="qty">수량 <span class="highlight">'+addComma(res.bidIntrstList[i].bidWt)+'MT</span></span>';	
			html += '                       <span class="date">투찰기간 <span class="highlight">'+ viewDateFmt(res.bidIntrstList[i].bddprBeginDt) +' ~ '+viewDateFmt(res.bidIntrstList[i].bddprEndDt)+'</span></span>'; 
			if(res.bidIntrstList[i].bidSttusCode == '13'){
				html += '                       <span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>';
			}
			html += '                   </div>';
			html += '               </div>';
			html += '           </div>';
			html += ' 			<div class="btns">';
			if(res.bidIntrstList[i].bidSttusCode == '12'){
				html += '<a href="javascript:;" name="bidDetail" class="btn-bid-stroke" data-bid-id="'+res.bidIntrstList[i].bidPblancId+'">입찰예정</a>';
			}else if(res.bidIntrstList[i].bidSttusCode == '13'){
				html += '<a href="javascript:;" name="bidDetail" class="btn-bid-blue" data-bid-id="'+res.bidIntrstList[i].bidPblancId+'">투찰중</a>';
			}else if(res.bidIntrstList[i].bidSttusCode == '30' || res.bidIntrstList[i].bidSttusCode == '31' || res.bidIntrstList[i].bidSttusCode == '32'){
				html += '<a href="javascript:;" name="bidDetail" class="btn-bid-black" data-bddprAt="'+res.bidIntrstList[i].bddprAt+'" data-bid-id="'+res.bidIntrstList[i].bidPblancId+'">마감</a>';
			}
			html += ' 			</div>';
			if(res.bidIntrstList[i].bidSttusCode == '12' || res.bidIntrstList[i].bidSttusCode == '13'){
				html += '<p class="bid-d-day pre abs-info">';
				html += '투찰 마감까지 <span class="time" id="time'+res.bidIntrstList[i].bidPblancId+'" >'+setFmtDate(res.bidIntrstList[i].bddprBeginDt, res.bidIntrstList[i].bddprEndDt,"time"+res.bidIntrstList[i].bidPblancId ,res.bidIntrstList[i].bidSttusCode)+'</span>';
				html += '</p>';
			}
			html += '           </div>';
        	
		}
	
		$("#intrstDiv").append(html);
		
		if(res.bidIntrstList.length == 0){
			html +='<div class="no-data empty-content" style="border-top:none";>관심 목록에 추가한 내역이 없습니다.</div>';
			html +='<div class="btn-wrap">';
			html +='	<button type="button" class="btn-blue-big btn-main" onclick="moveToMain()">입찰 공고 화면 가기</button>';
			html +='</div>';
			$("#intrstDiv").append(html);
		}
		
	}
	
	$(document).on('click', "a[name='bidDetail']", function(e) {
		var bidPblancId = $(this).attr('data-bid-id');
		var bddprAt = $(this).attr('data-bddprAt');

		if(bddprAt == 'Y'){
			location.href="/fo/mypage?bidEntrpsNo="+bidEntrpsNo;
		}else if(bddprAt == undefined){
			location.href="/fo/bid/detail/"+bidPblancId;
		}else{
			alert("마감된 공고입니다");
		}
	    
	})
	
	
	function addComma(data) {
		return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function moveToMain(){
		location.href="/fo/bid";
	}
	</script>
</body>
</html>