'use strict';
$(function() {
	sumTitleSwiper = new Swiper('#sumTitleWrap', {
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
	
	sumTitleNotice();
	
	initjQueryUI();
	
	mainRestdeInfo('initCreate');
	
	overArr = $("#overlay_type > ul > .selected");
	sideArr = $("#side_type > ul > .selected");
});

//차트 시간 기준 변경
function chartTime(type) {
	sorin.chart.type = type;
    setNewData(); //차트 호출
}

/**
 * rMate 주식차트를 최초 생성합니다.
 */
function rMateStockInitCreate() {
	let metalCode = sorin.chart.metalCode;
	let itmSn = sorin.chart.itmSn;
	let dstrctLclsfCode = sorin.chart.dstrctLclsfCode;
	let brandGroupCode = sorin.chart.brandGroupCode;
	let brandCode = sorin.chart.brandCode;
	let sleMthdCode = sorin.chart.sleMthdCode;
    
    //실시간 소켓 연결
    if (sleMthdCode != "02") {
        sorin.chart.type = "1minute";
    } else {
        sorin.chart.type = "month";
        $("#dataType").hide();
        $("#dataTypeZn").show();
    }
    
    //차트 데이터 시작
    rMateStock.showPreloader("chart1", "chartHolder");

    requestAjax(sorin.chart.type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode, sleMthdCode, function (data) {
        var result = data.result;
        
        var chartData = [];
        // 값이 없을경우 차트를 그리지 않음
        if (!sorin.validation.isEmpty(result)) {
            for (var i = 0; i < result.length; i++) {
				
				if (i == 0) {
					let sqlChartSelTime = date_to_str_realTime(new Date(result[0].chartSelTime));
					let premiumKey = metalCode + "_" + itmSn + "_" + dstrctLclsfCode + "_" + brandGroupCode + "_" + brandCode;
					let resultCurrentData = getCurrentData(premiumKey, sorin.chart.type);
					let currentSelTime;
					
					if (resultCurrentData.chartSelTime != undefined) {
						currentSelTime = date_to_str_realTime(new Date(resultCurrentData.chartSelTime));
					}
					
					if (new Date(sqlChartSelTime).getTime() < new Date(currentSelTime).getTime() && sorin.chart.pageMetal == metalCode && sorin.chart.pageSleMthd == '01') {
						chartData.push(currentSelTime + "|" + resultCurrentData.beginPc + "|" + resultCurrentData.topPc + "|" + resultCurrentData.lwetPc + "|" + resultCurrentData.endPc + "|0");
//						console.debug("1. 실시간 마지막 봉(SQL보다 나중시간 추가 시고저종) \t", currentSelTime + "\t" + resultCurrentData.beginPc + "\t" + resultCurrentData.topPc + "\t" + resultCurrentData.lwetPc + "\t" + resultCurrentData.endPc + "\t" + resultCurrentData.delngQy + "\t");
						checkPriceData('sqlData', resultCurrentData, currentSelTime, sorin.chart.type);
					} else {
//						console.debug("1. SQL 마지막 봉(시고저종) \t", sqlChartSelTime + "\t" + result[0].beginPc + "\t" + result[0].topPc + "\t" + result[0].lwetPc + "\t" + result[0].endPc + "\t" + result[0].delngQy + "\t");
						checkPriceData('sqlData', result[0], sqlChartSelTime, sorin.chart.type);
					}
				
                }
				
            	var chartSelTime = sorin.chart.date_to_str(new Date(result[i].chartSelTime));
            	var dataValue = chartSelTime + "|" + result[i].beginPc + "|" + result[i].topPc + "|" + result[i].lwetPc + "|" + result[i].endPc + "|" + result[i].delngQy;
            	
                chartData.push("" + dataValue + "");
            }
            //시초가 수신여부 확인
            var currDate = new Date();
            var lastReceivedDate = new Date(result[0].chartSelTime);
            if (currDate.getFullYear() === lastReceivedDate.getFullYear()
                && currDate.getMonth() === lastReceivedDate.getMonth()
                && currDate.getDate() === lastReceivedDate.getDate()) {
                frstPrcFlag[metalCode] = true;
            }
        }
        // 증권 차트 속성 설정
        var movingAvgLine = true;
        if (sleMthdCode == "02") { //판매구분별 이동추세선 여부
            movingAvgLine = false;
        } else {
            movingAvgLine = true;
        }
        
        createProps(movingAvgLine); 

        // rMate 증권 차트를 생성합니다.
        // 파라메터 설명 (순서대로)
        // 1. 차트의 id (임의로 지정하십시오. 단, 중복불가)
        // 2. 차트가 위치할 div 의 id (즉, 차트의 부모 div 의 id 입니다.)
        // 3. 차트의 상세 속성 설정 Object ( 현재는 디폴트로 출력하겠다는 의미임 )
        // 4. 차트의 데이터
        if($("#chart1").length > 0) {
        	rMateStock.destroy("chart1");
        }
        
        rMateStock.create("chart1", "chartHolder", props, chartData.reverse());
        rMateStock.setPropertys("chart1", props, true);

        rMateStock.setHorizontalAxisInterval("chart1", 5); // x축 차트 간격 조정
        rMateStock.removePreloader("chart1"); // 프리로더 제거
        
        //금속 코드 구분
        if (sleMthdCode == "02") {
            rMateStock.setTimeFrame("chart1", "month");
            rMateStock.setChartType("chart1", "line");
        } else {
            rMateStock.setTimeFrame("chart1", "minute");
        }

		rMateStock.zoomIn("chart1");
		
		newChartComplateYn = true;
    });
    //차트생성 완료 후 화면 노출
    $(".rcharts-wrap.nodata").hide().siblings().show();
}

//차트 화면 변경
function setNewData() {
	//차트타입변경시 완료Flag 초기화
	newChartComplateYn = false;
	
	let metalCode = sorin.chart.metalCode;
	let itmSn = sorin.chart.itmSn;
	let dstrctLclsfCode = sorin.chart.dstrctLclsfCode;
	let brandGroupCode = sorin.chart.brandGroupCode;
	let brandCode = sorin.chart.brandCode;
	let sleMthdCode = sorin.chart.sleMthdCode;
	let type = sorin.chart.type;

    //페이지 금속코드 설정(사이드카 관련)
    sorin.chart.pageMetal = metalCode;
    sorin.chart.pageSleMthd = sleMthdCode;

    rMateStock.showPreloader("chart1"); // 요청 중 지연을 위해 프리로더 표시
    rMateStock.setData("chart1", []);	// 차트 초기화
    requestAjax(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode, sleMthdCode, function (data) { // Ajax 요청해서 데이터 갱신
        var result = data.result;
        var chartData = [];
        // 값이 없을경우 차트를 그리지 않음
        if (!sorin.validation.isEmpty(result)) {
            for (var i = 0; i < result.length; i++) {
                
				if (i == 0) {
					let sqlChartSelTime = date_to_str_realTime(new Date(result[0].chartSelTime));
					let premiumKey = metalCode + "_" + itmSn + "_" + dstrctLclsfCode + "_" + brandGroupCode + "_" + brandCode;
					let resultCurrentData = getCurrentData(premiumKey, type);
					let currentSelTime;
					
					if (resultCurrentData.chartSelTime !=  undefined) {
						currentSelTime = date_to_str_realTime(new Date(resultCurrentData.chartSelTime));
					}
					
					if (new Date(sqlChartSelTime).getTime() < new Date(currentSelTime).getTime() && sorin.chart.pageMetal == metalCode && sorin.chart.pageSleMthd == '01') {
						chartData.push(currentSelTime + "|" + resultCurrentData.beginPc + "|" + resultCurrentData.topPc + "|" + resultCurrentData.lwetPc + "|" + resultCurrentData.endPc + "|0");
//						console.debug("1. 실시간 마지막 봉(SQL보다 나중시간 추가 시고저종) \t", currentSelTime + "\t" + resultCurrentData.beginPc + "\t" + resultCurrentData.topPc + "\t" + resultCurrentData.lwetPc + "\t" + resultCurrentData.endPc + "\t" + resultCurrentData.delngQy + "\t");
						checkPriceData('sqlData', resultCurrentData, currentSelTime, sorin.chart.type);
					} else {
//						console.debug("1. SQL 마지막 봉(시고저종) \t", sqlChartSelTime + "\t" + result[0].beginPc + "\t" + result[0].topPc + "\t" + result[0].lwetPc + "\t" + result[0].endPc + "\t" + result[0].delngQy + "\t");
						checkPriceData('sqlData', result[0], sqlChartSelTime, sorin.chart.type);
					}
                }
                
                var chartSelTime = sorin.chart.date_to_str(new Date(result[i].chartSelTime));
            	var dataValue = chartSelTime + "|" + result[i].beginPc + "|" + result[i].topPc + "|" + result[i].lwetPc + "|" + result[i].endPc + "|" + result[i].delngQy;
                chartData.push("" + dataValue + "");

                var chartData1 = chartData[0].split("|");

                //차트별 이동평균선 그리기
                var movingAvgLineType;
                if (sleMthdCode == "02" && type == "month") {
                    movingAvgLineType = false;
                } else {
                    movingAvgLineType = true;
                }

                props.mainChart.mainSeries.baseValue = chartData1[4];
                props.overlay.movingAvgLine.show = movingAvgLineType;
            }
            //시초가 수신여부 확인
            var currDate = new Date();
            var lastReceivedDate = new Date(result[0].chartSelTime);
            if (currDate.getFullYear() === lastReceivedDate.getFullYear()
                && currDate.getMonth() === lastReceivedDate.getMonth()
                && currDate.getDate() === lastReceivedDate.getDate()) {
                frstPrcFlag[metalCode] = true;
            }
        }

        rMateStock.setPropertys("chart1", props, true);
        
		switch (type) {
			case "1minute":
					rMateStock.setTimeFrame("chart1", "minute"); // 일봉인지, 주봉인지, 월봉인지 알림
					rMateStock.setHorizontalAxisInterval("chart1", 5); // x축 차트 간격 조정
				break;
					
			case "30minute":
					rMateStock.setTimeFrame("chart1", "minute"); // 일봉인지, 주봉인지, 월봉인지 알림
					rMateStock.setHorizontalAxisInterval("chart1", 1); // x축 차트 간격 조정
				break;
					
			case "60minute":
					rMateStock.setTimeFrame("chart1", "minute"); // 일봉인지, 주봉인지, 월봉인지 알림
					rMateStock.setHorizontalAxisInterval("chart1", 1); // x축 차트 간격 조정
				break;
					
			case "day":
					rMateStock.setTimeFrame("chart1", "day"); // 일봉인지, 주봉인지, 월봉인지 알림
				break;
					
			case "month":
					rMateStock.setTimeFrame("chart1", "month"); // 일봉인지, 주봉인지, 월봉인지 알림
					rMateStock.setHorizontalAxisInterval("chart1", 1); // x축 차트 간격 조정
				break;

			default:
					rMateStock.setTimeFrame("chart1", "month"); // 일봉인지, 주봉인지, 월봉인지 알림
				break;
		}
		
		rMateStock.setData("chart1", chartData.reverse());
		rMateStock.removePreloader("chart1");  // 프리로더 제거
		rMateStock.zoomIn("chart1");
		
		newChartComplateYn = true;

		//휴일, 사이드카 관련 화면 변경
		if (sleMthdCode == "01") {
			mainRestdeInfo('setNewData');
		} else {
			$(".sum-title").empty();
			$(".rChart-sum").removeClass("sum-type2");
			$(".rChart-sum").removeClass("sum-type3");
			$(".rChart-sum").addClass("sum-type1");
			$(".chart-sum-title").hide();
		}
	});
}

// 공지사항 조회
function sumTitleNotice(){
	
	if(sorin.validation.isUndefined(noticeData)){
		sorin.ajax.getSetContentType("/main/topnotice", "", "", false, function(data) {
	        sorin.chart.setChartSumTitleNotice(data);
	    });
	} else {
        sorin.chart.setChartSumTitleNotice(noticeData);
	}
}

/**
 * Ajax 요청하는 대표 함수입니다.
 * succesFunc : 성공 시 처리할 핸들러
 */
function requestAjax(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode, sleMthdCode, succesFunc) {
    // url 분기
    var url;
    if (sleMthdCode == "02") {
        url = "/chart/getItHghnetprcPurchsPrmpcDtl";
    } else {
        url = "/chart/pcMngtrngSelList";
    }

    var data;
    if (sleMthdCode == "02") {
        //아연 데이터
        data = {
            metalCode: metalCode
            , itmSn: itmSn
            , type: type
        };
    } else {
        data = {

            chartCount: 1000
            , type: type
            , metalCode: metalCode
            , itmSn: itmSn
            , dstrctLclsfCode: dstrctLclsfCode
            , brandGroupCode: brandGroupCode
            , brandCode: brandCode
        };
    }
	
	sorin.ajax.customErrorCallback("post", url, JSON.stringify(data), "json", "application/json", true, succesFunc, function () {
		rMateStock.removePreloader("chart1");
	});
}

//차트 휴일, 사이드카, 영업 관련 메시지 기능
function mainRestdeInfo(initGbn){
	//운영여부가 undefined로 조회되는 경우
	if((sorin.chart.pageSleMthd == "01" && !sorin.chart.headerRestDeLive) || (sorin.chart.pageSleMthd == "02" && !sorin.chart.headerRestDeFixed)) {
		$(".off-time:visible").addClass("hide");
		$(".rChart-sum").removeClass("sum-type1");
		$(".rChart-sum").removeClass("sum-type2");
		$(".rChart-sum").addClass("sum-type3");
		$(".sum-title").html("<li>서린닷컴 운영시간이 아닙니다.</li>");
		$(".chart-sum-title").show();
	} else {
		var mainGbn = currentPage == 'main' || currentPage == '/main/' ? 'main' : 'search';
		
		sorin.ajax.postSetDataType("/chart/getRestdeInfoList", mainGbn, "json", false, function(result) {
			
			if(!sorin.validation.isEmpty(result)) {
				sorin.chart.restdeInfoList = result.restdeInfoList;
				
				var mainOperationCodeList = ["20","21","22","23","24","25","40","41"];
				var operationTimeCodeList = ["22","24","25","30"];
				
				for(var i = 0; i < sorin.chart.restdeInfoList.length; i++) {
					var restdeInfo = sorin.chart.restdeInfoList[i];
					
					if(sorin.chart.pageMetal == restdeInfo.metalCode && sorin.chart.pageSleMthd == restdeInfo.sleMthdCode) {
						
						sorin.chart.headerRestdeAt = restdeInfo.baseRestdeAt; // 영업시간 여부
						sorin.chart.headerRestDeLive = restdeInfo.restdeAt; // 실시간 영업 여부
						
						if(restdeInfo.openTimeCode != '20' && restdeInfo.openTimeCode != '21' && restdeInfo.openTimeCode != '23') {
							resultTime = restdeInfo.topWaitTerm;
							sorin.chart.setChartSumTitle("restInfo", restdeInfo.chartStTitle, restdeInfo.chartEdTitle, resultTime);
						} else if((restdeInfo.openTimeCode == "20" || restdeInfo.openTimeCode == "21" || restdeInfo.openTimeCode == "23") && initGbn == 'initCreate') { // 운영중
							sorin.chart.setChartSumTitle("restInfo");
						}
						
						if(!mainOperationCodeList.includes(restdeInfo.openTimeCode)) {
							//영업시간 x
							if(restdeInfo.openTimeCode == "00"){
								//시간 노출이 없는경우
								$(".rChart-sum").removeClass("sum-type1");
								$(".rChart-sum").removeClass("sum-type2");
								$(".rChart-sum").addClass("sum-type3");
							}else if(restdeInfo.openTimeCode == "10") {
								//시간 노출이 있는경우
								$(".rChart-sum").removeClass("sum-type1");
								$(".rChart-sum").removeClass("sum-type2");
								$(".rChart-sum").addClass("sum-type3");
							}
						} else {
							//영업시간 O						
							if(!operationTimeCodeList.includes(restdeInfo.openTimeCode)) {
								//시간 노출 x
								$(".off-time").addClass("hide");
								if(restdeInfo.openTimeCode == "40" || restdeInfo.openTimeCode == "41") {
									sorin.chart.setChartSumTitle("restInfo", restdeInfo.chartStTitle, restdeInfo.chartEdTitle);
									$(".rChart-sum").removeClass("sum-type1");
									$(".rChart-sum").removeClass("sum-type2");
									$(".rChart-sum").addClass("sum-type3");
								} else if((restdeInfo.openTimeCode == "20" || restdeInfo.openTimeCode == "21" || restdeInfo.openTimeCode == "23") && initGbn == 'initCreate') { // 운영중
									sorin.chart.setChartSumTitle("restInfo");
									$(".rChart-sum").removeClass("sum-type2");
									$(".rChart-sum").removeClass("sum-type3");
									$(".rChart-sum").addClass("sum-type1");
								}
							}else{
								//시간 노출 O
								$(".off-time").removeClass("hide");
								//사이드카
								let metalNm = sorin.chart.metalNm;
								let sleMthdCode = sorin.chart.sleMthdCode;
								if("01" == $("#tbody" + metalNm + sleMthdCode).find("input[name=sleMthdCode]").val()) {
									if(restdeInfo.openTimeCode == "24" || restdeInfo.openTimeCode == "25"){
										sorin.chart.setChartSumTitle("restInfo", restdeInfo.chartStTitle, restdeInfo.chartEdTitle);
										$(".rChart-sum").removeClass("sum-type1");
										$(".rChart-sum").removeClass("sum-type3");
										$(".rChart-sum").addClass("sum-type2");
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

//차트 자동 리사이즈
$(window).off('resize').on('resize', function () {
    if ($("#rCharts").length > 0) {
        rMateStock.redraw("chart1");
    }
});