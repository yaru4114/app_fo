'use strict';
/********* MAIN */
$(function() {
	// 원자재 캘린더 데이터 조회
	let today = getToday();
	$("#eventMonth").html(today.substring(0, 4) + "년 " + parseInt(today.substring(4, 6)) + "월");
	$("#eventMonth").val(today.substring(0, 6));
	monthlyEvent($("#eventMonth").val(), today, true);

	// 메인배너 가져오기
	changeSwiperSlides('/getMainBanner', '', mainSwiperGrap);
	// 주요뉴스 가져오기
	getAjaxContent('/getMainNewsList', '', 'mainNewsList');
	// 메탈월드 월간지 가져오기
	changeSwiperSlides('/getMainMetalWorldList', '', metalWorldSwiper);
	// 최신뉴스 가져오기
	getAjaxContent('/getMainNewsClippingList', '', 'mainNewsClippingList');
	// 서린닷컴소개를 조회한다.
	// changeSwiperSlides('/getMainSorinIntroduce', '', mainSwiperSorin);
	// 서린상사/견적문의/협력사 소개를 조회한다.
	getAjaxContent('/getMainIntroduce', '', 'mainIntroduce');

});

///////////// 0.기본 설정(타이틀, 팝업, 소켓 등) ////////////////
// 오늘날짜 yyyyMMdd 형식으로 가져오기
function getToday() {
	let now = new Date();
	let year = now.getFullYear();
	let month = now.getMonth() + 1;
	month = month < 10 ? "0" + month : month;
	let date = now.getDate();
	date = date < 10 ? "0" + date : date;
	return '' + year + month + date;
}

//실시간 금속 가격 웹소켓 연결 => 사용하는 곳이 없음
function websocketOpenLoopPrice() {
	// setTimeout(function () {
	// 	if (stompClient.connected == true) {
	// 		// 초기 차트 데이터 호출
	// 		stompSubscribe(stompClient, "/realTimeSellPrice", function (receiveData) {
	// 			let result = stompReceiveMessage(receiveData);
	// 		});
	// 	} else {
	// 		websocketOpenLoop();
	// 	}
	// }, 100)
}

// 알림설정 팝업 : 희망가 알림 생성 내역, 원클릭 주문 알림
$('#sorinModalAlarm .toggle').off('click').on('click', function() {
	if ($(this).attr('data-value') == 'oneclick-order') {
		$('#sorinModalAlarm .tbl-oneclick').addClass('active');
	} else {
		$('#sorinModalAlarm .tbl-oneclick').removeClass('active');
	}
});
///////////// 0.기본 설정(타이틀, 팝업, 소켓 등) ////////////////

///////////// 헤더 설정 ////////////////

/* 23.01.04 | 고도화 3차: 현 서린몰(전 내수판매) > .gnb-depth2 좌측 간격 영역 제어 
//resize
$(window).off('resize').on('resize',function(){
	if($('.header-btm .gnb > ul > li.has-depth').length > 0) {
		let gnbDepth2LeftSpace = parseInt($('.header-btm .gnb > ul > li.has-depth').offset().left);
		let letterSpace = parseInt(gnbDepth2LeftSpace / 100);

		$('.gnb-depth2 > ul').css({'padding-left': gnbDepth2LeftSpace - letterSpace});
	}
});
*/
// 22.12 header 신규 > 로그인 회원 클릭시
$(document).off('click', '.login-user-info').on('click', '.login-user-info', function(e) {
	$('.toggle-box.active').not(this).removeClass('active');
	$(this).toggleClass('active');
});

// 22.12 header 신규 > 햄버거 메뉴 클릭시
$(document).off('click', '.login-btn').on('click', '.login-btn', function(e) {
	$('.toggle-box.active').not(this).removeClass('active');
	$(this).toggleClass('active');
});

// 22.12 header 신규 > toggle-box 이 외의 영역을 클릭 시
$('html').off('click').on('click', function(e) {

	//header- 알람 버튼
	if (!$('.toggle-box').has(e.target).length) {
		$('.login-user-info, .login-btn').removeClass('active');
	}
});

// 22.12 header 신규 >  회원상태 툴팁
$(document).off('click', '.btn-tooltip-close').on('click', '.btn-tooltip-close', function(e) {
	$('.member-state').fadeOut(300);
});
///////////// 헤더 설정 ////////////////

///////////// 1. 메인배너 ////////////////
// 메인 GRAB THE MOMENT Slider:: 23.06.23 신규생성
var mainSwiperGrap = new Swiper(".main-swiper", {
	slidesPerView: 1,
	effect: "fade",
	autoplay: {
		delay: 4000,
		disableOnInteration: false,
	},
	loop: true,
	initialSlide: 1,
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
		type: 'fraction'
	},
	on: {
		init: function() {
			// 정지 버튼 클릭시 슬라이더 멈춤
			$(".swiper-button-pause").click(function() {
				mainSwiperGrap.autoplay.stop();
				$('.player-btn').removeClass('on');
				$('.swiper-button-play').addClass('on');
			});

			// 재생 버튼 클릭시 슬라이더 재시작
			$(".swiper-button-play").click(function() {
				mainSwiperGrap.autoplay.start();
				$('.player-btn').removeClass('on');
				$('.swiper-button-pause').addClass('on');
			});

		}
		//init: grapSwiperHover,
		// slideChangeTransitionStart: grapSwiperBg,
	}
});


// main banner hover 일때 멈춤/시작
function grapSwiperHover() {
	$(".swiper-container").hover(function() {
		mainSwiperGrap.autoplay.stop();
	}, function() {
		mainSwiperGrap.autoplay.start();
	});
}

// main banner 배경색 변경
function grapSwiperBg() {
	let grapWrap = $('#mainGrapSwiperWrap');
	if ($('.swiper-slide.swiper-slide-active').hasClass('lme')) {
		grapWrap.attr('class', 'grap-wrap lme-on');
	} else if ($('.swiper-slide.swiper-slide-active').hasClass('pay')) {
		grapWrap.attr('class', 'grap-wrap pay-on');
	} else if ($('.swiper-slide.swiper-slide-active').hasClass('sinl')) {
		grapWrap.attr('class', 'grap-wrap sinl-on');
	} else if ($('.swiper-slide.swiper-slide-active').hasClass('newPayment')) {
		grapWrap.attr('class', 'grap-wrap payment-on');
	} else {
		return false;
	}
};

//메인배너 사용신청 버튼 함수
function saveLoanCnsltReqstInfo() {
	let params = {};

	sorin.ajax.postJSON("/fo/ev/loanCreditUse", JSON.stringify(params), true, function(result) {
		if (!sorin.validation.isNull(result)) {
			if (result.RESULT_CODE == "996") {
				//비로그인 > 로그인 페이지 이동
				confirmPopup(sorin.message.geti18nMsg("fo.mb.validation.login.status"), function() {
					pageMove('/account/login'); //회원 전용 서비스입니다. 로그인 후 이용하시겠습니까?
					return true;
				});
			}
			if (result.RESULT_CODE == "200") {
				//마스터회원 > 마이페이지 이동
				pageMove('/my/corpInfoMgr/selectCorpInfoMgr');
				return true;
			}
			if (result.RESULT_CODE == "998") {
				//멤버회원 > alert
				alertPopup("사용신청은 마스터 회원만 가능합니다. \n 마스터 계정으로 로그인해주세요.", function() {
					return true;
				});
			}
		}
	})
}

///////////// 2.차트- 가격 ////////////////
//차트 전광판 스와이퍼
var sumTitleSwiper = new Swiper('#sumTitleWrap', {
	direction: 'vertical',
	autoplay: {
      delay: 5000, // 시간 설정
      disableOnInteraction: false, // false-스와이프 후 자동 재생
    }, 
	loop: true,
	navigation: {  
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	}
});
///////////// 3.주요뉴스-메탈월드 ////////////////
//메탈월드
var metalWorldSwiper = new Swiper(".metal-world-swiper", {
	pagination: {
		// el: ".swiper-pagination",
		type: "fraction",
	},
	navigation: {
		nextEl: ".metal-world-next",
		prevEl: ".metal-world-prev",
	}
});
///////////// 3.주요뉴스-메탈월드 ////////////////

///////////// 4.최신뉴스-원자재 캘린더 ////////////////
//최신뉴스
$(document).off("click", ".materials-news .btn-all" ).on("click", ".materials-news .btn-all" , function() {
	//         console.log("원자재 뉴스클리핑 전체보기")
	// pageMove();
})

//원자재캘린더
$(document).off("click", ".materials-cal .btn-all" ).on("click", ".materials-cal .btn-all" , function() {
	//         console.log("원자재 캘린더 전체보기")
	// pageMove();
})

//원자재 캘린더 : 한달 + 오늘
$(document).off('click', '.cal-toggle button').on('click', '.cal-toggle button', function() {
	if ($(this).hasClass('active')) {
		return;
	} else {
		$(this).addClass('active').siblings().removeClass('active');
	}
	if ($(this).hasClass('btn-cal-month')) {
		$(this).parents('.cal-wrap').children('.cal-list').show().find('.li').show();
		$(this).parents('.cal-wrap').children('.cal-list').find('.li.today').hide();
		$(this).parents('.cal-wrap').children('.cal-holiday').hide();
		//$(this).parents('.cal-wrap').children('.cal-list').find('.li').show().removeAttr('style');
	}
	if ($(this).hasClass('btn-cal-today')) {
		$(this).parents('.cal-wrap').children('.cal-list').show().find('.li.today').show();
		$(this).parents('.cal-wrap').children('.cal-list').find('.li:not(.today)').hide();
		$(this).parents('.cal-wrap').children('.cal-holiday').hide();
	}
	if ($(this).hasClass('btn-cal-holiday')) {
		$(this).parents('.cal-wrap').children('.cal-holiday').show();
		$(this).parents('.cal-wrap').children('.cal-list').hide();
	}
});

// 원자재캘린더 조회 함수
function monthlyEvent(month, today, flag) { // 해당월 이벤트 조회
	let today2 = new Date();
	let year = today2.getFullYear();
	let mon = ('0' + (today2.getMonth() + 1)).slice(-2);
	let day = ('0' + today2.getDate()).slice(-2);
	let dateString = year + '' + mon + '' + day;
	let addClass = true;

	$(".cal-list > .li:not(.today)").remove();
	$(".today").remove();
	sorin.ajax.getSetDataType("/main/monthly-event", {
		"month": month
	}, '', true, function(monthlyEventList) {
		for (let item of monthlyEventList) {
			let li = $("<div class=li></div>");

			let liDate = $("<span class='date'><span>");
			let beginDt = item.applcBeginDe;
			let endDt = item.applcEndDe;

			if (addClass) {
				if ((beginDt <= dateString) && (dateString <= endDt)) {
					li.addClass('today');	//20220331 이현진 CSS추가
					li.addClass('default');
					//                     	addClass = false;
					addClass = true;
				}//end if()
			}//end if()


			let now = new Date();
			let lastDate = new Date(now.getFullYear(), now.getMonth() + 1, 0);
			lastDate = "" + lastDate.getFullYear() + (lastDate.getMonth() + 1 < 10 ? "0" + (lastDate.getMonth() + 1) : lastDate.getMonth() + 1) + lastDate.getDate();

			//적용 시작 일자, 적용 종료 일자
			if (beginDt == endDt || endDt == month + "01") { // 끝나는날이 첫날
				liDate.append(parseInt(endDt.substring(6)) + "일");
			}
			else if (beginDt == lastDate) { // 시작하는날이 마지막날
				liDate.append(parseInt(beginDt.substring(6)) + "일");
			}
			else { // 그외
				if (beginDt.substring(0, 6) == month) {
					liDate.append(parseInt(beginDt.substring(6)) + "~");
				}
				else {
					liDate.append("1~");
				}
				if (endDt.substring(0, 6) == month) {
					liDate.append(parseInt(endDt.substring(6)) + "일");
				}
				else {
					liDate.append(new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate() + "일");
				}
			}

			//이벤트 휴일 명칭
			let liSchedule = $("<span class='schedule'><span>");
			liSchedule.append(item.eventRestdeNm);

			if (!sorin.validation.isEmpty(item.nationImageUrl)) {
				//국가 이미지
				let nationImageUrl = $("<span class='img-nation'><img src=" + item.nationImageUrl + "></span>");

				//국가 이미지 + 이벤트 휴일 명칭
				liSchedule.prepend(nationImageUrl);
			}//end if()

			//적용일자 + (국가 이미지 + 이벤트 휴일 명칭)
			li.append(liDate).append(liSchedule);

			if (flag && today >= beginDt && today <= endDt) {
				let liToday = li.clone();
				liToday.addClass('today');
				//$(".cal-list").append(liToday);
			}
			$(".cal-list").append(li);
		}//for

		if ($(".btn-cal-month").hasClass('active')) {
			//                 $(".li.today").hide();
		}
		else {
			$(".li:not(.today)").hide();
		}

		if ($(".li").hasClass('default')) {	//20220331 이현진 스크롤 포커싱 조건 추가
			let position1 = $('.cal-list').offset().top;
			let position2 = $('.default').offset().top;

			$('.cal-list').scrollTop(position2 - position1);
		} else {

		}

	});

}

// 원자재캘린더 휴일 버튼 클릭 이벤트
$("#btnLoadHoliday").click(function() {
	let year = $("#eventMonth").val().substring(0, 4);
	let month = $("#eventMonth").val().substring(4, 6);
	$('#datepicker2').datepicker("setDate", new Date(year, month - 1, 1));
});

// 원자재캘린더 한달 버튼 클릭 이벤트
$("#btnLoadMaterialNews").click(function() {
	let year = $("#eventMonth").val().substring(0, 4);
	let month = $("#eventMonth").val().substring(4, 6);
	monthlyEvent($("#eventMonth").val(), getToday(), false);
});

// 원자재캘린더 이전달 버튼 클릭 이벤트
$(".btn-cal-prev").click(function() { // 이전월로 이동
	let year = $("#eventMonth").val().substring(0, 4);
	let month = $("#eventMonth").val().substring(4, 6);
	if (--month < 1) {
		month = 12;
		year--;
	}
	$("#eventMonth").html(year + "년 " + month + "월");
	$("#eventMonth").val("" + year + (month < 10 ? "0" + month : month));

	if ($(".btn-cal-holiday").hasClass('active')) {
		$('#datepicker2').datepicker("setDate", new Date(year, month - 1, 1));
	} else {
		monthlyEvent($("#eventMonth").val(), getToday(), false);
	}

});

// 원자재캘린더 다음달 버튼 클릭 이벤트
$(".btn-cal-next").click(function() { // 다음월로 이동
	let year = $("#eventMonth").val().substring(0, 4);
	let month = $("#eventMonth").val().substring(4, 6);
	if (++month > 12) {
		month = 1;
		year++;
	}
	$("#eventMonth").html(year + "년 " + month + "월");
	$("#eventMonth").val("" + year + (month < 10 ? "0" + month : month));

	if ($(".btn-cal-holiday").hasClass('active')) {
		$('#datepicker2').datepicker("setDate", new Date(year, month - 1, 1));
	} else {
		monthlyEvent($("#eventMonth").val(), getToday(), false);
	}

});

var holidayDays = [];

// 원자재캘린더 달력 만들기
$("#datepicker2").datepicker({
	dayNamesMin: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
	showOtherMonths: true,
	beforeShowDay: holidayAllTheseDays, // 특정날짜 막기 및 표기
	onChangeMonthYear: function() {
		//ajax 이벤트 내부에서 beforeShowDay 변경
		//holidayDays = ["2021-1-3","2021-1-10","2021-1-16","2021-1-20"];
		//$('#datepicker2').datepicker("refresh");
		getMaterialCalendar();
	},
	defaultDate: '1999-12-25'
});

// 원자재캘린더 휴일 조회
function getMaterialCalendar() { // 해당월 휴일 가져오기
	sorin.ajax.postSetDataType("/fo/cs/materialCalender/getCalenderDates", JSON.stringify({
		searchKeyword: $("#eventMonth").val() + "01"
	}), "", true, function(data) {
		holidayDays = data;

		$('#datepicker2').datepicker("option", parent.beforeShowDay, holidayAllTheseDays);

	});
}

// 특정일 선택막기
function holidayAllTheseDays(date) {
	let m = date.getMonth();
	let d = date.getDate();
	let y = date.getFullYear();
	for (var i = 0; i < holidayDays.length; i++) {
		if ($.inArray(y + '-' + (("0" + (m + 1)).substr(-2)) + '-' + ("0" + d).substr(-2), holidayDays) != -1) {
			return [false];
		}
	}
	return [true];
}
///////////// 4.최신뉴스-원자재 캘린더 ////////////////

///////////// 5.서린닷컴 소개 ////////////////
// 메인 서린닷컴 소개 Slider
var mainSwiperSorin = new Swiper(".sorinWrapSwiper", {
	autoplay: {
		delay: 5000,
		disableOnInteration: false,
	},
	loop: true,
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
});
///////////// 5.서린닷컴 소개 ////////////////


var liveEndPc = ""; //라이브 종료가격
var fixedEndPc = "";//고정가 종료가격

//알람설정 버튼 클릭 이벤트
function sorinModalAlarmIdMain() {
	if (!isBuyPossible("alarm")) {
		return;
	} else {
		if (sorin.chart.headerRestdeAt == "N") { // 영업시간 o
	
			resetPopUp();
	
			let returnSleType = setRealTimeSellPrice(); // 팝업 초기데이터 세팅 (함수)
	
			if (returnSleType != "") {
	
				// aceScriptPl('alarmSorin1', sorinAccount.entrpsnmKorean, sorinAccount.id);
	
				$("#sorinModalAlarmMain").addClass('active');
				$(".updateHopePcBtn").attr("data-target", "sorinModalAlarmMain");
	
				$("#itemNm").text($.trim($('.sumTicker:visible').text()));
	
				confirmModal("sorinModalAlarmMain", function() {
	
					let confirmTimeResult = confirmSocketAccessTime();
	
					if (confirmTimeResult) {
						alertPopup("현재 희망가 알림을 설정할 수 없습니다.", function() {
							return true;
						});
						return true;
					}
	
					if ($("#alarmValidationForm").validationEngine("validate")) {
	
						let json = {
							metalCode: sorin.chart.metalCode,
							hopepc: $("#ipTargetPrice").val().replace(/[^\d]+/g, ""),
							itmSn: sorin.chart.itmSn,
							dstrctLclsfCode: sorin.chart.dstrctLclsfCode,
							brandGroupCode: sorin.chart.brandGroupCode,
							brandCode: sorin.chart.brandCode
						}
						
						sorin.ajax.comAjaxCustomErrorCallbackNoException("POST", "/op/setPriceAlarm", JSON.stringify(json),"json", "application/json", true,
						function(data) {
							if (data.result == "success") {
								alertPopup(sorin.message.geti18nMsg("fo.op.hopePrice.alarm.result.success"), function(result) {
									return true;
								});
							}
						},
						function(request){
							confirmPopupCustom(request.responseText, '나의 알림', function(result){
								if(result) {
									pageMove("/my/alarm/alarmList", '{"cnvrsCode":"0804"}', 'application/json', '-1');
								}
								return true;
							});
						});
	
						return true;
	
					}
	
				});
	
			} else {
				alertPopup("현재 희망가 알림을 설정할 수 없습니다.", function() {
					return true;
				});
	
				return;
			}
	
		} else if (headerRestdeAt == "Y") { // 영업시간 x
			alertPopup("현재 희망가 알림을 설정할 수 없습니다.", function() {
				return true;
			});
	
			return;
	
		}
	
	}

	//  		 }
}


/* 팝업 초기데이터 세팅 (함수) return: live fixed */
function setRealTimeSellPrice() {
	let sleType = "";
	let data = {
		metalCode: sorin.chart.metalCode,
		itmSn: sorin.chart.itmSn,
		dstrctLclsfCode: sorin.chart.dstrctLclsfCode,
		brandGroupCode: sorin.chart.brandGroupCode,
		brandCode: sorin.chart.brandCode
	}

	/*
		최초에 세팅되는 endpc는 프리미엄 가격이 포함된 가격
		소켓에서 받아오는 가격(endpc)은 프리미엄 가격을 더해준 다음 세팅해줘야함 +premiumPc
	*/
	sorin.ajax.postSetAllType("/my/alarm/selectRealTimeSellHopePc", JSON.stringify(data), "json", "application/json", false,
		function(data) {

			if (!sorin.validation.isEmpty(data)) {
				liveEndPc = "";
				fixedEndPc = "";

				if (sorin.chart.pageSleMthd == "01") { // 실시간
					if (sorin.chart.headerRestDeLive == "N") { // 실시간 영업 O
						//    							 if(headerSideCarMetalCode == metalCode){
						//     			        		if(headerMotnAt == "Y"){ // 사이드카 O
						//     			        			return;
						//     			        		}
						//     			        		else if(headerMotnAt == "N"){  // 사이드카 x
						if (!sorin.validation.isEmpty(data.liveResultMap)) {
							sleType = "live";
							let liveResultData = data.liveResultMap;
							let versusRate = data.versusRate.toFixed(2);
							let versusPc = data.versusPc;

							liveEndPc = liveResultData.endPc;

							$("#hpPremiumPc").val(liveResultData.premiumPc); // 프리미엄 가격
							$("#currentPrice").text(liveResultData.endPc.toLocaleString());
							$("#ipTargetPrice").val(liveResultData.endPc.toLocaleString());
							
							if (Number(versusPc) > 0) {
								
								$("#currentPrice").removeClass("fc-blue"); //파랑
								$("#currentPrice").addClass("fc-red"); //빨강
								$("#currentPrice").next().text("+" + versusRate + "%");
								$("#currentPrice").next().removeClass("fc-blue"); //파랑
								$("#currentPrice").next().addClass("fc-red"); //빨강
							} else if (Number(versusPc) < 0) {
								
								$("#currentPrice").removeClass("fc-red");
								$("#currentPrice").addClass("fc-blue");
								$("#currentPrice").next().text(versusRate + "%");
								$("#currentPrice").next().removeClass("fc-red");
								$("#currentPrice").next().addClass("fc-blue");
							} else {
								
								$("#currentPrice").removeClass("fc-red");
								$("#currentPrice").removeClass("fc-blue");
								$("#currentPrice").next().removeClass("fc-blue"); //파랑
								$("#currentPrice").next().removeClass("fc-red");
							}
							
						}
						//     			        		}
						//     			        	}
					} else if (sorin.chart.headerRestDeLive == "Y") { //실시간 영업 X
						return;
					}

				} else if (sorin.chart.pageSleMthd == "02") { // 고정가

					if (sorin.chart.headerRestDeFixed == "N") { // 고정가 영업 여부 o

						if (!sorin.validation.isEmpty(data.fixedResultMap)) {
							sleType = "fixed";

							let fixedResultData = data.fixedResultMap;

							fixedEndPc = fixedResultData.sleStdrPc;

							$("#hpMetalCode").val(fixedResultData.metalCode);
							$("#currentPrice").text(fixedResultData.sleStdrPc.toLocaleString());
							$("#ipTargetPrice").val(fixedResultData.sleStdrPc.toLocaleString());

							if (Number(fixedResultData.versusPc) >= 0) {
								$("#currentPrice").next().removeClass("fc-blue"); //파랑
								$("#currentPrice").next().addClass("fc-red"); //빨강
							} else {
								$("#currentPrice").next().removeClass("fc-red");
								$("#currentPrice").next().addClass("fc-blue");
							}


							if (fixedResultData.sleStdrPcRate > 0) {
								$("#currentPrice").next().text("+" + fixedResultData.sleStdrPcRate.toFixed(2) + "%");
							} else if (fixedResultData.sleStdrPcRate < 0) {
								$("#currentPrice").next().text(fixedResultData.sleStdrPcRate.toFixed(2) + "%");
							}


						}

					} else if (sorin.chart.headerRestDeFixed == "Y") { // 고정가 영업 여부 x
						return;
					}
				}
			}

		});

	return sleType;

}

// 팝업 데이터 리셋
function resetPopUp() {
	$("#currentPrice").next().attr('class', '');
	$("#itemNm").val("");
	$("#currentPrice").text("");
	$("#currentPrice").next().text("");
	$("#ipTargetPrice").val("");
	$("#hpPremiumPc").val("");
	$(".target-price-set").find("button[class=btn-blue-md]").attr('class', 'btn-stroke-md');
}

///////////// 9.희망가 알림 설정 팝업 ////////////////
// 희망가 알림 설정 팝업-목표가 focusin 이벤트
$(document).off('focusin', '#ipTargetPrice').on('focusin', '#ipTargetPrice', function() {
	let targetPrice = $(this).val().replace(/[^\d]+/g, "");
	$(this).val(targetPrice);
});

// 희망가 알림 설정 팝업-목표가 keyup 이벤트
$(document).off('keyup', '#ipTargetPrice').on('keyup', '#ipTargetPrice', function() {
	let targetPrice = $(this).val().replace(/[^\d]+/g, "");
	$(this).val(targetPrice);
});

// 희망가 알림 설정 팝업-목표가 focusout 이벤트
$(document).off('focusout', '#ipTargetPrice').on('focusout', '#ipTargetPrice', function() {
	let targetPrice = $(this).val().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$(this).val(targetPrice);
});

// 희망가 알림 설정 버튼 클릭 이벤트
$(document).off('click', 'button[id^=prcntBtn]').on('click', 'button[id^=prcntBtn]', function() {

	if ($(this).hasClass('btn-blue-md')) {

		$(this).removeClass('btn-blue-md').addClass('btn-stroke-md');
		$(this).siblings('button').removeClass('btn-blue-md').addClass('btn-stroke-md');

		// 판매 방식 코드 01 : live, 02 : 고정가
		if (sorin.chart.pageSleMthd == '01') {
			$(this).parents('.target-price-set').find('input').val(liveEndPc.toLocaleString());
		} else if (sorin.chart.pageSleMthd == '02') {
			$(this).parents('.target-price-set').find('input').val(fixedEndPc.toLocaleString());
		}

	}
	else if ($(this).hasClass('btn-stroke-md')) {
		$(this).addClass('btn-blue-md').removeClass('btn-stroke-md').siblings('button').addClass('btn-stroke-md').removeClass('btn-blue-md');
		let currentPrice = $('#currentPrice').text().replace(/[^\d]+/g, ""); // 숫자 외에 다른 문자는 모두 ""로 replace
		let targetValue = Math.abs($(this).attr('data-value'));
		let newPrice = String(parseInt(currentPrice - (currentPrice * targetValue / 100))).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).parents('.target-price-set').find('input').val(newPrice);
	}

});
///////////// 9.희망가 알림 설정 팝업 ////////////////

/* 구매 버튼 */
$(document).off("click", "#btnBuy").on("click", "#btnBuy", function() {

	if (!isBuyPossible("buy")) {
		return;
	}

	// aceScriptPl('purchSorin1', sorinAccount.entrpsnmKorean, sorinAccount.id);

	if (sorin.chart.pageSleMthd == "01") { // 실시간
		moveToItemPriceSearch();
	} else if (sorin.chart.pageSleMthd == "02") { // 고정가
		moveToItemPriceSearch();
	}

});

/* itemSeachPrice 페이지로 이동 */
function moveToItemPriceSearch() {
	let searchParam = {
		srhGubunCode: "02",
		metalCode: sorin.chart.metalCode,
		itmSn: sorin.chart.itmSn,
		dstrctLclsfCode: sorin.chart.dstrctLclsfCode,
		brandGroupCode: sorin.chart.brandGroupCode,
		brandCode: sorin.chart.brandCode,
		sleMthdCode: sorin.chart.sleMthdCode,
		metalClCode: sorin.chart.metalClCode,
	}
	
	//트래킹 파라미터 세팅
	searchParam.cnvrsCode = '0201';
	searchParam.cnvrsParam = {
		metalCode: sorin.chart.metalCode,
		itmSn: sorin.chart.itmSn,
		dstrctLclsfCode: sorin.chart.dstrctLclsfCode,
		brandGroupCode: sorin.chart.brandGroupCode,
		brandCode: sorin.chart.brandCode,
		sleMthdCode: sorin.chart.sleMthdCode,
		metalClCode: sorin.chart.metalClCode
	}

	pageMove('/pd/itemPriceSearch', JSON.stringify(searchParam), 'application/json', 'pditemPriceSearch7');
	/*
	sorin.ajax.postJSON("/pd/selectIsecoStock", JSON.stringify(searchParam), true, function(data) {
		if(data <= 0) {
			alertPopup("현재 상품 준비중입니다.\r\n감사합니다.", function() {
				return true;
			})
		}else {
			pageMove('/pd/itemPriceSearch', JSON.stringify(searchParam), 'application/json', 'pditemPriceSearch7');
			//     	pageMove('/pd/itemPriceSearch',JSON.stringify(searchParam),'application/json');
		}
   });
   */
}

/* 알림 설정, 구매 버튼 접근 권한 여부 */
function confirmUserAccess() {

	let accessState = '0';

	if ('01' == sorinAccount.type) { // 회원사 회원 여부

		if (sorinAccount.mberSttusCode == '03') {	//임시회원 계좌상태별 팝업

			if (sorinAccount.refndAcnutSttusCode == '') {
				accessState = '1'; 						//하나은행 계좌 등록 중입니다.

			} else if (sorinAccount.refndAcnutSttusCode == '01') {		//임시회원&환불계좌전송완료
				accessState = '2';						//고객 전용 가상 계좌 준비중입니다.

			} else if (sorinAccount.refndAcnutSttusCode == '03') {		//임시회원&응답완료
				accessState = '3';						//선불금 관리대행 서비스 동의를 진행 중입니다.

			} else if (sorinAccount.refndAcnutSttusCode == '05') {		//임시회원&최종응답완료
				accessState = '4';						//거래회원 승인 대기 중 입니다.

			}
		} else if ('01' != sorinAccount.mberSttusCode) { // 정회원만 접근 가능
			accessState = '5';
		} else if ('' == sorinAccount.secode || '04' == sorinAccount.secode) { // 구분 코드 04 - 자금 담당은 구매 불가
			accessState = '5';
		}

	} else if ('02' == sorinAccount.type) { // 간편 회원 여부
		accessState = '5';
	}

	return accessState;
}

//회원 계좌상태별 팝업
function noAuthMetalMenu(accessState) {
	let message = "";

	if (accessState == '1') {
		message = "하나은행 계좌 등록 중입니다.";
	} else if (accessState == '2') {
		message = "고객 전용 가상 계좌 준비중입니다.";
	} else if (accessState == '3') {
		message = "선불금 관리대행 서비스 동의를 진행 중입니다.";
	} else if (accessState == '4') {
		message = "거래회원 승인 대기 중 입니다.";
	} else if (accessState == '5') {
		message = "기업 회원만 상품을 주문할 수 있습니다.";
	}

	return message;
}

/* 소켓에서 들어온 데이터로 영업시간, 실시간(사이드카 발동 여부), 고정가 영업 여부 비교 */
function confirmSocketAccessTime() {
	let result = false;

	if (sorin.chart.headerRestdeAt == "N") { // 영업시간 O
		if ("01" == sorin.chart.pageSleMthd) { // 실시간
			if (sorin.chart.headerRestDeLive == "N") { // 실시간 영업 O
				if (sorin.chart.headerSideCarMetalCode == 7) {
					if (sorin.chart.headerMotnAt == "Y") { // 사이드카 O
						result = true;
					}
				}
			}
		} else if ("02" == sorin.chart.pageSleMthd) { //고정가
			if (sorin.chart.headerRestDeFixed == "Y") { // 고정가 영업 여부
				result = true;
			}
		}
	}

	return result;
}

//로그인 필요팝업호출
function requireLogin(url) {

	if (sorin.chart.loginYn == 'Y') {
		window.open(url);
	} else {
		confirmPopup(sorin.message.geti18nMsg("fo.mb.validation.login.status"), function() {
			pageMove('/account/login'); //회원 전용 서비스입니다. 로그인 후 이용하시겠습니까?
			return true;
		});
	}
}

//로그인 필요팝업호출
function requireLoginPageMove(url, data, contentType, menuActiveIdenty) {

	if (sorin.chart.loginYn == 'Y') {
		pageMove(url, data, contentType, menuActiveIdenty);
	} else {
		confirmPopup(sorin.message.geti18nMsg("fo.mb.validation.login.status"), function() {
			pageMove('/account/login'); //회원 전용 서비스입니다. 로그인 후 이용하시겠습니까?
			return true;
		});
	}
}

// Ajax를 이용해 각 모듈별 Content HTML을 가져온다.
function getAjaxContent(url, data, id) {
	sorin.ajax.postSetAllTypeForPageMove(url, data, 'html', '', true, function(returnData) {
		$("#" + id).empty();
		$("#" + id).html(returnData);
	});
}


// Swiper 슬라이드 추가
function changeSwiperSlides(url, data, swiperGrap) {
	sorin.ajax.postSetAllTypeForPageMove(url, data, 'html', '', true, function(returnData) {
		//먼저 기존에 있는 슬라이드 element를 삭제해보자
		swiperGrap.removeAllSlides();
		swiperGrap.appendSlide(returnData);
		swiperGrap.update();  //슬라이드를 새로 추가할 경우 꼭 update 함수를 호출하는게 좋다
	});
}
