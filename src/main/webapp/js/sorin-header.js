'use strict';
/********* Community */
var currentPrice; // 주문 모달창에 필요한 현재단가(실시간) 담는 전역 변수
var cstmrSlePcRltmSnByOrder = null; // 주문 모달창에 고객 판매 가격 실시간 순번 담는 전역 변수
var cstmrLmePcRltmSnByOrder = null; // 주문 모달창에 고객 LME 가격 실시간 순번 담는 전역 변수
var cstmrEhgtPcRltmSnByOrder = null; // 주문 모달창에 고객 환율 가격 실시간 순번 담는 전역 변수
var startOpenTimeCode = '20';

function showWishAlramAndReturnAck(receiveData) {
	//알림 띄운다
	var parsedData = stompReceiveMessage(receiveData);

	var txt = Number(parsedData.hopepc).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	var msg = parsedData.itmPrdlstEng + '이 ' + txt + '원에 도달!!<br />지금 바로 주문하세요.<br />';

	toastShow("hope", msg, "");

	var addParams = {
		"lastChangerId": sorin.account.getUserInfo().id
	}

	Object.assign(parsedData, addParams);

	stompSend(stompClient, '/messageMapping/op/alarm/hopeReturnInfo', null, stompSendMessage(parsedData));
}

function addInvenAlarmSubscribe(uri) {
	stompSubscribe(stompClient, uri, function (receiveData) {
		//알림 띄운다
		var parsedData = stompReceiveMessage(receiveData);
		toastShow("inven", parsedData.id, parsedData.message);
		//알림 확인을 서버에 보낸다.
		stompSend(stompClient, '/messageMapping/op/alarm/ivenReturnInfo', null
			, uri + "/" + receiveData.ntcnSndngRgsde + "/" + receiveData.invenqt + "/" + sorin.account.getUserInfo().id);
	});
}

function toastShow(alarmType, metalName, msg) {
	var alarmTitle;

	if (alarmType == "hope") {
		alarmTitle = "희망가 알림";
	}
	else if (alarmType == "inven") {
		alarmTitle = "재고 알림";
	}
	else {
		alarmTitle = "인덱스 알림";
	}
	toastr.info('<span class="prod">' + metalName + '</span> <span class="prod-price">' + msg + '</span>', alarmTitle, {
		"allowHtml": true,
		"closeButton": true,
		"debug": false,
		"newestOnTop": false,
		"progressBar": false,
		"positionClass": "toast-bottom-right",
		"preventDuplicates": false,
		"onclick": null,
		"showDuration": "500",
		"hideDuration": "1000",
		"timeOut": "10000000",
		"extendedTimeOut": "1000",
		"showEasing": "swing",
		"hideEasing": "linear",
		"showMethod": "slideDown",// fadeIn
		"hideMethod": "slideUp",// fadeOut
		"closeButton": "true"
		//   ,"escapeHtml": false
	});
}

//헤더 부분의 버튼 acive를 위한 키값을 만들어 리턴
function makeMenuActiveIdenty(url, parameter) {
	return (url + parameter).replace(/\/|\"|{|}|,|:/gi, '');
}

function websocketHeaderSubscriber() {
	stompSubscribe(stompClient, sorin.chart.subscriberURI, function (receiveData) {
		if (!sorin.validation.isNull(receiveData.body)) {
			lastConnectedTime = new Date();

			let restDeLive;
			let restDeFixed;
			const data = JSON.parse(receiveData.body);
			restDataList = data.restDtTime; // 금속별 문구 처리를 위한 전역변수 세팅

			for (var i = 0; i < restDataList.length; i++) {
				if (restDataList[i].metalCode == sorin.chart.pageMetal && restDataList[i].sleMthdCode == sorin.chart.pageSleMthd) {
					headerRestWaitTerm = restDataList[i].topWaitTerm; // 상단 시간차
					headerRestWaitNm = restDataList[i].topWaitNm; // 소켓 타이머 문구
					headerOpenTimeCode = restDataList[i].openTimeCode; //개장시간 범위 코드
					chartStTitleNm = restDataList[i].chartStTitle;
					chartEdTitleNm = restDataList[i].chartEdTitle;
					
					var currTitle = sorin.chart.chartSumTitleInfo.get("restInfo");
					
					// 일시휴장 및 사이드카등 운영중단종료후 운영복귀시 전광판 운영상태메시지 초기화
					if(!sorin.validation.isEmpty(currTitle) && (headerOpenTimeCode == "20" || headerOpenTimeCode == "21" || headerOpenTimeCode == "23")) {
						sorin.chart.setChartSumTitle("restInfo");
					}
				}

				if (restDataList[i].sleMthdCode == '01') {
					restDeLive = restDataList[i].restDeLive;
				} else {
					restDeFixed = restDataList[i].restDeFixed;
				}
			}

			sorin.chart.headerRestDeLive = restDeLive;
			sorin.chart.headerRestDeFixed = restDeFixed;

			if(!restDeLive && sorin.chart.pageSleMthd == '01') {
				headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
				headerOpenTimeCode = '999'; //개장시간 범위 코드
				chartStTitleNm = '서린닷컴 운영시간이 아니므로';
				chartEdTitleNm = '';
				$("#headerTimeset").text('');
			}

			if(!restDeFixed && sorin.chart.pageSleMthd == '02') {
				headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
				headerOpenTimeCode = '999'; //개장시간 범위 코드
				chartStTitleNm = '서린닷컴 운영시간이 아니므로';
				chartEdTitleNm = '';
				$("#headerTimeset").text('');
			}

			if( restDeLive == 'Y' && restDeFixed == 'Y') {
				sorin.chart.headerRestdeAt = 'Y';
			} else {
				sorin.chart.headerRestdeAt = 'N';
			}

			setRestDtTime();    // 타이머 문구 세팅, interval 시작
		}
	});

	stompSubscribe(stompClient, sorin.chart.subscriberStartLmeURI, function (receiveData) {
		if (!sorin.validation.isEmpty(receiveData.body) && receiveData.body.includes("startLmeData/" + sorin.chart.pageMetal)) {
 			if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == "/main/") {
				sorin.chart.startLmeData = sorin.chart.pageMetal;
					getRestDtTimeSet(); // 영업 시간 타이머
			} else if (currentPage == "landing") {
				location.reload(true);
			} else if (currentPage == "steel"){
				moveToSteel();
			} else {
				getRestDtTimeSet(); // 영업 시간 타이머
			}
		}
	});

	stompSubscribe(stompClient, sorin.chart.subscriberRestTimeURI, function (receiveData) {
		if (!sorin.validation.isEmpty(receiveData.body) && receiveData.body == "setRestTime") {
			if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == "/main/" || currentPage == '/my/order/avrgDetail') {
				$(".sorin-state").removeClass("show");  //리플레시 작동 안할 시 대비
				moveToMain();			//reload시 랜딩페이지 > 메인페이지로 수정
				//location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
			} else if (currentPage == "landing") {
				location.reload(true);
			} else if (currentPage == "steel"){
				moveToSteel();
			} else {
				getRestDtTimeSet(); // 영업 시간 타이머
			}
		}
	});

	stompSubscribe(stompClient, sorin.chart.subscriberSpreadURI, function (receiveData) {
		if (!sorin.validation.isEmpty(receiveData.body) && receiveData.body == "notMatchedSpread") {
			if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == "/main/") {
				$(".sorin-state").removeClass("show");  //리플레시 작동 안할 시 대비
				moveToMain();		//reload시 랜딩페이지 > 메인페이지로 수정
				//location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
			} else if(currentPage == "landing") {
				location.reload(true);
			} else if (currentPage == "steel"){
				moveToSteel();
			} else {
				getRestDtTimeSet(); // 영업 시간 타이머
			}
		}
	});
}

function websocketHeaderOpenLoop() {
	setTimeout(function () {
		if (stompClient.connected == true) {
			websocketHeaderSubscriber();
			webSocketSidcarOP();
			fxInitCreate();						//환율 소켓 호출
			//lmePcInitCreate();					//LME 소켓 호출

			if(currentPage == "landing"){
				realTimeLandingPriceSocket();	//실시간 가격 소켓 호출
			} else if(currentPage == "steel"){
				realTimeSteelPriceSocket();			//실시간 가격 소켓 호출
			} else {
				realTimeSellPriceSocket();
			}

		} else {
			websocketHeaderOpenLoop();
		}
	}, 100);
}

function fxInitCreate() {
	//환율 데이터 소켓 연결
	stompSubscribe(stompClient, sorin.chart.subscriberFxURI + "/" + sorin.chart.subscriberFxpcKRWURI, function (receiveData) {
        var result = stompReceiveMessage(receiveData);
        if (!sorin.validation.isEmpty(result)) {
            var endPc = String(result.endPc.toFixed(2));
            $("[rtlmEndPc]").html(addComma(endPc));
			//console.log('FX endPc 현재가 :::: ', endPc);
        }
    });
}

function lmePcInitCreate() {
	//lmePc 데이터 소켓 연결
	for(var i = 0; i < sorin.chart.liveList.length; i++) {
		let chartListStomp = sorin.chart.liveList[i];
		stompSubscribe(stompClient, sorin.chart.subscriberLmePcURI + "/" + chartListStomp.metalCode, function (receiveData) {
		var result = stompReceiveMessage(receiveData);
		if (!sorin.validation.isEmpty(result)) {
				console.log('LME metalCode 메탈 :::: ', result.metalCode);
				console.log('LME endPc 현재가 :::: ', result.endPc);
			}
		});
	}
}

function websocketChartOpenLoop() {
    setTimeout(function() {
        if(stompClient.connected == true) {
        	$("#dataType li:first").trigger("click");
        } else {
        	websocketChartOpenLoop();
        }
    }, 100);
}

function getRestDtTimeSet() { // 영업 시간 타이머 최초값
	sorin.ajax.postSetDataType('/main/restDtTimeSet', '', '', false, function (data) {
		if (!sorin.validation.isNull(data)) {
			let restDeLive;
			let restDeFixed;
			restDataList = data.restDtTime; // 금속별 문구 처리를 위한 전역변수 세팅
			for (var i = 0; i < restDataList.length; i++) {
				if (restDataList[i].metalCode == sorin.chart.pageMetal && restDataList[i].sleMthdCode == sorin.chart.pageSleMthd) {
					headerRestWaitTerm = restDataList[i].topWaitTerm; // 상단 시간차
					headerRestWaitNm = restDataList[i].topWaitNm; // 소켓 타이머 문구

					if(sorin.chart.startLmeData == restDataList[i].metalCode) {
						restDataList[i].openTimeCode = startOpenTimeCode;
						sorin.chart.setChartSumTitle("restInfo");
						$('#msgAlOpening').hide();
						requestGetAvgDeEndPriceAjax();
						sorin.chart.startLmeData = '';
					}

					headerOpenTimeCode = restDataList[i].openTimeCode; //개장시간 범위 코드

					chartStTitleNm = restDataList[i].chartStTitle;
					chartEdTitleNm = restDataList[i].chartEdTitle;
				}

				if (restDataList[i].sleMthdCode == '01') {
					restDeLive = restDataList[i].restDeLive;
				} else {
					restDeFixed = restDataList[i].restDeFixed;
				}
			}

			sorin.chart.headerRestDeLive = restDeLive;
			sorin.chart.headerRestDeFixed = restDeFixed;

			if(!restDeLive && sorin.chart.pageSleMthd == '01') {
				headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
				headerOpenTimeCode = '999'; //개장시간 범위 코드
				chartStTitleNm = '서린닷컴 운영시간이 아니므로';
				chartEdTitleNm = '';
				$("#headerTimeset").text('');
			}

			if(!restDeFixed && sorin.chart.pageSleMthd == '02') {
				headerRestWaitNm = '운영시간이 아닙니다.'; // 소켓 타이머 문구
				headerOpenTimeCode = '999'; //개장시간 범위 코드
				chartStTitleNm = '서린닷컴 운영시간이 아니므로';
				chartEdTitleNm = '';
				$("#headerTimeset").text('');
			}

			if( restDeLive == 'N' && restDeFixed == 'N') {
				sorin.chart.headerRestdeAt = 'N';
			} else {
				sorin.chart.headerRestdeAt = 'Y';
			}

			setRestDtTime();    // 타이머 문구 세팅, interval 시작
		}
	});
}


function setRestDtTime() { // 타이머 문구 세팅, interval 시작
	if(currentPage == "landing"){
		$("#landing-timeset").text("서린닷컴 " + headerRestWaitNm);
	} else {
		$("#timeset-span").text("서린닷컴 " + headerRestWaitNm); // 타이머 문구 변경
	}
	startHeaderRestTimer(headerRestWaitTerm); // 영업 시간 타이머 interval
}

function startHeaderRestTimer(secondTerm) { // 영업 시간 타이머 interval

	clearInterval(headerRestTimer); // 타이머 clear
	headerRestTimer = setInterval(function () {
		resultTime = sorin.timer.timeFormat(secondTerm); // 시간 DD일 HH:mm:ss format으로 변경
		operateFlag = false;
		//운영여부가 undefined로 조회되는 경우
		if((sorin.chart.pageSleMthd == "01" && !sorin.chart.headerRestDeLive) || (sorin.chart.pageSleMthd == "02" && !sorin.chart.headerRestDeFixed)) {
			if(currentPage = "steel"){
				$("#steelTimer").empty();
				$("#titleOpen").text('');
				$("#titleOpen").html("임시휴장");
			} else {
				$(".off-time:visible").addClass("hide");
				$(".rChart-sum").removeClass("sum-type1");
				$(".rChart-sum").removeClass("sum-type2");
				$(".rChart-sum").addClass("sum-type3");
				sorin.chart.setChartSumTitle("restInfo", "서린닷컴 운영시간이 아닙니다.");
			}
			return;
		}

		for (var i = 0; i < restDataList.length; i++) {
			try {
				if (sorin.chart.pageMetal == restDataList[i].metalCode && restDataList[i].sleMthdCode == sorin.chart.pageSleMthd) {
					if (restDataList[i].openTimeCode == "00" || restDataList[i].openTimeCode == "10" || restDataList[i].openTimeCode == "30") { // 휴일
						operateFlag = false;
						if (secondTerm <= 0) { // 시간차가 0이 들어왔을 때
							stopHeaderRestTimer(); // interval clear
							sorin.chart.setChartSumTitle("restInfo", "");

							if (currentPage == "/pd/itemPriceBasket") {
								pageMove("/pd/itemPriceBasket", JSON.stringify({ metalCode: "" }), "application/json"); // 현재 페이지가 관심품목내역일때 페이지 재호출
								getRestDtTimeSet();// 영업 시간 타이머
								return;
							} else if (currentPage == "/pd/itemPriceSearch") {
								pageMove('/pd/itemPriceSearch', JSON.stringify({ metalCode: metalCode, sleMthdCode: sleMthdCode, metalClCode : metalClCode }), 'application/json'); // 현재 페이지가 상품검색일때 페이지 재호출
								getRestDtTimeSet();// 영업 시간 타이머
								return;
							} else if (currentPage == "steel") {
								$("#steelTimer").empty();
								$("#titleOpen").text('');
								$("#titleOpen").html("시초가 수신 전");
								return;
							} else if (currentPage == "landing") {
								$("#landing-timer").text('');
								getRestDtTimeSet();						// 영업 시간 타이머
								return;
							}else {
								$("#headerTimeset").text('');
								getRestDtTimeSet();// 영업 시간 타이머
								if(sorin.chart.loginYn == 'Y'){
									sorin.chart.setChartSumTitle("restInfo", "서린닷컴 시초가 수신전입니다.");
									$(".rChart-sum").removeClass("sum-type1");
									$(".rChart-sum").removeClass("sum-type2");
									$(".rChart-sum").addClass("sum-type3");
								} else {
									sorin.chart.setChartSumTitle("restInfo", "로그인 후 상세차트를 확인하 실 수 있습니다.");
									$(document).prop('title', '[서린닷컴] 실시간 알루미늄 최저가 구매');
								}
							}
							return;
						} else {
							if (currentPage == "steel") {
								$(".steelTimer").text("-"+ resultTime);
							} else if (restDataList[i].openTimeCode == "00") {
								sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle);
								$(".rChart-sum").removeClass("sum-type1");
								$(".rChart-sum").removeClass("sum-type2");
								$(".rChart-sum").addClass("sum-type3");
							} else {
								sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle, restDataList[i].restWaitTerm);
								$(".rChart-sum").removeClass("sum-type1");
								$(".rChart-sum").removeClass("sum-type2");
								$(".rChart-sum").addClass("sum-type3");
							}
						}
					} else if (restDataList[i].openTimeCode == "20" || restDataList[i].openTimeCode == "21" || restDataList[i].openTimeCode == "23") { // 운영중
						if (secondTerm <= 0) { // 시간차가 0이 들어왔을 때
							stopHeaderRestTimer(); // interval clear

							if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == "/main/" || currentPage == '/my/order/avrgDetail') {
								moveToMain();		//reload시 랜딩페이지 > 메인페이지로 수정
								//location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
								return;
							} else if (currentPage == "landing") {
								location.reload(true); 						//현재 페이지가 메인, 금속 메뉴일 경우 refresh
								return;
							} else if (currentPage == "steel"){
								moveToSteel();
								return;
							} else {
								sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle);
								$(".rChart-sum").removeClass("sum-type2");
								$(".rChart-sum").removeClass("sum-type3");
								$(".rChart-sum").addClass("sum-type1");
								getRestDtTimeSet();// 영업 시간 타이머
							}

							return;
						}

						if(!$(".rChart-sum").hasClass("sum-type1")) {
							$(".rChart-sum").removeClass("sum-type2");
							$(".rChart-sum").removeClass("sum-type3");
							$(".rChart-sum").addClass("sum-type1");
						}
						operateFlag = true;

					} else if (restDataList[i].openTimeCode == "22" || restDataList[i].openTimeCode == "24" || restDataList[i].openTimeCode == "25") { // 일시휴장,사이드카
						operateFlag = false;

						if (restDataList[i].openTimeCode == "24" || restDataList[i].openTimeCode == "25") { // 사이드카

							if (restDataList[i].restWaitTerm <= 0) { // 시간차가 0이 들어왔을 때
								if (currentPage == "/pd/itemPriceBasket") {
									stopHeaderRestTimer(); // interval clear
									pageMove("/pd/itemPriceBasket", JSON.stringify({ metalCode: "" }), "application/json"); // 현재 페이지가 관심품목내역일때 페이지 재호출
								} else if (currentPage == "landing") {
									location.reload(true); 					//현재 페이지가 메인, 금속 메뉴일 경우 refresh
									return;
								} else if (currentPage == "steel"){
									moveToSteel();
									return;
								}

								getRestDtTimeSet();						// 영업 시간 타이머

								return;
							} else {
								if (currentPage == "/pd/itemPriceBasket") {
									sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle, restDataList[i].restWaitTerm);
									$(".rChart-sum").removeClass("sum-type1");
									$(".rChart-sum").removeClass("sum-type3");
									$(".rChart-sum").addClass("sum-type2");
								} else if (currentPage == "steel"){
										$("#titleClose").html("임시휴장"+ " -" +resultTime);
								} else {
									if (sorin.chart.pageSleMthd == "01") {
										if (restDataList[i].restWaitTerm <= 0) { // 시간차가 0이 들어왔을 때
											stopHeaderRestTimer(); // interval clear

											if (currentPage == "/pd/itemPriceSearch") {
												pageMove('/pd/itemPriceSearch', JSON.stringify({ metalCode: metalCode, sleMthdCode: sleMthdCode, metalClCode : metalClCode }), 'application/json'); // 현재 페이지가 상품검색일때 페이지 재호출
												getRestDtTimeSet();// 영업 시간 타이머
												return;
											} else if (currentPage == "landing") {
												location.reload(true); 					//현재 페이지가 메인, 금속 메뉴일 경우 refresh
												return;
											} else if (currentPage == "steel"){
												moveToSteel();
												return;
											} else {
												sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle);
												$(".rChart-sum").removeClass("sum-type2");
												$(".rChart-sum").removeClass("sum-type3");
												$(".rChart-sum").addClass("sum-type1");
												// 									stopHeaderRestTimer(); // interval clear

												// 									if(currentPage == "main" || currentPage == "/pd/itemPriceSearch"){
												// 										location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
												// 										return;
												// 									} else {
												// 										getRestDtTimeSet();// 영업 시간 타이머
												// 									}
											}
										} else {
											if(currentPage == "steel"){
												$("#titleClose").html("임시휴장"+ " -" +resultTime);
											} else {
												sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle, restDataList[i].restWaitTerm);
												$(".rChart-sum").removeClass("sum-type1");
												$(".rChart-sum").removeClass("sum-type3");
												$(".rChart-sum").addClass("sum-type2");
											}
										}
									} else if (headerSleMthdCode == "02") {
										sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle);
										$(".rChart-sum").removeClass("sum-type2");
										$(".rChart-sum").removeClass("sum-type3");
										$(".rChart-sum").addClass("sum-type1");
									}
								}
							}
						}else if (restDataList[i].openTimeCode == "22") { // 일시휴장
							if (restDataList[i].restWaitTerm <= 0) { // 시간차가 0이 들어왔을 때
								stopHeaderRestTimer(); // interval clear

								if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == "/main/") {
									moveToMain();		//reload시 랜딩페이지 > 메인페이지로 수정
									//location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
									return;
								} else if (currentPage == "landing") {
									location.reload(true); 					//현재 페이지가 메인, 금속 메뉴일 경우 refresh
									return;
								} else if (currentPage == "steel"){
									moveToSteel();
									return;
								} else {
									getRestDtTimeSet();// 영업 시간 타이머
								}
							} else {
								if(currentPage == "steel"){
									$("#titleClose").html("임시휴장"+ " -" +resultTime);
								} else {
									sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle, restDataList[i].restWaitTerm);
									$(".rChart-sum").removeClass("sum-type1");
									$(".rChart-sum").removeClass("sum-type3");
									$(".rChart-sum").addClass("sum-type2");
								}
							}
						}

					} else if (restDataList[i].openTimeCode == "40" || restDataList[i].openTimeCode == "41") {// 시초가 수신
						operateFlag = false;
						stopHeaderRestTimer(); // interval clear

						if(currentPage == "steel"){
							$("#steelTimer").empty();
							$("#openTimer").addClass("close");
							$("#titleClose").html("시초가 수신 전");
							return;
						} else {
							$("#headerTimeset").text('');
							sorin.chart.setChartSumTitle("restInfo", restDataList[i].chartStTitle, restDataList[i].chartEdTitle);
							$(".rChart-sum").removeClass("sum-type1");
							$(".rChart-sum").removeClass("sum-type2");
							$(".rChart-sum").addClass("sum-type3");
							$('#msgAlOpening').show();
							return;
						}
					} else {
						if (secondTerm <= 0) { // 시간차가 0이 들어왔을 때
							stopHeaderRestTimer(); // interval clear

							if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == "/main/") {
								moveToMain();		//reload시 랜딩페이지 > 메인페이지로 수정
								//location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
							} else if (currentPage == "landing") {
								location.reload(true);		//현재 페이지가 메인, 금속 메뉴일 경우 refresh
								return;
							} else if (currentPage == "steel"){
								moveToSteel();
								return;
							} else {
								getRestDtTimeSet();// 영업 시간 타이머
							}

							return;
						}
					}

					if (currentPage == "landing") {
						$("#landing-timer").text(resultTime);
					}

					$("#headerTimeset").text(resultTime);
					restDataList[i].restWaitTerm = restDataList[i].restWaitTerm - 1;
					secondTerm = secondTerm - 1;

					if (sorin.chart.headerRestdeAt == "Y") { //휴일일 때
						//메인화면 타이머
						if ($(".off-time").is(":visible")) {
							$(".off-time:visible").text("-" + resultTime);
						}
					}

				} else {
					restDataList[i].restWaitTerm = restDataList[i].restWaitTerm - 1;
				}
			} catch (err) {
				stopHeaderRestTimer();
				alertPopup("타이머에 문제가 생겼습니다.\n확인을 누르면 메인화면으로 갑니다.", function () {
					moveToMain();		//reload시 랜딩페이지 > 메인페이지로 수정
					//location.reload(true);
					return true;
				});
			}
		}
	}, 1000);
}

function stopHeaderRestTimer() { // 타이머 0일 때, 화면 refresh
	clearInterval(headerRestTimer); // 타이머 clear
	headerRestTimer = null;
}

var alRestdeStatus = "N"; // 알루미늄 휴무
var znRestdeStatus = "N"; // 아연 휴무

// 사이트카 웹소켓 (발동,발동 해제시에만 들어옴)
function webSocketSidcarOP() {
	stompSubscribe(stompClient, "/sidecar", function (receiveData) {
		if (!sorin.validation.isNull(receiveData.body)) {
			if (!sorin.validation.isEmpty(sorinAccount)) { // 로그인 여부 체크
				const data = JSON.parse(receiveData.body);
				for (var i = 0; i < data.length; i++) {
					var sidecarData = data[i];
					if (sorin.chart.pageMetal == '7') {
						if (sidecarData.metalCode == '7' && sidecarData.motnAt == 'Y') {
							// 알루미늄 사이드카 걸렸을 경우
							alRestdeStatus = "Y";
						} else {
							alRestdeStatus = "N";
						}
						sorin.chart.headerSideCarMetalCode = sidecarData.metalCode; // 사이드카 메탈코드
						sorin.chart.headerMotnAt = sidecarData.motnAt; // 사이드카 발동 여부

						if (currentPage == "main" || currentPage == "/pd/itemPriceSearch" || currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == "/main/" || currentPage == '/my/order/avrgDetail') {
							//    location.reload(true); //현재 페이지가 메인, 금속 메뉴일 경우 refresh
						}
					}
				}
			}
		}
	});
}

//실시간 가격 데이터 소켓 연결 (고정가는 연결 안함)
function realTimeSellPriceSocket() {
	for(var i = 0; i < sorin.chart.metalCodeListProperty.split(',').length; i++) {
		let metalCode = sorin.chart.metalCodeListProperty.split(',')[i];
		stompSubscribe(stompClient, sorin.chart.subscriberSelpcAllURI +"/" + metalCode, function(receiveData) {
			if (headerOpenTimeCode == "20" || headerOpenTimeCode == "21" || headerOpenTimeCode == "23") {
				var resultList = stompReceiveMessage(receiveData);

				if(!sorin.validation.isEmpty(resultList)) {
					for(var j = 0; j < sorin.chart.liveList.length; j++) {
						let chartListStomp = sorin.chart.liveList[j];

						for(var k = 0; k < resultList.length; k++) {
							let result = resultList[k];

							if(sorin.chart.pageMetal == result.metalCode && sorin.chart.pageSleMthd == '01' && chartListStomp.metalCode == result.metalCode) {
								if (currentPage != '/pd/itemPriceBasket') {
									if(sorin.chart.itmSn == result.itmSn
										&& sorin.chart.dstrctLclsfCode == result.dstrctLclsfCode
										&& sorin.chart.brandGroupCode == result.brandGroupCode
										&& sorin.chart.brandCode == result.brandCode) {
										if($("#chartHolder").is(":visible") && newChartComplateYn) {
											let chartSelTime;

											switch (sorin.chart.type) {	// 일봉인지, 주봉인지, 월봉인지 알림, x축 차트 간격 조정
												case "1minute":
													rMateStock.setTimeFrame("chart1", "minute");
													rMateStock.setHorizontalAxisInterval("chart1", 5);
													chartSelTime = date_to_str_realTime(new Date(result.slePcRltmSn.substr(0, 14).replace(/^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/, '$4:$5:$6 $2/$3/$1')));

													break;
												case "30minute":
													rMateStock.setTimeFrame("chart1", "minute");
													rMateStock.setHorizontalAxisInterval("chart1", 1);
													chartSelTime = date_to_str_realTime(new Date(result.slePcRltmSn.substr(0, 14).replace(/^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/, '$4:$5:$6 $2/$3/$1')));

													break;
												case "60minute":
													rMateStock.setTimeFrame("chart1", "minute");
													rMateStock.setHorizontalAxisInterval("chart1", 1);
													chartSelTime = date_to_str_realTime(new Date(result.slePcRltmSn.substr(0, 14).replace(/^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/, '$4:$5:$6 $2/$3/$1')));

													break;
												case "day":
													rMateStock.setTimeFrame("chart1", "day");
													rMateStock.setHorizontalAxisInterval("chart1", 1);
													chartSelTime = date_to_str_realTime(new Date(result.slePcRltmSn.substr(0, 14).replace(/^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/, '$4:$5:$6 $2/$3/$1'))).substr(0, 10);

													break;
												case "month":
													rMateStock.setTimeFrame("chart1", "month"); // 일봉인지, 주봉인지, 월봉인지 알림
													rMateStock.setHorizontalAxisInterval("chart1", 1); // x축 차트 간격 조정
													chartSelTime = date_to_str_realTime(new Date(result.slePcRltmSn.substr(0, 14).replace(/^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/, '$4:$5:$6 $2/$3/$1'))).substr(0, 10);

													break;
											}

											let premiumKey = sorin.chart.metalCode + "_" + sorin.chart.itmSn+ "_" + sorin.chart.dstrctLclsfCode + "_" + sorin.chart.brandGroupCode + "_" + sorin.chart.brandCode;

											sorin.chart.setRealTime(premiumKey, result, chartSelTime);

											checkPriceData('realTime', result, '', sorin.chart.type);
										}

										currentPrice = Number(result.endPc);
										//현재가격, 기준매매가격 비교
										chartSumTitle1 = true;
										chartSumTitle2 = false;
										avgEndPcChange('realTime');

										var codeNmsleMthdCode = chartListStomp.codeNm+chartListStomp.sleMthdCode;
										let chartTitleInfo = sorin.chart.chartTitleInfo;
										let endPcAgo = chartTitleInfo.endPcAgo;
										endPcAgo = endPcAgo ? endPcAgo : 0;
										let alVersus = currentPrice - endPcAgo;
										let	beginPc = chartTitleInfo.beginPc;
										beginPc ? beginPc : 0;

										var alRate = 0;
										if(endPcAgo == 0){
											alRate = 100;
										} else {
											alRate = (currentPrice - endPcAgo) / endPcAgo * 100;
										}

										// chartTitleInfo가 있고 시가가 > 0
										if(!sorin.validation.isEmpty(chartTitleInfo) && beginPc > 0) {
											var titleTopPc = Number(chartTitleInfo.topPc) > currentPrice ? chartTitleInfo.topPc : currentPrice;
											var titleLwetPc = Number(chartTitleInfo.lwetPc) < currentPrice ? chartTitleInfo.lwetPc : currentPrice;

											if(currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == '/my/order/avrgDetail') {
												$(".realTimePrice2").text(addComma(currentPrice));	// 2023-04-11 변경사항 : 신규 모달창에 현재가 반영

												$(".type-high dd").text(addComma(titleTopPc));
												$(".type-low dd").text(addComma(titleLwetPc));

												//realTimePriceByOrder = currentPrice; // 주문 모달창에 필요한 현재단가(실시간) 담기

												if(alVersus > 0){
													$(".realTimePrice2").removeClass("down");
													$(".realTimePrice2").addClass("up");
												} else if(alVersus < 0) {
													$(".realTimePrice2").removeClass("up");
													$(".realTimePrice2").addClass("down");
												} else {
													$(".realTimePrice2").removeClass("up");
													$(".realTimePrice2").removeClass("down");
												}

												goodsCurrentPrice = currentPrice;
												titlePreminumChange(addComma(currentPrice), alRate.toFixed(2));

												//결제 모달창에만 적용
												if ($("#sorinModalOrder").hasClass("active") === true) {
													setOrderModalPrice(currentPrice);
												}

											} else {
												$("#" + codeNmsleMthdCode + "-price").html(" " + currentPrice.toLocaleString() + " " + '<span class="txt">KRW</span>');
												$("#" + codeNmsleMthdCode + "-hprice").html(titleTopPc.toLocaleString());
												$("#" + codeNmsleMthdCode + "-lprice").html(titleLwetPc.toLocaleString());

												if(alVersus > 0){
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-blue");
													$("#" + codeNmsleMthdCode + "-price").addClass("fc-red");
												} else if(alVersus < 0) {
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-red");
													$("#" + codeNmsleMthdCode + "-price").addClass("fc-blue");
												} else {
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-red");
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-blue");
												}
											}

											sorin.chart.chartTitleInfo.topPc = titleTopPc;
											sorin.chart.chartTitleInfo.lwetPc = titleLwetPc;
										} else {
											if(currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == '/my/order/avrgDetail') {
												$(".realTimePrice2").text(addComma(currentPrice));	// 2023-04-11 변경사항 : 신규 모달창에 현재가 반영
												$(".type-open dd").text(addComma(currentPrice));
												$(".type-high dd").text(addComma(currentPrice));
												$(".type-low dd").text(addComma(currentPrice));

												//realTimePriceByOrder = currentPrice; // 주문 모달창에 필요한 현재단가(실시간) 담기

												if(alVersus > 0){
													$(".realTimePrice2").removeClass("down");
													$(".realTimePrice2").addClass("up");
												} else if(alVersus < 0) {
													$(".realTimePrice2").removeClass("up");
													$(".realTimePrice2").addClass("down");
												} else {
													$(".realTimePrice2").removeClass("up");
													$(".realTimePrice2").removeClass("down");
												}

												goodsCurrentPrice = currentPrice;
												titlePreminumChange(addComma(currentPrice), alRate.toFixed(2));

												//결제 모달창에만 적용
												if ($("#sorinModalOrder").hasClass("active") === true) {
													setOrderModalPrice(currentPrice);
												}
											} else {
												$("#" + codeNmsleMthdCode + "-price").html(" " + currentPrice.toLocaleString() + " " + '<span class="txt">KRW</span>');
												$("#" + codeNmsleMthdCode + "-mprice").html(currentPrice.toLocaleString());
												$("#" + codeNmsleMthdCode + "-hprice").html(currentPrice.toLocaleString());
												$("#" + codeNmsleMthdCode + "-lprice").html(currentPrice.toLocaleString());

												if(alVersus > 0){
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-blue");
													$("#" + codeNmsleMthdCode + "-price").addClass("fc-red");
												} else if(alVersus < 0) {
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-red");
													$("#" + codeNmsleMthdCode + "-price").addClass("fc-blue");
												} else {
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-red");
													$("#" + codeNmsleMthdCode + "-price").removeClass("fc-blue");
												}
											}

											sorin.chart.chartTitleInfo.beginPc = currentPrice;
											sorin.chart.chartTitleInfo.topPc = currentPrice;
											sorin.chart.chartTitleInfo.lwetPc = currentPrice;
										}
										$("#" + codeNmsleMthdCode + "-rate").html(" " + alRate.toFixed(2) + "%");
										// 			$("#cRate").html(alRate.toFixed(2) + "%");

										/* main 알림 설정 */
										var alarmAlRate = alRate.toFixed(2) + "%";
										//대비가격
										compareMetal(result, alVersus, alarmAlRate);

										if(alVersus > 0){
											$("#" + codeNmsleMthdCode + "-sum").removeClass("down");
											$("#" + codeNmsleMthdCode + "-sum").addClass("up");

											//로그인 할 경우 실시간 타이틀 설정 (상승)
											//로그인/비로그인 차트 OnOff loginStatusMap.loginYn
											if(chartListStomp.codeNm == sorin.chart.metalNm){
												$(document).prop('title', "[서린닷컴] LIVE " + chartListStomp.codeNm + " " + addComma(currentPrice) + " " + "▲" + alRate.toFixed(2) + "%");
											}
										} else if(alVersus < 0) {
											$("#" + codeNmsleMthdCode + "-sum").removeClass("up");
											$("#" + codeNmsleMthdCode + "-sum").addClass("down");

											//로그인 할 경우 실시간 타이틀 설정 (하락)
											//로그인/비로그인 차트 OnOff loginStatusMap.loginYn
											if(chartListStomp.codeNm == sorin.chart.metalNm){
												$(document).prop('title', "[서린닷컴] LIVE " + chartListStomp.codeNm + " " + addComma(currentPrice) + " " + "▼" + alRate.toFixed(2) + "%");
											}
										} else {
											$("#" + codeNmsleMthdCode + "-sum").removeClass("up");
											$("#" + codeNmsleMthdCode + "-sum").removeClass("down");

											//로그인 할 경우 실시간 타이틀 설정 (지속)
											//로그인/비로그인 차트 OnOff loginStatusMap.loginYn
											if(chartListStomp.codeNm == sorin.chart.metalNm){
												$(document).prop('title', "[서린닷컴] LIVE " + chartListStomp.codeNm + " " + addComma(currentPrice) + " " + "-" + alRate.toFixed(2) + "%");
											}
										}

										$("#" + codeNmsleMthdCode + "-gap").html(alVersus.toLocaleString());
									}


									//권역별 가격
									for(var p = 0; p < sorin.chart.selPcChartList.preminumSelListVO.length; p++) {
										let preminumSelVO = sorin.chart.selPcChartList.preminumSelListVO[p];
										if(preminumSelVO.itmSn == result.itmSn
											&& preminumSelVO.dstrctLclsfCode == result.dstrctLclsfCode
											&& preminumSelVO.brandGroupCode == result.brandGroupCode
											&& preminumSelVO.brandCode == result.brandCode) {

											var itmSelPc = result.endPc;
											var itemVersus = itmSelPc - Number(preminumSelVO.agoEndPc);
											var chartRate = 0;

											//대비 비율
											if(Number(preminumSelVO.agoEndPc) == 0){
												chartRate = 100;
											} else {
												chartRate = (itmSelPc - Number(preminumSelVO.agoEndPc)) / Number(preminumSelVO.agoEndPc) * 100;
											}
											if(itemVersus == 0){
												$("#"+ chartListStomp.codeNm+chartListStomp.sleMthdCode +'EndPc'+ p).parent().removeClass("up");
												$("#"+ chartListStomp.codeNm+chartListStomp.sleMthdCode +'EndPc'+ p).parent().removeClass("down");
												$("#"+ chartListStomp.codeNm+chartListStomp.sleMthdCode +'Rate' + p).html(chartRate.toFixed(2) + "%");
											} else if(itemVersus > 0){
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'EndPc' + p).parent().removeClass("up");
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'EndPc' + p).parent().removeClass("down");
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'EndPc' + p).parent().addClass("up");
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'Rate'  + p).html("+"+chartRate.toFixed(2) + "%");
											} else if(itemVersus < 0){
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'EndPc' + p).parent().removeClass("up");
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'EndPc' + p).parent().removeClass("down");
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'EndPc' + p).parent().addClass("down");
												$("#" + chartListStomp.codeNm+chartListStomp.sleMthdCode + 'Rate'  + p).html(chartRate.toFixed(2) + "%");
											}

											//현재가
											$("#"+ chartListStomp.codeNm+chartListStomp.sleMthdCode +'EndPc'+ p).html(itmSelPc.toLocaleString());
				//			                $("#"+ chartListStomp.codeNm+chartListStomp.sleMthdCode +'Rate' + p).html(chartRate.toFixed(2) + "%");
										}
									}

									//시초가 수신됐을 때
									if(operateFlag && sorin.chart.pageSleMthd == "01") {
										$(".rChart-sum").removeClass("sum-type2");
										$(".rChart-sum").removeClass("sum-type3");
										$(".rChart-sum").addClass("sum-type1");
										frstPrcFlag[sorin.chart.pageMetal] = true;
									}
								}

								//상품검색 관심상품영역 라이브가격정보 갱신처리
								if(currentPage == "/pd/itemPriceSearch" && sorin.chart.pageSleMthd == "01") {
									var realTimePrices = $(".realTimePrice");
									var resultNm = result.metalCode + ',' + result.dstrctLclsfCode + ',' + result.itmSn + ',' + result.brandGroupCode + ',' + result.brandCode;
									if(realTimePrices.length > 0) {
										for(var j=0; j<5; j++) {
											var realTimePriceObj = realTimePrices.eq(j);
											var idAttrName = realTimePriceObj.attr("id");
											var nameAttrName = realTimePriceObj.attr("name");
											if(idAttrName != undefined) {
												if(nameAttrName == resultNm) {
													$("span[name="+idAttrName+"]").html(addComma(Number(result.endPc))+ "<span class='unit'> (원/MT)</span>");
												}
											}
										}
									}
								}

								if(currentPage == '/pd/justBuySearchItem' || currentPage == '/my/order/limit' || currentPage == '/pd/itemPriceMakeOrder' || currentPage == '/pd/itemPriceMakeOrderByInventory' || currentPage == '/my/order/avrgDetail') {

									if(sorin.chart.sleMthdCode == "01"
										&& sorin.chart.metalCode == result.metalCode
										&& sorin.chart.itmSn == result.itmSn
										&& sorin.chart.dstrctLclsfCode == result.dstrctLclsfCode
										&& sorin.chart.brandGroupCode == result.brandGroupCode
										&& sorin.chart.brandCode == result.brandCode) {

										$(".realTimePrice").text(addComma(Number(result.endPc)) + " (원/MT)");

										goodsCurrentPrice = addComma(Number(result.endPc));

										let chartTitleInfo = sorin.chart.chartTitleInfo;
										let endPcAgo = chartTitleInfo.endPcAgo;
										let alVersus = Number(result.endPc) - endPcAgo;

										if(alVersus > 0){
											$(".realTimePrice").css("color", "#fb1a31");
										} else if(alVersus < 0) {
											$(".realTimePrice").css("color", "#0962fc");
										} else {
											$(".realTimePrice").css("color", "#000");
										}

										cstmrSlePcRltmSnByOrder = result.slePcRltmSn; // LIVE만 해당
										cstmrLmePcRltmSnByOrder = result.lmePcRltmSn; // LIVE만 해당
										cstmrEhgtPcRltmSnByOrder = result.ehgtPcRltmSn; // LIVE만 해당

										//주문 모달창의 [중량변동금, 배송비, VAT, 결제요청금액] 실시간 계산
										if($("#sorinModalOrder").hasClass("active") && $('input[name="orderMethod"]:checked').val() != '지정가') {
											calcOrderModalInfo();
										}
									}
								}
							}

							if (currentPage == '/pd/itemPriceBasket') {
								if (!sorin.validation.isEmpty(jsonPreminumPriceList)) {
									for(var i = 0; i < jsonPreminumPriceList.length; i++) {
										var jsonPreminumPriceInfo = jsonPreminumPriceList[i];
										if (jsonPreminumPriceInfo.sleMthdCode == '01'
											&& jsonPreminumPriceInfo.metalCode == result.metalCode
											&& jsonPreminumPriceInfo.itmSn == result.itmSn
											&& jsonPreminumPriceInfo.dstrctLclsfCode == result.dstrctLclsfCode
											&& jsonPreminumPriceInfo.brandGroupCode == result.brandGroupCode
											&& jsonPreminumPriceInfo.brandCode == result.brandCode) {

											var basketEndPc = result.endPc;
											var basketPastEndPc = result.pastEndPc;
											var basketAlVersus = Number(basketEndPc) - basketPastEndPc;
											var basketInfoId = jsonPreminumPriceInfo.metalCode + jsonPreminumPriceInfo.dstrctLclsfCode + jsonPreminumPriceInfo.itmSn + jsonPreminumPriceInfo.brandGroupCode + jsonPreminumPriceInfo.brandCode;

											$("#AllMetal" + basketInfoId).text(addComma(basketEndPc) + " (원/MT)");
											$("#" + basketInfoId).text(addComma(basketEndPc) + " (원/MT)");

											if(basketAlVersus > 0){
												$("#AllMetal" + basketInfoId).removeClass("down");
												$("#AllMetal" + basketInfoId).addClass("up");
												$("#" + basketInfoId).removeClass("down");
												$("#" + basketInfoId).addClass("up");
											} else if(basketAlVersus < 0) {
												$("#AllMetal" + basketInfoId).removeClass("up");
												$("#AllMetal" + basketInfoId).addClass("down");
												$("#" + basketInfoId).removeClass("up");
												$("#" + basketInfoId).addClass("down");
											} else {
												$("#AllMetal" + basketInfoId).removeClass("up");
												$("#AllMetal" + basketInfoId).removeClass("down");
												$("#" + basketInfoId).removeClass("up");
												$("#" + basketInfoId).removeClass("down");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		});
	}
}

function setOrderModalPrice(currentPrice) {
    var preEndPc = Number($("#preEndPc").val());
    $("#limit-order-modal-realTimePrice").text(addComma(currentPrice));
    let limit_order_modal_versus = 0;
    let limit_order_modal_rate = 0;
    if (!Object.is(preEndPc, NaN) && preEndPc > 0) {
        limit_order_modal_versus = Number(currentPrice) - Number(preEndPc);
        limit_order_modal_rate = ((Number(limit_order_modal_versus) / Number(preEndPc)) * 100).toFixed(2);
    }
    if (limit_order_modal_versus > 0) {
       $(".limit-order-modal-realTimePrice").removeClass("down");
       $(".limit-order-modal-realTimePrice").addClass("up");
       $("#limit-order-modal-versus").text("+"+addComma(limit_order_modal_versus));
       $("#limit-order-modal-rate").text("+"+addComma(limit_order_modal_rate)+"%");
   } else if (limit_order_modal_versus < 0) {
       $(".limit-order-modal-realTimePrice").removeClass("up");
       $(".limit-order-modal-realTimePrice").addClass("down");
       $("#limit-order-modal-versus").text(addComma(limit_order_modal_versus));
       $("#limit-order-modal-rate").text(addComma(limit_order_modal_rate)+"%");
   } else {
       $(".limit-order-modal-realTimePrice").removeClass("up");
       $(".limit-order-modal-realTimePrice").removeClass("down");
       $("#limit-order-modal-versus").text("");
       $("#limit-order-modal-rate").text("");
   }
}

function titlePreminumChange(price,rate){
  	let upDown	= rate >= 0 ? "▲":"▼";
  	let metalNm = sorin.chart.metalNm;
  	let title = '[서린닷컴] LIVE ' + metalNm + ' ' + price + ' ' + upDown + ' ' + rate;
  	price = addComma(price);
	$(document).prop('title', title);
}

function checkPriceData(checkType, priceData, chartSelTime, chartType) {
	let premiumKey = sorin.chart.metalCode + "_" + sorin.chart.itmSn + "_" + sorin.chart.dstrctLclsfCode + "_" + sorin.chart.brandGroupCode + "_" + sorin.chart.brandCode;
	let realTime = sorin.chart.getRealTime(premiumKey);
	let resultCurrentData = getCurrentData(premiumKey, chartType);
	let currentSelTime;
	//실시간종가 데이터
	let rtSelTime = sorin.validation.isEmpty(realTime.chartSelTime) ? date_to_str_realTime(new Date()) : realTime.chartSelTime;
	let rtEndPc;

	if(checkType == 'realTime') {
		rtEndPc = realTime.endPc;

		if (resultCurrentData.chartSelTime !=  undefined) {
			currentSelTime = date_to_str_realTime(new Date(resultCurrentData.chartSelTime));
		}
		let dataValue;

		if(new Date(rtSelTime).getTime() === new Date(currentSelTime).getTime()) {
			let resultBeginPc = resultCurrentData.beginPc;
			let resultTopPc = Number(resultCurrentData.topPc) > Number(rtEndPc) ? resultCurrentData.topPc : rtEndPc;
			let resultLwetPc = Number(resultCurrentData.lwetPc) < Number(rtEndPc) ? resultCurrentData.lwetPc : rtEndPc;
			let resultEndPc = rtEndPc;

			dataValue = currentSelTime + "|" + resultBeginPc + "|" + resultTopPc + "|" + resultLwetPc + "|" + resultEndPc + "|" + 0;

// 			console.debug("4. 최종 현재봉만들기시작 (시고저종) \t", currentSelTime + "\t" + resultBeginPc + "\t" + resultTopPc + "\t" + resultLwetPc + "\t" + resultEndPc + "\t" + 0);
// 			console.debug("=============================================================================================================================================");

			let dataSource = [];
			dataSource.push("" + dataValue + "");
			rMateStock.changeAfterData("chart1", dataSource);

			setCurrentData(premiumKey, priceData, checkType, chartType, currentSelTime, resultCurrentData, rtSelTime, rtEndPc);

		} else if (new Date(rtSelTime).getTime() > new Date(currentSelTime).getTime()) {

			dataValue = rtSelTime + "|" + rtEndPc + "|" + rtEndPc + "|" + rtEndPc + "|" + rtEndPc + "|" + 0;

// 			console.debug("4. 최종 현재봉만들기시작 (종종종종) \t", rtSelTime + "\t" + rtEndPc + "\t" + rtEndPc + "\t" + rtEndPc + "\t" + rtEndPc + "\t" + 0);
// 			console.debug("=======================================================================================================================");

			let dataSource = [];
			dataSource.push("" + dataValue + "");
			rMateStock.changeAfterData("chart1", dataSource);

			setCurrentData(premiumKey, priceData, checkType, chartType, currentSelTime, resultCurrentData, rtSelTime, rtEndPc);
		}
	} else {
		currentSelTime = chartSelTime;

		setCurrentData(premiumKey, priceData, checkType, chartType, currentSelTime, resultCurrentData, rtSelTime, rtEndPc);
	}
}

function getCurrentData(premiumKey, chartType) {
	let resultCurrentData = {};
	let currentList = sorin.chart.currentList;

	if(currentList.size != 0) {
		let currentDataList = currentList.get(premiumKey);
		if(currentDataList != undefined) {
			for(let i = 0; i< currentDataList.length; i++) {
				let currentData = currentDataList[i];

				if(chartType == currentData.get('chartType')) {
					resultCurrentData.chartType = currentData.get('chartType');
					resultCurrentData.chartSelTime = currentData.get('chartSelTime');
					resultCurrentData.beginPc = currentData.get('beginPc');
					resultCurrentData.topPc = currentData.get('topPc');
					resultCurrentData.lwetPc = currentData.get('lwetPc');
					resultCurrentData.endPc = currentData.get('endPc');
					resultCurrentData.checkType = currentData.get('checkType');
				}
			}
		}
	}

	return resultCurrentData;
}

function setCurrentData(premiumKey, priceData, checkType, chartType, currentSelTime, resultCurrentData, rtSelTime, rtEndPc) {
	let beginPc;
	let topPc;
	let lwetPc;
	let endPc;

	if(checkType == 'realTime') {
		if(rtSelTime == currentSelTime) {
			beginPc = resultCurrentData.beginPc;
			topPc = resultCurrentData.topPc > Number(rtEndPc) ? resultCurrentData.topPc : rtEndPc;
			lwetPc = resultCurrentData.lwetPc < Number(rtEndPc) ? resultCurrentData.lwetPc : rtEndPc;
			endPc = rtEndPc;
		} else{
			beginPc = rtEndPc;
			topPc = rtEndPc;
			lwetPc = rtEndPc;
			endPc = rtEndPc;
		}
	} else {
		rtSelTime = currentSelTime;
		beginPc = priceData.beginPc;
		topPc = priceData.topPc;
		lwetPc = priceData.lwetPc;
		endPc = priceData.endPc;
	}

	let currentList = sorin.chart.currentList;

	if(currentList.size == 0) {
		let currentData = new Map();
		let currentDataList = new Array();

		currentData.set('chartType', chartType);
		currentData.set('chartSelTime', rtSelTime);
		currentData.set('beginPc', beginPc);
		currentData.set('topPc', topPc);
		currentData.set('lwetPc', lwetPc);
		currentData.set('endPc', endPc);
		currentData.set('checkType', checkType);

		currentDataList.push(currentData);
		sorin.chart.currentList.set(premiumKey, currentDataList);
	} else {
		let currentDataList = currentList.get(premiumKey);
		if(currentDataList != undefined) {
			let currentDataList = currentList.get(premiumKey);
			let matchFlag = false;

			for(let j = 0; j < currentDataList.length; j++) {

				if(chartType == currentDataList[j].get('chartType')) {
					let currentData = new Map();

					currentData.set('chartType', chartType);
					currentData.set('chartSelTime', rtSelTime);
					currentData.set('beginPc', beginPc);
					currentData.set('topPc', topPc);
					currentData.set('lwetPc', lwetPc);
					currentData.set('endPc', endPc);
					currentData.set('checkType', checkType);

					currentDataList[j] = currentData;

					matchFlag = true;
				}
			}

			if(!matchFlag) {
				let currentData = new Map();

				currentData.set('chartType', chartType);
				currentData.set('chartSelTime', rtSelTime);
				currentData.set('beginPc', beginPc);
				currentData.set('topPc', topPc);
				currentData.set('lwetPc', lwetPc);
				currentData.set('endPc', endPc);
				currentData.set('checkType', checkType);

				currentDataList.push(currentData);
			}
		} else {
			let currentData = new Map();
			let currentDataList = new Array();

			currentData.set('chartType', chartType);
			currentData.set('chartSelTime', rtSelTime);
			currentData.set('beginPc', beginPc);
			currentData.set('topPc', topPc);
			currentData.set('lwetPc', lwetPc);
			currentData.set('endPc', endPc);
			currentData.set('checkType', checkType);

			currentDataList.push(currentData);
			sorin.chart.currentList.set(premiumKey, currentDataList);
		}
	}
}

//현재가격, 기준매매가격 비교
function avgEndPcChange(chartTabRealtimeGbn){
	let metalCodeNm = sorin.chart.metalNm;

	if (headerOpenTimeCode == "20" || headerOpenTimeCode == "21" || headerOpenTimeCode == "23") {
		if(chartTabRealtimeGbn == 'chartTab') {
			requestGetAvgDeEndPriceAjax();
		}

		if(sorin.chart.avgDeEndPrice != {}) {
			for(var i = 0; i < sorin.chart.liveList.length; i++) {
				var liveInfo = sorin.chart.liveList[i];

				var date = new Date();

				if((sorin.chart.avgDeEndPrice.avgSelPc == '0') || (date.getDate() == "1")){
					sorin.chart.setChartSumTitle("avgPrice");
					chartSumTitle1 = true;
					chartSumTitle2 = true;
				} else {
					if(liveInfo.metalCode == sorin.chart.metalCode){
						let curEndpc = chartTabRealtimeGbn == 'chartTab' ? sorin.chart.selPcChartList.endPc : currentPrice;

						if(curEndpc < sorin.chart.avgDeEndPrice.avgSelPc) {
							sorin.chart.setChartSumTitle("avgPrice", '현재 서린닷컴 '+metalCodeNm+' 가격이 '+ Number(date.getMonth() + 1) +'월 누적 평균가격 ' + addComma(sorin.chart.avgDeEndPrice.avgSelPc) +'원 보다 저렴합니다 [ 누적 평균 : LME(CSP) '+addComma(sorin.chart.avgDeEndPrice.accmltLmeCsp)+' |  환율(최초매매) '+addComma(sorin.chart.avgDeEndPrice.accmltUsdCvtrate)+' ]');
							chartSumTitle1 = false;
							chartSumTitle2 = false;
						}else if(curEndpc > sorin.chart.avgDeEndPrice.avgSelPc) {
							sorin.chart.setChartSumTitle("avgPrice");
							chartSumTitle1 = true;
							chartSumTitle2 = true;
						}else if(curEndpc == sorin.chart.avgDeEndPrice.avgSelPc) {
							sorin.chart.setChartSumTitle("avgPrice");
						}
					}
				}
			}
		}
	}
}

function addComma(value) {
	if (sorin.validation.isEmpty(value)) {
		return '0';
	}
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//알림 설정
function compareMetal(result, alVersus, alarmAlRate) {

    if ($("#sorinModalAlarmMain").hasClass("active") || $("#sorinModalAlarmSearch").hasClass("active") || $("#sorinModalAlarmOrder").hasClass("active")) {
//         var hpPremiumPc = $("#hpPremiumPc").val();

		if (sorin.chart.itmSn == result.itmSn
			&& sorin.chart.dstrctLclsfCode == result.dstrctLclsfCode
			&& sorin.chart.brandGroupCode == result.brandGroupCode
			&& sorin.chart.brandCode == result.brandCode) {

// 	실시간가격 웹소켓 프리미엄가격포함수신으로 인한 로직변경 2023/07/10
//             if (hpPremiumPc != 0) {
//                 totalPc = Number(endPc) + Number(hpPremiumPc);
//                 if (isNaN(totalPc)) {
//                     totalPc = 0;
//                 }

                $("#currentPrice").text(result.endPc.toLocaleString());

                if (Number(alVersus) > 0) {
                    $("#currentPrice").removeClass("fc-blue"); //파랑
                    $("#currentPrice").addClass("fc-red"); //빨강
                    $("#currentPrice").next().text("+" + alarmAlRate);
                    $("#currentPrice").next().removeClass("fc-blue"); //파랑
					$("#currentPrice").next().addClass("fc-red"); //빨강
                } else if (Number(alVersus) < 0) {
                    $("#currentPrice").removeClass("fc-red");
                    $("#currentPrice").addClass("fc-blue");
                    $("#currentPrice").next().text(alarmAlRate);
                    $("#currentPrice").next().removeClass("fc-red");
					$("#currentPrice").next().addClass("fc-blue");
                } else {
                	$("#currentPrice").removeClass("fc-red");
                    $("#currentPrice").removeClass("fc-blue");
                    $("#currentPrice").next().removeClass("fc-blue"); //파랑
                    $("#currentPrice").next().removeClass("fc-red");
                }

//             }

        }
        else {
            return;
        }

    }
}

/**
 * 시간 포맷 변경 (yyyy/MM/dd hh:mm:ss)
 */
function date_to_str_realTime(format) {
    var year = format.getFullYear();

    var month = format.getMonth() + 1;
    if (month < 10) month = '0' + month;

    var date = format.getDate();
    if (date < 10) date = '0' + date;

    var hour = format.getHours();
    if (hour < 10) hour = '0' + hour;

    var min = format.getMinutes();
    if (min < 10) min = '0' + min;

    if(sorin.chart.type == "1minute") {
    	return year + "/" + month + "/" + date + " " + hour + ":" + min + ":00";
    } else if(sorin.chart.type == "30minute") {
    	return year + "/" + month + "/" + date + " " + hour + ":" + (min>= 30 ? "30": "00") + ":" + "00";
    } else if(sorin.chart.type == "60minute") {
    	return year + "/" + month + "/" + date + " " + hour + ":00:00";
    } else if(sorin.chart.type == "day") {
    	return year + "/" + month + "/" + date;
    } else if(sorin.chart.type == "month") {
    	return year + "/" + month + "/" + "01";
    } else {
    	return year + "/" + month + "/" + date + " " + hour + ":" + min + ":00";
    }
}

/**
 * 시간 포맷 변경 (yyyyMMdd)
 */
function date_to_str_realDate(format) {
    var year = format.getFullYear();

    var month = format.getMonth() + 1;
    if (month < 10) month = '0' + month;

    var date = format.getDate();
    if (date < 10) date = '0' + date;

    return year + month + date;

}

//authMetalMenu(state)
//	state = 1~4 :  임시회원, 계좌 상태별 팝업
//state = 5 :  간편회원, 메뉴 접근 불가 팝업

function switchHeaderType() {
	//moveToMain함수 ajax변경으로 인한 로그인구분처리 및 헤더부분 호출추가
	refreshHeader();

	switch (sorinAccount.type) {
		case '01':
			/*    if('01' != sorinAccount.mberSttusCode){
				   // 커뮤니티 메뉴, 마이페이지, 알림 설정, 배송 조회, 장바구니, ewallet 접근 불가
				   //마이페이지 접근시 정회원 전용 팝업알림 제거
				   //noAuthCmmntyMenu(); // 임시 회원
				   authMetalMenu();  // 임시 회원  (금속 메뉴 접근 불가)
			   } */

			if ('' == sorinAccount.secode || '04' == sorinAccount.secode) {
				authMetalMenu('5'); // 04-자금담당 (금속 메뉴 접근 불가)
			}

			$('#simplelogin-header').hide();
			$('#logout-header').hide();
			$('#login-header .username').html(sorinAccount.name);
			//$('#login-header .useremail').html(sorinAccount.email);

			//신규로 변경예정
			/*
		   if(sorinAccount.refndAcnutSttusCode == '02' || sorinAccount.refndAcnutSttusCode == '04') {
			  $('#login-header .refndSttus').html("시스템 오류입니다.<br>고객센터로 문의해 주세요.");
		   } else if(sorinAccount.refndAcnutSttusCode == '03') {
			  $('#login-header .refndSttus').html("하나은행 에스크로 선불금 관리대행<br>서비스의 동의가 필요합니다. <a href='https://biz.kebhana.com/esc/escn/index.do?menuItemId=wcesc800_100i' target='_blank'>동의하러가기</a>");
			  //$('#login-header .refndSttus').html("<a href='https://biz.kebhana.com/esc/escn/index.do?menuItemId=wcesc800_100i' target='_blank'><button type='button' class='btn-header-agreAt'>동의하러가기</button></a>");
		   } else if(sorinAccount.refndAcnutSttusCode == '') {
			  //관리자가 사용등록(7350)을 안한 상태
			  $('#login-header .refndSttus').html("관리자 승인 대기중입니다.");
		   } else if(sorinAccount.mberSttusCode == '03' && sorinAccount.refndAcnutSttusCode == '05') {
			  //임시회원상태이고 환불계좌상태가 최종응답완료일 경우
			  $('#login-header .refndSttus').html("관리자 승인 대기중입니다.");
		   } else {
			  $('#login-header .refndSttus').html("");
		   }
			  */
			//CSS SHOW display 설정
			let mberSttusCode = sorinAccount.mberSttusCode;
			let refndAcnutSttusCode = sorinAccount.refndAcnutSttusCode;


			//아래 소스코드 개선작업
			mberPopupChange(mberSttusCode, refndAcnutSttusCode);

			//임시회원 계좌상태별 팝업
			if (mberSttusCode == '03' && refndAcnutSttusCode == '') {				//임시회원
				authMetalMenu('1');			//하나은행 계좌 등록 중입니다.
			} else if (mberSttusCode == '03' && refndAcnutSttusCode == '01') {		//임시회원&환불계좌전송완료
				authMetalMenu('2');			//고객 전용 가상 계좌 준비중입니다.
			} else if (mberSttusCode == '03' && refndAcnutSttusCode == '03') {		//임시회원&응답완료
				authMetalMenu('3');			//선불금 관리대행 서비스 동의를 진행 중입니다.
			} else if (mberSttusCode == '03' && refndAcnutSttusCode == '05') {		//임시회원&최종응답완료
				authMetalMenu('4');			//거래회원 승인 대기 중 입니다.
			} else {
				//$('#login-header .refndSttus').html("");
			}

			/*
			if(mberSttusCode == '03' && refndAcnutSttusCode == '') {
					//#1 기업 회원 (환불계좌 X ,가상계좌 X, 에스크로 X, 회원승인 X )

					 $('#memberState1').css('display', 'block');
			   $('#memberState2').css('display', 'none');
			   $('#memberState3').css('display', 'none');
			   $('#memberState4').css('display', 'none');
			   $('#memberState5').css('display', 'none');

			} else if(mberSttusCode == '03' && refndAcnutSttusCode == '01') {
			  //#2 기업 임시회원 (환불계좌 O ,가상계좌 X, 에스크로 X, 회원승인 X )

				 $('#memberState1').css('display', 'none');
			   $('#memberState2').css('display', 'block');
			   $('#memberState3').css('display', 'none');
			   $('#memberState4').css('display', 'none');
			   $('#memberState5').css('display', 'none');

			} else if(mberSttusCode == '03' && refndAcnutSttusCode == '03') {
				  //#3 기업 임시회원 (환불계좌 O ,가상계좌 O, 에스크로 X, 회원승인 X )

				 $('#memberState1').css('display', 'none');
			   $('#memberState2').css('display', 'none');
			   $('#memberState3').css('display', 'block');
			   $('#memberState4').css('display', 'none');
			   $('#memberState5').css('display', 'none');

			} else if(mberSttusCode == '03' && refndAcnutSttusCode == '05') {
				  //#4 기업 임시회원 (환불계좌 O ,가상계좌 O, 에스크로 O, 회원승인 X )

				 $('#memberState1').css('display', 'none');
			   $('#memberState2').css('display', 'none');
			   $('#memberState3').css('display', 'none');
			   $('#memberState4').css('display', 'block');
			   $('#memberState5').css('display', 'none');

			} else if(mberSttusCode == '01') {
				  //#5 기업 정회원 (환불계좌 O ,가상계좌 O, 에스크로 O, 회원승인 O )

				 $('#memberState1').css('display', 'none');
			   $('#memberState2').css('display', 'none');
			   $('#memberState3').css('display', 'none');
			   $('#memberState4').css('display', 'none');
			   $('#memberState5').css('display', 'block');

			   //최근접속일자 >= 최종승인일자 가입완료팝업 표기 X
			   var headUtil = $('.util-list > ul');
			   if(sorinAccount.currentDt > sorinAccount.mberConfmProcessDt){

				   headUtil.removeClass('member-pop-on');
			   } else {
				   headUtil.addClass('member-pop-on');
			   }

			} else {
			  $('#login-header .refndSttus').html("");
			}*/

			$('#login-header').show();
			break;
		case '02':
			authMetalMenu('5');  // 간편 회원 (금속 메뉴 접근 불가)
			noAuthCmmntyMenu(); // 간편 회원 (커뮤니티 조회, 마이페이지 x)
			$('#logout-header').hide();
			$('#login-header').hide();
			$('#simplelogin-header .username').html(sorinAccount.name);
			$('#simplelogin-header .useremail').html(sorinAccount.email);
			$('#simplelogin-header').show();
			break;
		default:
			$('#simplelogin-header').hide();
			$('#login-header').hide();
			$('#logout-header').show();
	}

	setHeaderMenu();    // 헤더 메뉴
}

function setHeaderMenu() { // 헤더 메뉴
	sorin.ajax.postSetDataType('/selectHeaderMenu', '', '', false, function (data) {
		if (!sorin.validation.isEmpty(data)) {
			var input = "";
			for (var headerMenu of data.headerMenuList) {
				if(headerMenu.ctgryLevel == 1) {
					//하위메뉴 탐색
					var subMenuList = new Array();
					for(var headerMenu2 of data.headerMenuList) {
						if(headerMenu2.ctgryLevel == 2 && headerMenu2.upperCtgryNo == headerMenu.ctgryNo) {
							subMenuList.push(headerMenu2);
						}
					}

					if (headerMenu.subCtgryChk != null) {
						if(subMenuList != null && subMenuList.length > 0) {
							input += '<li class="has-depth">';
							input += '<a href="#" onclick="return false;">' + headerMenu.ctgryNm + '</a>';
						}
					}else {
						if (headerMenu.metalCode != null && headerMenu.sleMthdCode != null) {
							let menuIdParams = makeMenuActiveIdenty(headerMenu.menuUrl, JSON.stringify({ metalCode: headerMenu.metalCode, sleMthdCode: headerMenu.sleMthdCode, metalClCode: headerMenu.metalClCode }));

							input += '<li>';
							//input += '<a href="javascript:pageMove(\'' + headerMenu.menuUrl + '\', JSON.stringify({metalCode : \'' + headerMenu.metalCode + '\', sleMthdCode : \'' + headerMenu.sleMthdCode + '\', metalClCode : \'' + headerMenu.metalClCode + '\' }), \'' + "application/json" + '\', \'' + menuIdParams + '\');" class="metalMenu" id="headerMenuOrder' + menuIdParams + '">';
							input += '<a href="javascript:moveToMetalMenu(\'' + headerMenu.menuUrl + '\', \'' + headerMenu.metalCode + '\', \'' + headerMenu.sleMthdCode + '\', \'' + headerMenu.metalClCode + '\');" class="metalMenu" id="headerMenuOrder' + menuIdParams + '">';
							input += headerMenu.ctgryNm + '</a>';
						} else {
							input += '<li>';
							var cnvrsCode = "";

							//전환코드 세팅
							switch(headerMenu.menuUrl) {
								case '/fo/ev/loanCreditUseReqstInfo' :
									cnvrsCode = "0400"
									break;
								case '/fo/pr/evlPcList' :
									cnvrsCode = "0300"
									break;
								default :
									cnvrsCode = "0000"
							}
							input += '<a href="javascript:pageMove(\'' + headerMenu.menuUrl + '\', JSON.stringify({cnvrsCode : \'' + cnvrsCode + '\'}), \'application/json\', \'' + makeMenuActiveIdenty(headerMenu.menuUrl, '') + '\');" id="headerMenuOrder' + makeMenuActiveIdenty(headerMenu.menuUrl, '') + '">';
							input += headerMenu.ctgryNm + '</a>';
						}
					}

					if (subMenuList != null && subMenuList.length > 0) {
						input += '<div class="gnb-depth2">';
						input += '<ul>';
						for(var subMenu of subMenuList) {
							let menuIdParams = makeMenuActiveIdenty(subMenu.menuUrl, JSON.stringify({ metalCode: subMenu.metalCode, sleMthdCode: subMenu.sleMthdCode, metalClCode: subMenu.metalClCode }));

							input += '<li>';
							input += '<a href="javascript:moveToMetalMenu(\'' + subMenu.menuUrl + '\', \'' + subMenu.metalCode + '\', \'' + subMenu.sleMthdCode + '\', \'' + subMenu.metalClCode + '\');" class="metalMenu" id="headerMenuOrder' + menuIdParams + '">';
							input += subMenu.ctgryNm + '</a>';
							input += '</li>';
						}
						input += '</ul>';
						input += '</div>';
					}

					input += '</li>';
				}
			}

		}

		$("#headerNav ul").empty();
		$("#headerNav ul").append(input);

	});

}

function refreshHeader() {
	//금속정보갱신
	requestGetLiveListAjax("", sorin.chart.pageSleMthd, function (result) {
		if(!sorin.validation.isEmpty(result)) {
			sorin.chart.liveList = result.liveList;

			for(var i = 0; i < sorin.chart.liveList.length; i++) {
				var liveInfoAjax = sorin.chart.liveList[i];

				if(liveInfoAjax.metalCode == sorin.chart.pageMetal) {
					sorin.chart.metalCode = liveInfoAjax.metalCode;
					sorin.chart.itmSn = liveInfoAjax.itmSn;
					sorin.chart.dstrctLclsfCode = liveInfoAjax.dstrctLclsfCode;
					sorin.chart.brandGroupCode = liveInfoAjax.brandGroupCode;
					sorin.chart.brandCode = liveInfoAjax.brandCode;
					sorin.chart.sleMthdCode = liveInfoAjax.sleMthdCode;
					sorin.chart.metalNm = liveInfoAjax.codeNm;
				}
			}
		}
	});

	if (sorinAccount.type == '01' || sorinAccount.type == '02') {
		sorin.ajax.getSetDataType('/main/eWalletAccount', { 'entrpsNo': sorinAccount.entrpsNo }, '', false, function (data) {
			$('.eWalletAccount').html(data == '' ? 0 : data);
		});
	}

	noticeSwiper.removeAllSlides();
	noticeSwiper.autoplay.stop();
	if(sorin.validation.isUndefined(noticeData)){
		sorin.ajax.getSetContentType("/main/topnotice", "", "", false, function (data) {
			if(sorin.validation.isNull(data)){
				var div = $('<div class="swiper-slide sum-title">운영시간 | 평일 하절기 9:00 ~17:00, 동절기 10:00 ~17:00 (주말, 공휴일, LME휴일은 휴무)</div>');
				noticeSwiper.appendSlide(div);
				noticeData = null;
	        } else {
	        	for (var notice of data) {
					var div = $('<div class="swiper-slide"><a href="javascript:;"><span>' + notice.noticeSj + '</span></a></div>');
					var param = '';
					div.attr('onclick', "pageMove('/fo/notice/noticeDtls',JSON.stringify({'noticeNo' : '" + notice.noticeNo + "'}), 'application/json','csfaqcsfFaqViews')")
					noticeSwiper.appendSlide(div);
				}
	        	noticeData = data;
	        }
		});
	} else {
		if(sorin.validation.isNull(noticeData)){
			var div = $('<div class="swiper-slide sum-title">운영시간 | 평일 하절기 9:00 ~17:00, 동절기 10:00 ~17:00 (주말, 공휴일, LME휴일은 휴무)</div>');
			noticeSwiper.appendSlide(div);
        } else {
    		for(var notice of noticeData) {
				var div = $('<div class="swiper-slide"><a href="javascript:;"><span>' + notice.noticeSj + '</span></a></div>');
				var param = '';
				div.attr('onclick', "pageMove('/fo/notice/noticeDtls',JSON.stringify({'noticeNo' : '" + notice.noticeNo + "'}), 'application/json','csfaqcsfFaqViews')")
				noticeSwiper.appendSlide(div);
            }
        }
	}
	noticeSwiper.update();
	if(!sorin.validation.isNull(noticeData) && noticeData.length > 1) {
		noticeSwiper.autoplay.start();
	}

	$('.eWalletAccount').unmask();
	sorin.mask.comma();
}

function requestGetLiveListAjax(metalCode, sleMthdCode, succesFunc) {
	var data = {
		metalCode: metalCode,
		sleMthdCode : sleMthdCode
	};

	sorin.ajax.customErrorCallback("post", "/chart/getLiveList", JSON.stringify(data), "json", "application/json", false, succesFunc, function (data){
		succesFunc(data);
	});
}

function requestGetSelPcChartListAjax(succesFunc) {
	let selPcChartObj = {
		"metalCode" : sorin.chart.metalCode,
		"itmSn" : sorin.chart.itmSn,
		"dstrctLclsfCode" : sorin.chart.dstrctLclsfCode,
		"brandGroupCode" : sorin.chart.brandGroupCode,
		"brandCode" : sorin.chart.brandCode
	}

	sorin.ajax.customErrorCallback("post", "/chart/getSelPcChartList", JSON.stringify(selPcChartObj), "json", "application/json", false, succesFunc, function (data){
		succesFunc(data);
	});
}

function requestGetSelMetalListAjax(succesFunc) {
	sorin.ajax.customErrorCallback("post", "/chart/getSelMetalList", "", "json", "application/json", false, succesFunc, function(data) {
		succesFunc(data);
	});
}
function requestGetAvgDeEndPriceAjax() {
	var avgParamObj = {
		"metalCode" : sorin.chart.metalCode
		,"itmSn" : sorin.chart.itmSn
		,"dstrctLclsfCode" : sorin.chart.dstrctLclsfCode
		,"brandGroupCode" : sorin.chart.brandGroupCode
		,"brandCode" : '0000000000'
	}

	sorin.ajax.postSetDataType("/chart/getAvgDeEndPrice", JSON.stringify(avgParamObj), "json", false, function(result) {
		if(!sorin.validation.isEmpty(result)) {
			sorin.chart.avgDeEndPrice = result;
		}
	});
}

function refreshMetalSelPcAjax() {
	//금속정보갱신
	requestGetLiveListAjax("", sorin.chart.pageSleMthd, function (result) {
		if(!sorin.validation.isEmpty(result)) {
			sorin.chart.liveList = result.liveList;

			for(var i = 0; i < sorin.chart.liveList.length; i++) {
				var liveInfoAjax = sorin.chart.liveList[i];

				if(liveInfoAjax.metalCode == sorin.chart.pageMetal) {
					sorin.chart.metalCode = liveInfoAjax.metalCode;
					sorin.chart.itmSn = liveInfoAjax.itmSn;
					sorin.chart.dstrctLclsfCode = liveInfoAjax.dstrctLclsfCode;
					sorin.chart.brandGroupCode = liveInfoAjax.brandGroupCode;
					sorin.chart.brandCode = liveInfoAjax.brandCode;
					sorin.chart.sleMthdCode = liveInfoAjax.sleMthdCode;
					sorin.chart.metalNm = liveInfoAjax.codeNm;
				}
			}
		}
	});

	//가격정보갱신
	requestGetSelPcChartListAjax(function (result) {
		if(!sorin.validation.isEmpty(result)) {
			sorin.chart.selPcChartList = result.selPcChartList;
			sorin.chart.chartTitleInfo.endPc = sorin.chart.selPcChartList.endPc;
			sorin.chart.chartTitleInfo.topPc = sorin.chart.selPcChartList.topPc;
			sorin.chart.chartTitleInfo.lwetPc = sorin.chart.selPcChartList.lwetPc;
			sorin.chart.chartTitleInfo.beginPc = sorin.chart.selPcChartList.beginPc;
			sorin.chart.chartTitleInfo.endPcAgo = sorin.chart.selPcChartList.endPcAgo;
			sorin.chart.chartTitleInfo.fluctuationRate = sorin.chart.selPcChartList.fluctuationRate;
			sorin.chart.chartTitleInfo.versusPc = sorin.chart.selPcChartList.versusPc;
			sorin.chart.chartTitleInfo.dstrctLclsfName = sorin.chart.selPcChartList.dstrctLclsfName;
			sorin.chart.chartTitleInfo.brandGroupNm = sorin.chart.selPcChartList.brandGroupNm;
			sorin.chart.chartTitleInfo.occrrncDe = sorin.chart.selPcChartList.occrrncDe;
			sorin.chart.chartTitleInfo.occrrncTime = sorin.chart.selPcChartList.occrrncTime;
		}
	});

	//기준가격설정정보갱신
	requestGetSelMetalListAjax(function (result) {
		if(!sorin.validation.isEmpty(result.preminumSelInfoList)) {
			sorin.chart.preminumSelInfoList = result.preminumSelInfoList;
		}

		if(!sorin.validation.isEmpty(result.entrpsMetalItmStdrVO)) {
			sorin.chart.entrpsMetalItmStdr = result.entrpsMetalItmStdrVO;
		}
	});
}