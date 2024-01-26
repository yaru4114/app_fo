<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!--
        <script type="text/javascript"> $(".header.bid").load("/guide/html/bid/include/header.html");</script>
        -->
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
			        			<li class="item active" data-tab="nav-1"><a href="javascript:;">투찰 목록</a></li>
			        			<li class="item" data-tab="nav-2"><a href="javascript:;">관심 공고</a></li>
			        		</ul>
			        	</div>
			        	<!-- LEFT WING :: END -->
			        	<!-- 1. 투찰 목록(#NAV-1) :: START {-->
                        <div id="nav-1" class="right on">
			                <div class="hgroup">
			                    <div>
			                        <h2 class="h2">투찰 목록</h2>
			                    </div>
			                </div>
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
				                        <input type="text" class="datepicker from validate[required,custom[date]]" id="startDate" desc="날짜" placeholder="시작 일자" style="font-size: 1.4rem !important;" readonly>
				                    </div>
				                    <div class="tilde">~</div>
				                    <div class="datepicker-wrap">
				                        <input type="text" class="datepicker to validate[required,custom[date]]" id="endDate" desc="날짜" placeholder="종료 일자" style="font-size: 1.4rem !important;" readonly>
				                    </div>
				                </div>

				                <div class="input-button-wrap">
				                    <label class="radio-btn active" id="periodBtn"><input type="radio" value="" name="periodBtn" checked="checked"><span>전체</span></label>
				                    <label class="radio-btn" id="periodBtn"><input type="radio" value="1" name="periodBtn"><span>1개월</span></label>
				                    <label class="radio-btn" id="periodBtn"><input type="radio" value="3" name="periodBtn"><span>3개월</span></label>
				                    <label class="radio-btn" id="periodBtn"><input type="radio" value="6" name="periodBtn"><span>6개월</span></label>
				                </div>
				                <button class="btn-blue" onclick="selectBdMyList(-1)">조회</button>
				            </div>
							<!-- TAB BUTTON :: START -->
                            <ul class="tab_btn_group">
                                <li class="item on" id="tab-01" data-value="01" data-tab="01">
                                    <a href="#">투찰 건(<span id="bddprTotCnt"></span>)</a>
                                </li>
                                <li class="item" id="tab-02" data-value="02" data-tab="02">
                                    <a href="#">낙찰 건(<span id="scsbidTotCnt"></span>)</a>
                                </li>
                                <li class="item" id="tab-03" data-value="03" data-tab="03">
                                    <a href="#">패찰 건(<span id="defeatTotCnt"></span>)</a>
                                </li>
                                <li class="item" id="tab-04" data-value="04" data-tab="04">
                                    <a href="#">유찰 건(<span id="failTotCnt"></span>)</a>
                                </li>
                            </ul>
                            <!-- TAB BUTTON :: END -->
                            <div class="tab-content on">
                            	<div class="tab-content-top flex-ac-jfs">
						            <div class="all">
										All <span class="fc-red">2</span>개
						            </div>
					                <div class="custom_radio">
									  <input type="radio" id="featured-1" name="featuredGroup1" value="01" checked><label for="featured-1">전체</label>
									  <input type="radio" id="featured-2" name="featuredGroup1" value="02" ><label for="featured-2">투찰 중건</label>
									  <input type="radio" id="featured-3" name="featuredGroup1" value="03" ><label for="featured-3">투찰접수 취소건</label>
					                </div>
				                </div>
				                <ul class="list t2" id="bddprDiv">
				                </ul>
	                            <!-- <div class="btn-wrap">
		                        	<button type="button" class="btn-blue-big btn-list" onclick="location.href='/guide/html/bid/SOREC-SB-BID-001-2.html'">입찰 공고 화면 가기</button>
		                    	</div> -->
		                    </div>
                        </div>
                        <!-- // 1. 투찰 목록(#NAV-1) :: END -->
                        
			        
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
<!-- 	<script src="/guide/js/common.js"></script> -->
	<script src="/guide/js/sorin.js"></script>
<!-- 	<script src="/guide/js/sorin-ma.js"></script>main js -->
	<!-- script custom :: END -->
	<script>
	var bidEntrpsNo = "${bidEntrpsNo}"; 
	
	$(function(){
		var tabCode = "${tabCode}"

		if(tabCode == '02'){
			$("#tab-02").trigger("click");
			$(".custom_radio").hide();
		
		}else if(tabCode == '03'){
			$("#tab-03").trigger("click");
			$(".custom_radio").hide();
		
		}else{
			selectBdMyList('01','01');
		}
		
		// =============== SELECT BOX ==================
		$('.filter').select2({
		    width: 'element',
		    placeholder: '공고일',
		    minimumResultsForSearch: Infinity,
		    selectOnClose: true
		});
		$('#shippingAddr').select2({
		    width: 'element',
		    minimumResultsForSearch: Infinity,
		    selectOnClose: true
		});
		
	})
		
	$("#filter").change(function(){
		//리스트 조회
		selectBdMyList(-1);
	})
	

	// =============== TAB ==================
	$('.tab_btn_group li').click(function(e){
	    var pageCode = $(this).attr('data-tab');
	    var pageSubCode = pageCode == '01' ? '01' : '';
	    $('.tab_btn_group li').removeClass('on');
	    $(this).addClass('on');
	    
	    if(pageCode == '01' ){
	    	$("#featured-1").prop("checked",true);
	    	$(".custom_radio").show();
	    }else if(pageCode == '02' ){
	    	$(".custom_radio").hide();
	    }else if(pageCode == '03' ){
	    	$(".custom_radio").hide();
	    }else if(pageCode == '04' ){
	    	$(".custom_radio").hide();
	    } 
	    
	  	//리스트 조회
	    selectBdMyList(pageCode,pageSubCode);
	})
		
	// =============== LEFT WING NAV ==================
	$('.left-wing li').click(function(e){
	    e.preventDefault();
	    let tab_id = $(this).attr('data-tab');
	    $('.left-wing ul li').removeClass('active');
	    $(this).addClass('active');

	    if(tab_id == 'nav-1'){
	    	location.href="/fo/mypage?bidEntrpsNo="+bidEntrpsNo;
	    }else{
	    	location.href="/fo/intrstList?bidEntrpsNo="+bidEntrpsNo
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
			selectBdMyList(-1);
		})
		
		$('input[name="periodBtn"]').click(function(){
			$(".radio-btn").each(function(){
				$(this).removeClass('active');
			})
			$(this).parent().addClass('active');
			
			fnSetDate($(this).val());
			
			//리스트 조회
			selectBdMyList(-1);
		})
		
		$("input[name='featuredGroup1']").on('change', function(){
		    pageCode = "01";
		    pageSubCode = this.value; 
		    selectBdMyList(pageCode, pageSubCode);
		});
		
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
		function selectBdMyList(pageCode,pageSubCode){

			if(pageCode == -1){
				 pageCode = $("li[class='item on']").attr('data-tab');
			}
		
			var params = {
				//"bidSttusCode" : bidSttusCode,
				"filter" : $("#filter").val(), 
				"startDate" : $("#startDate").val().replaceAll("-", ""),
				"endDate" : $("#endDate").val().replaceAll("-", ""),
				"pageCode" : pageCode,
				"pageSubCode" : pageSubCode,
				"bidEntrpsNo" : bidEntrpsNo,
			}
			console.log(params)

			$.ajax({
				type : 'post',
				url : '/fo/selectBidBddprList',
				dataType : 'json',
				data : JSON.stringify(params),
				contentType : 'application/json',
				success : function(res) {
					selectBdMyListGrid(res, pageCode, pageSubCode);
				},
				error : function(request, status, error) {
					console.log("error")
				} 
			});
			
			
		}
		
		
		function selectBdMyListGrid(res, pageCode, pageSubCode){
			var tabNm = '';
 			$("#bddprTotCnt").text(res.bidBddprCntList.bddprAllTotCnt);
			$("#scsbidTotCnt").text(res.bidBddprCntList.scsbidTotCnt);
			$("#defeatTotCnt").text(res.bidBddprCntList.defeatTotCnt);
			$("#failTotCnt").text(res.bidBddprCntList.failTotCnt);

			if(pageCode == '01' ){
				if(pageSubCode == '02'){
					tabNm = "투찰 중"
					$(".fc-red").text(res.bidBddprCntList.bddprTotCnt);
				}else if(pageSubCode == '03'){
					tabNm = "투찰접수 취소"
					$(".fc-red").text(res.bidBddprCntList.bddprCanclTotCnt);
				}else{
					tabNm = "투찰"
					$(".fc-red").text(res.bidBddprCntList.bddprAllTotCnt);
				}
		    }else if(pageCode == '02' ){
		    	tabNm = "낙찰"
		    	$(".fc-red").text(res.bidBddprCntList.scsbidTotCnt);
		    }else if(pageCode == '03' ){
		    	tabNm = "패찰"
		    	$(".fc-red").text(res.bidBddprCntList.defeatTotCnt);	
		    }else if(pageCode == '04' ){
		    	tabNm = "유찰"
		    	$(".fc-red").text(res.bidBddprCntList.failTotCnt);
		    } 
			
			$("#bddprDiv").empty();
			var html = '';
			for(let i=0; i<res.bidBddprList.length;i++){
				html +=	'	<li>';
				if(res.bidBddprList[i].bidSttusCode == '30' || res.bidBddprList[i].bidSttusCode == '31' || res.bidBddprList[i].bidSttusCode == '32'){
					html += '       <div class="cart-item-wrap type3 finish">';
				}else{
					html += '       <div class="cart-item-wrap type3">';	
				}
				html += '           <figure class="figure figure1">';
				html += '               <img src="'+res.bidBddprList[i].pcImageOneCours+'" alt="" class="w">';
				html += '           </figure>';
				html += '           <div class="figure-con">';
				html += '               <div class="pd-brand-info">';
				html += '               	<h3 class="pd-bid-no">'+res.bidBddprList[i].bidPblancId+'</h3>';
				html += '                   <div class="pd-wrap">';
				html += '                       <div class="pd-brand">';
				html += '                           <div class="pd-label">'+res.bidBddprList[i].metalCodeNm+'</div>';
				html += '                           <div class="brand-nation">';
				html += '                               <img src="'+res.bidBddprList[i].nationUrl+'">';
				html += '                           </div>';
				html += '                           '+res.bidBddprList[i].brandCode;
				html += '                       </div>';
				html += '                   </div>';
				html += '                   <div class="pd-name">';
				html += '                       <span class="item">'+res.bidBddprList[i].dspyGoodsNm+'</span>';
				html += '                       <span class="wrhous">출고권역 - '+res.bidBddprList[i].dstrctLclsfCodeNm+'</span>';
				html += '                       <span class="brand-group">'+res.bidBddprList[i].brandGroupCodeNm+'</span>';
				html += '                   </div>';
				html += '                   <p class="pd-unit-price">';
				html += '                   	<span class="label-orange">투찰가</span>';	
				html += '						<span class="u-price realTimePrice up">'+addComma(res.bidBddprList[i].bddprWt)+'원/25MT</span>';
				html += '                   </p>';
				html += '                   <div class="pd-period">';
				html += '                   	<span class="qty">수량 <span class="highlight">'+addComma(res.bidBddprList[i].bidWt)+'MT</span></span>';	
				html += '                       <span class="date">투찰기간 <span class="highlight">'+ viewDateFmt(res.bidBddprList[i].bddprBeginDt) +' ~ '+viewDateFmt(res.bidBddprList[i].bddprEndDt)+'</span></span>'; 
				if(res.bidBddprList[i].bidSttusCode == '13'){
					html += '                       <span class="t-info">개찰결과 : 투찰 기한 마감과 동시에 발표함</span>';
				}
				html += '                   </div>';
				html += '               </div>';
				html += '           </div>';
				if(res.bidBddprList[i].bidSttusCode == '13' ){
					html += '           <div class="btns">';
					html += '               <a href="javascript:;" class="btn-bid-blue" name="bidDetail" data-bid-id="'+res.bidBddprList[i].bidPblancId+'">상세보기</a>';
					html += '           </div>';
					html += '           <span class="bid-d-day abs-info">';
					html += '       		투찰 마감까지 <span class="time" id="time'+res.bidBddprList[i].bidPblancId+'">'+setFmtDate(res.bidBddprList[i].bddprEndDt,"time"+res.bidBddprList[i].bidPblancId ,res.bidBddprList[i].bidSttusCode)+'</span>';
					html += '       	</span>';
				}else if(res.bidBddprList[i].bidSttusCode == '30' || res.bidBddprList[i].bidSttusCode == '31' || res.bidBddprList[i].bidSttusCode == '32' ){
					html += '           <div class="btns">';
					html += '               <a href="javascript:;" class="btn-bid-blue" name="bidDetail" data-bid-id="'+res.bidBddprList[i].bidPblancId+'">상세보기</a>';
					html += '           </div>';
					if(res.bidBddprList[i].bidSttusCode == '30' ){
						html += '           <span class="t-info abs-info">기한마감</span>';
					}else if(res.bidBddprList[i].bidSttusCode == '32' ){
						html += '           <span class="t-info abs-info">유찰공고</span>';
					}
				}
				html += '       </div>';
				html += '   </li>';
				html +=	'	</ul>';
					
			}
			$("#bddprDiv").append(html)
			
	    
		 	if(res.bidBddprList.length == 0){	
		 		$(".fc-red").text(0);
				html +='<div class="no-data empty-content" style="border-top:none;">참여한 '+tabNm+' 내역이 없습니다.</div>';
				html +='<div class="btn-wrap">';
				html +='	<button type="button" class="btn-blue-big btn-main" onclick="moveToMain()">입찰 공고 화면 가기</button>';
				html +='</div>';
				$("#bddprDiv").append(html);
				
			} 
			
			
		}
		
		$(document).on('click', "a[name='bidDetail']", function(e) {
			var bidPblancId = $(this).attr('data-bid-id');
			location.href="/fo/bid/detail/"+bidPblancId;
		})
		
		function viewDateFmt(date){
			return date.substring(2,4)+"."+date.substring(4,6)+"."+date.substring(6,8)+" "+date.substring(8,10)+":"+date.substring(10,12)+":"+date.substring(12,14);
		}
		
		function viewDateFmt2(date){
			return date.substring(0,4)+"/"+date.substring(4,6)+"/"+date.substring(6,8)+" "+date.substring(8,10)+":"+date.substring(10,12)+":"+date.substring(12,14);
		}
		
		function setFmtDate(endDate, id, bidSttusCode){
			setTimeout(function(){$("#"+id).html(" ");} , 0);
			setInterval(function(){
				var now = new Date();
				var endFmtDate = new Date(viewDateFmt2(endDate));

				if(bidSttusCode == "13" && endFmtDate >= now){
					$("#"+id).html(" - " + Math.floor((endFmtDate-now) / (1000*60*60*24)) +"일 "+Math.floor(((endFmtDate-now) / (1000*60*60)) % 24) +"시간 "
							+Math.floor(((endFmtDate-now) / (1000*60)) % 60) +"분 "+Math.floor((endFmtDate-now) / 1000 % 60) + "초");
				}else{
					$("#"+id).html("");    
				}
	        },1000); //1초마다 
	        
		}
		
		function addComma(data) {
			return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		function moveToMain(){
			 location.href="/fo/bid";
		}

	</script>
</body>
</html>