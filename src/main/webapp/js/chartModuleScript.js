'use strict';
$(function() {
	//환율정보조회
	sorin.ajax.postSetDataType("/chart/getEhgtRltm", "", "json", false, function(result) {
		if(!sorin.validation.isEmpty(result)) {
			$("[rtlmEndPc]").html(addComma(result.ehgtRltm));
		}
	});

	titleWidth = $(".sum-title-wrap").width();

	if(currentPage != 'main' && currentPage != '/main/') {
		$('#btnModalStdrPrice').hide();

		//메인페이지 상품검색 버튼표시
		let btnContent = '<button type="button" class="btn-stroke-md btn-alarm" onclick="sorinModalAlarmIdSearch()" data-target="sorinModalAlarmSearch">알림설정</button>'
				   + '<button type="button" class="btn-blue-md btn-buy" id="btnSearch">상품검색</button>';

		$("#btnsDiv").empty();
		$("#btnsDiv").html(btnContent);
		$("#btnModalAlarmIdSearch").show();
	} else {
		$("#btnModalAlarmIdSearch").hide();
		
		//검색페이지 구매하기 버튼표시
		let btnContent = '<button type="button" class="btn-stroke-md btn-alarm" onclick="sorinModalAlarmIdMain()" data-target="sorinModalAlarmMain">알림설정</button>'
				   + '<button type="button" class="btn-blue-md btn-buy" id="btnBuy">구매하기</button>';

		$("#btnsDiv").empty();
		$("#btnsDiv").html(btnContent);

		requestGetSelMetalListAjax(function (result) {
			if(!sorin.validation.isEmpty(result.preminumSelInfoList)) {
				sorin.chart.preminumSelInfoList = result.preminumSelInfoList;
			}

			if(!sorin.validation.isEmpty(result.entrpsMetalItmStdrVO)) {
				sorin.chart.entrpsMetalItmStdr = result.entrpsMetalItmStdrVO;
			}
		});


		if(sorin.chart.loginYn == 'Y' && (sorinAccount.refndAcnutSttusCode == "05" && sorinAccount.mberSttusCode == "01")) {
			var stdrPriceSelect1 = $('<select class="dropdown" id="stdrPriceMetalCode" desc="메탈" data-placeholder="선택"><option value="">선택</option></select>');
			for (var i = 0; i < sorin.chart.liveList.length; i++) {
			    var liveInfo = sorin.chart.liveList[i];
			    stdrPriceSelect1.append('<option value="' + liveInfo.metalCode + '">' + liveInfo.codeChrctrRefrnsix + '</option>');
			}

			stdrPriceSelect1.appendTo('#sorinModalDataArticle > article:first .setting-box');
			stdrPriceSelect1.select2({ minimumResultsForSearch: -1 });

			var stdrPriceSelect2 = $('<select class="dropdown" id="stdrPriceDlBgCode" desc="권역/브랜드" data-placeholder="선택"><option value="">선택</option></select>');
			stdrPriceSelect2.appendTo('#sorinModalDataArticle > article:last .setting-box');
			stdrPriceSelect2.select2();

			//기준가격설정 버튼 클릭 이벤트
			$("#btnModalStdrPrice").off("click").on("click", function() {
				if(Object.keys(sorin.chart.entrpsMetalItmStdr).length !== 0) {
					$("#stdrPriceMetalCode").val(sorin.chart.entrpsMetalItmStdr.metalCode).trigger("change");

					var dlBgCodeOption = [{id : '', text : '선택'}];
					for(var i= 0; i < sorin.chart.preminumSelInfoList.length; i++) {
						var preminumSelVO = sorin.chart.preminumSelInfoList[i];
						if(preminumSelVO.metalCode == sorin.chart.entrpsMetalItmStdr.metalCode) {
							dlBgCodeOption.push({ id : preminumSelVO.metalClCode + '/' + preminumSelVO.itmSn + '/' + preminumSelVO.dstrctLclsfCode + '/' + preminumSelVO.brandGroupCode, text : preminumSelVO.dstrctLclsfNm + ' / ' + preminumSelVO.brandGroupNm });
						}
					}

					dlBgCodeOption.sort(compareIds);
					$("#stdrPriceDlBgCode").attr("disabled", false);
					$("#stdrPriceDlBgCode").empty();
					$("#stdrPriceDlBgCode").select2({ data: dlBgCodeOption, minimumResultsForSearch: -1 }).trigger('change');

					$("#stdrPriceDlBgCode").val(sorin.chart.entrpsMetalItmStdr.metalClCode + '/' + sorin.chart.entrpsMetalItmStdr.itmSn
					+ '/' + sorin.chart.entrpsMetalItmStdr.dstrctLclsfCode + '/' + sorin.chart.entrpsMetalItmStdr.brandGroupCode).trigger("change");
				} else {
					$("#stdrPriceMetalCode").val("").trigger("change");
					$("#stdrPriceDlBgCode").val("").trigger("change");
					$("#stdrPriceDlBgCode").attr('disabled', true);
				}

				$("#sorinModalDataSetting").addClass('active');
			});

			//메탈별 권역/브랜드그룹 체인지
			$("#stdrPriceMetalCode").off("select2:select").on("select2:select", function(e) {
				e.preventDefault();

				if($("#stdrPriceMetalCode").select2("val") != '') {
					var dlBgCodeOption = [{id : '', text : '선택'}];
					for(var i= 0; i < sorin.chart.preminumSelInfoList.length; i++) {
						var preminumSelVO = sorin.chart.preminumSelInfoList[i];
						if(preminumSelVO.metalCode == $("#stdrPriceMetalCode").select2("val")) {
							dlBgCodeOption.push({ id : preminumSelVO.metalClCode + '/' + preminumSelVO.itmSn + '/' + preminumSelVO.dstrctLclsfCode + '/' + preminumSelVO.brandGroupCode, text : preminumSelVO.dstrctLclsfNm + ' / ' + preminumSelVO.brandGroupNm });
						}
					}

					dlBgCodeOption.sort(compareIds);
					$("#stdrPriceDlBgCode").attr("disabled", false);
					$("#stdrPriceDlBgCode").empty();
					$("#stdrPriceDlBgCode").select2({ data: dlBgCodeOption, minimumResultsForSearch: -1 }).trigger('change');
					$('#stdrPriceDlBgCode').select2("open");
				} else {
					$("#stdrPriceDlBgCode").attr('disabled', true);
				}
			});

			$("#saveEntrpsNoSelMetalInfo").off("click").on("click", function() {
				if($("#stdrPriceMetalCode").select2("val") != "" && $("#stdrPriceDlBgCode").select2("val") != "") {
					var entrpsNoSelMetalParam = {
						"metalCode" : $("#stdrPriceMetalCode").select2("val"),
						"sleMthdCode" : sorin.chart.pageSleMthd,
						"metalClCode" : $("#stdrPriceDlBgCode").select2("val").split('/')[0],
						"itmSn" : $("#stdrPriceDlBgCode").select2("val").split('/')[1],
						"dstrctLclsfCode" : $("#stdrPriceDlBgCode").select2("val").split('/')[2],
						"brandGroupCode" : $("#stdrPriceDlBgCode").select2("val").split('/')[3],
						"brandCode" : "0000000000"
					};

					sorin.ajax.postSetDataType("/chart/insertEntrpsMetalItmStdr", JSON.stringify(entrpsNoSelMetalParam), "json", false, function(data) {
						if(!sorin.validation.isEmpty(data)) {
							if (data.result == "success") {
								$('.pop-toast').fadeIn(300);

								setTimeout(function(){
									$('.pop-toast').fadeOut(300);
									moveToMain();
								},2000);
							}
						}
					});
				} else {
					var requiredMsg;
					if($("#stdrPriceMetalCode").select2("val") == ''){
						requiredMsg = '메탈';
					} else if($("#stdrPriceDlBgCode").select2("val") == '') {
						requiredMsg = '권역/브랜드그룹';
					}

					alertPopup(requiredMsg + '을 선택해주세요.', function() {
						$("#alertPopup").closest('.popup').removeClass('active');
						$("#sorinModalDataSetting").addClass('active');
					})
				}
			});

			$('#btnModalStdrPrice').show();
		}
	}

	var scopiInfoHtml; //차트 서린워터마크
	var chartTabAreaHtml; //차트탭
	var scopiHtml; // 금속마크
	var headProdHtml;
	var headTickerHtml;

	for(var i = 0; i < sorin.chart.liveList.length; i++) {
		var liveInfo = sorin.chart.liveList[i];
		var codeDcone = liveInfo.codeDcone;
		var mainItmPrSearchGbn;
		var entrpsStdrGbn;

		//메인/상품검색 차트정보표시구분
		if(currentPage != 'main' && currentPage != '/main/'){
			mainItmPrSearchGbn = (sorin.chart.pageMetal == liveInfo.metalCode) ? true : false;
		} else {
			if(sorin.chart.loginYn == 'N') {
				mainItmPrSearchGbn = (i == 0) ? true : false;
			} else {
				mainItmPrSearchGbn = (sorin.chart.pageMetal == liveInfo.metalCode) ? true : false;

				if(Object.keys(sorin.chart.entrpsMetalItmStdr).length !== 0) {
					entrpsStdrGbn = (sorin.chart.entrpsMetalItmStdr.metalCode == liveInfo.metalCode) ? true : false;
					sorin.chart.metalNm = sorin.chart.entrpsMetalItmStdr.codeNm;
				} else {
					entrpsStdrGbn = (sorin.chart.pageMetal == liveInfo.metalCode) ? true : false;
				}
			}
		}

		if(mainItmPrSearchGbn) {
			headProdHtml = '<span class="prod-' + liveInfo.codeNm + '-live" metalGroup="' + liveInfo.codeNm + liveInfo.sleMthdCode + '">' + liveInfo.codeChrctrRefrnsix + '</span>';

			headTickerHtml = '<span class="ticker-a sumTicker" id="' + liveInfo.codeNm + liveInfo.sleMthdCode + '-ticker">'
				+ '<span class="t-' + liveInfo.codeNm + '" id="t-' + liveInfo.codeNm + '" metalGroup="' + liveInfo.codeNm + liveInfo.sleMthdCode + '"></span>'
				+ '</span>';

			scopiInfoHtml = '<span class="sc-info-' + liveInfo.codeNm + liveInfo.sleMthdCode + '"><span class="t-bold">SCOPI-</span>'
				+ '<strong>' + liveInfo.codeChrctrRefrntwo + '</strong>'
				+ '(<strong>S</strong>orin <strong>C</strong>ommodity c<strong>O</strong>mposite <strong>P</strong>rice '
				+ '<strong>I</strong>ndex - <strong>' + codeDcone.substring(0, 1) + '</strong>' + codeDcone.substring(1, codeDcone.length) + ')</span>';

			if(entrpsStdrGbn) {
				chartTabAreaHtml = '<button type="button" class="btn-'+ liveInfo.codeNm + liveInfo.sleMthdCode +' active w-100">' + liveInfo.codeChrctrRefrnsix + '</button>';
			} else {
				chartTabAreaHtml = '<button type="button" class="btn-'+ liveInfo.codeNm + liveInfo.sleMthdCode +' w-100">' + liveInfo.codeChrctrRefrnsix + '</button>';
			}

			scopiHtml = '<span class="sc-' + liveInfo.codeNm + '" metalGroup="' + liveInfo.codeNm + liveInfo.sleMthdCode + '">SCOPI-' + liveInfo.codeChrctrRefrntwo + '</span>';
		}

		if((currentPage == 'main' || currentPage == '/main/') && i > 0) {
			headProdHtml += '<span class="prod-' + liveInfo.codeNm + '-live" metalGroup="' + liveInfo.codeNm + liveInfo.sleMthdCode + '" style="display: none">' + liveInfo.codeChrctrRefrnsix + '</span>';

			headTickerHtml += '<span class="ticker-a sumTicker" id="' + liveInfo.codeNm + liveInfo.sleMthdCode + '-ticker" style="display: none">'
				+ '<span class="t-' + liveInfo.codeNm + '" id="t-' + liveInfo.codeNm + '" metalGroup="' + liveInfo.codeNm + liveInfo.sleMthdCode + '"></span>'
				+ '</span>';

			scopiInfoHtml += '<span class="sc-info-' + liveInfo.codeNm + liveInfo.sleMthdCode + '" style="display: none"><span class="t-bold">SCOPI-</span>'
				+ '<strong>' + liveInfo.codeChrctrRefrntwo + '</strong>'
				+ '(<strong>S</strong>orin <strong>C</strong>ommodity c<strong>O</strong>mposite <strong>P</strong>rice '
				+ '<strong>I</strong>ndex - <strong>' + codeDcone.substring(0, 1) + '</strong>' + codeDcone.substring(1, codeDcone.length) + ')</span>';

			if(entrpsStdrGbn) {
				chartTabAreaHtml += '<button type="button" class="btn-'+ liveInfo.codeNm + liveInfo.sleMthdCode +' active w-100">' + liveInfo.codeChrctrRefrnsix + '</button>';
			} else {
				chartTabAreaHtml += '<button type="button" class="btn-'+ liveInfo.codeNm + liveInfo.sleMthdCode +' w-100">' + liveInfo.codeChrctrRefrnsix + '</button>';
			}

			scopiHtml += '<span class="sc-' + liveInfo.codeNm + '" metalGroup="' + liveInfo.codeNm + liveInfo.sleMthdCode + '" style="display: none">SCOPI-' + liveInfo.codeChrctrRefrntwo + '</span>';
		}
	}

	$('#headProd').empty();
	$('#headProd').html(headProdHtml);

	$('#headTicker').empty();
	$('#headTicker').html(headTickerHtml);

	$('#scopi').empty();
	$('#scopi').html(scopiHtml);

	$('#chartTabArea').empty();
	$('#chartTabArea').html(chartTabAreaHtml);

	$('#scopi-info').empty();
	$('#scopi-info').html(scopiInfoHtml);

	$("#chartTabArea .btn-"+sorin.chart.metalNm + sorin.chart.sleMthdCode).click();

	rMateStockInitCreate();

	$('.chart-preview-dim1').css('z-index', '1');
	$('.chart-preview-dim2').css('z-index', '1');

	//비로그인시 차트 5분 미리보기
	if(sorin.chart.loginYn == 'N' || (sorinAccount.refndAcnutSttusCode !== "05" || sorinAccount.mberSttusCode !== "01")) {
		let chartPrevDt = getCookie("chartPrevDt");
		let today = formatDate(new Date());
		if(chartPrevDt == today) {
	    	$("#chartModule").hide();
	    	sorin.chart.setChartSumTitle("chartPrev", "서린닷컴 <span class='col-yellow'>5분 미리보기가 종료</span>되었습니다. 서비스를 이용하실 고객님께서는 <span class='col-yellow'>기업회원 로그인</span> 후 사용해주세요.");
		} else {
			$("#chartModule").show();
			chartPreviewDim1();
		}
	} else {
		$("#chartModule").show();
	}

	if(headerOpenTimeCode == '40') {
		$('#msgAlOpening').show();
	} else {
		$('#msgAlOpening').hide();
	}
});

function compareIds(a, b) {
    if (a.id === "") {
        return -1; // 선택 값은 첫 번째로 정렬
    }
    if (b.id === "") {
        return 1; // 선택 값은 첫 번째로 정렬
    }

    var numA = parseInt(a.id.replace(/\D/g, ''), 10);
    var numB = parseInt(b.id.replace(/\D/g, ''), 10);
    return numA - numB;
}

$(document).off('click', '.btn-chart-preview').on('click', '.btn-chart-preview', function(){
	$('.chart-preview-dim1').fadeOut(300);
});

function formatDate(date) {
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var date = date.getDate();
	return year+"."+month+"."+date;
}

// 1-2. .chart-preview-dim2 > 30초 지나도 '로그인 하기' 버튼 클릭하지 않을 시 > .main-charts-wrap 영역 접힘
function chartPreviewDim2 () {
	var $chartPrevDim2 = $('.chart-preview-dim2');
	var $prevEndCount = $('.chart-preview-dim2 p.count-num')

	$chartPrevDim2.show();

	prevEndTimer = setInterval(function() {
		var sec = Number($prevEndCount.text());
		$prevEndCount.text(sec - 1);
	}, 1000);

	prevEndTimeout = setTimeout(function () {
		clearInterval(prevEndTimer);
		clearTimeout(prevEndTimeout);
		$chartPrevDim2.hide();
    	$("#chartModule").slideUp(300);
	}, 30 * 1000);
}

function chartPreviewDim1 () {
	var $chartPrevDim1 = $('.chart-preview-dim1');
	var $chartPrevCount = $('.chart-preview-dim1 p.count-time');

	$chartPrevDim1.show();

	var endTime = 5 * 60 * 1000;
	var chartPrevRemain = getCookie("chartPrevRemain");
	var cookieExpires = 24 * 60 * 60 * 1000;

	var chartPrevDt = getCookie("chartPrevDt");
	var today = formatDate(new Date());
	//자정마다 차트 미리보기 초기화를 위해 전날 등록된 쿠키 삭제
	if(!sorin.validation.isEmpty(chartPrevDt) && chartPrevDt < today) {
		setChartCookie("chartPrevDt", "", 0);
		setChartCookie("chartPrevRemain", "", 0);
	}

	var chartPrevRemain = getCookie("chartPrevRemain");
	if(chartPrevRemain) {
		$chartPrevCount.text(secToTimeFormat(chartPrevRemain));
		endTime -= endTime - chartPrevRemain * 1000;
		sorin.chart.setChartSumTitle("chartPrev", "서린닷컴 5분 미리보기가 <span class='col-yellow'>" + secToTimeFormat(chartPrevRemain) + "</span> 후에 종료됩니다. 서린닷컴 서비스를 이용하실 고객님께서는 <span class='col-yellow'>기업회원 로그인</span> 후 이용해주세요.");
	}

	chartPrevTimer = setInterval(function() {
		var sec = timeFormatToSec($chartPrevCount.text());
		sec--;

		$chartPrevCount.text(secToTimeFormat(sec));
		sorin.chart.setChartSumTitle("chartPrev", "서린닷컴 5분 미리보기가 <span class='col-yellow'>" + secToTimeFormat(sec) + "</span> 후에 종료됩니다. 서린닷컴 서비스를 이용하실 고객님께서는 <span class='col-yellow'>기업회원 로그인</span> 후 이용해주세요.");
		setChartCookie("chartPrevRemain", sec, cookieExpires);
	}, 1000);

	chartPrevTimeout = setTimeout(function() {
		clearInterval(chartPrevTimer);
		clearTimeout(chartPrevTimeout);

		$chartPrevDim1.hide();
		setChartCookie("chartPrevRemain", "", 0);
		setChartCookie("chartPrevDt", formatDate(new Date()), cookieExpires);

		chartPreviewDim2();

		sorin.chart.setChartSumTitle("chartPrev", "서린닷컴 <span class='col-yellow'>5분 미리보기가 종료</span>되었습니다. 서비스를 이용하실 고객님께서는 <span class='col-yellow'>기업회원 로그인</span> 후 사용해주세요.");
	}, endTime);
}

function timeFormatToSec(param) {
	var a = param.split(':');
	return Number(a[0]) * 60 + Number(a[1]);
}

function secToTimeFormat(param) {
	var min = Math.floor(param / 60);
	var sec = param % 60;
	return ('0' + min).slice('-2') + ':' + ('0' + sec).slice('-2')
}

// 차트상단 가격, 비율, Document 타이틀 변경
function titleChange() {
	let price = sorin.chart.selPcChartList.endPc;
	let rate = sorin.chart.selPcChartList.fluctuationRate;
	let upDown = rate >= 0 ? "▲" : "▼";

	$(document).prop('title', "[서린닷컴] LIVE AL " + addComma(price) + " " + upDown + " " + rate);

}

function addComma(value) {
	if (sorin.validation.isEmpty(value)) {
		return '0';
	}
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//전광판 내 문구 너비 저장을 위한 변수
var titleWidth = 0;
$(document).off('DOMNodeInserted', ".chart-sum-title .sum-title-wrap").on('DOMNodeInserted', ".chart-sum-title .sum-title-wrap", function(e) {
	var currDuration = ($(".sum-title-wrap").css("animationDuration")).slice(0, -1);
	var currDistance = titleWidth + $(".chart-title-area").width();

	var newWidth = $(".sum-title-wrap").width();
	var newDistance = newWidth + $(".chart-title-area").width();
	var newDuration = (currDuration/currDistance) * newDistance;

    $(".sum-title-wrap").css("animationDuration", newDuration + 's');
    e.preventDefault();
    titleWidth = newWidth;
});

$(document).off('click','.chart-tab-area > button').on('click','.chart-tab-area > button', function(e) {
	e.preventDefault;

	let price;
	let rate;
	let upDown;
	let selMetal;

	if (sorin.chart.liveList.length > 0 ) {
		for(var i = 0; i < sorin.chart.liveList.length; i++) {
			var liveInfo = sorin.chart.liveList[i];

			if ( $(this).hasClass('btn-' + liveInfo.codeNm + liveInfo.sleMthdCode) ) {
				$('.chart-tab-area .btn-' + liveInfo.codeNm + liveInfo.sleMthdCode).addClass('active').siblings().removeClass('active');  // 버튼
				$('#tbody' + liveInfo.codeNm + liveInfo.sleMthdCode).show().siblings('div[id^="tbody"]').hide();      // 테이블
				$('#headProd > .prod-' + liveInfo.codeNm + liveInfo.sleMthdCode).show().siblings().hide();             // 제품명
				$('#headTicker > #' + liveInfo.codeNm + liveInfo.sleMthdCode + '-ticker').show().siblings().hide();         // 제품명 > 기준가 설명
				$('.scopi > .sc-' + liveInfo.codeNm + liveInfo.sleMthdCode).show().siblings().hide();                  // 제품명 > scopi
				$('.scopi-info > .sc-info-' + liveInfo.codeNm + liveInfo.sleMthdCode).show().siblings().hide();        // scopi 설명

				$('[metalGroup=' + liveInfo.codeNm + liveInfo.sleMthdCode+']').show().siblings().not('#rCharts, #scopi-info').hide();

				if(currentPage != 'main' && currentPage != '/main/') {
					sorin.chart.metalCode = liveInfo.metalCode;
					sorin.chart.itmSn = liveInfo.itmSn;
					sorin.chart.dstrctLclsfCode = liveInfo.dstrctLclsfCode;
					sorin.chart.brandGroupCode = liveInfo.brandGroupCode;
					sorin.chart.brandCode = liveInfo.brandCode;
					sorin.chart.sleMthdCode = liveInfo.sleMthdCode;
					sorin.chart.metalNm = liveInfo.codeNm;

				} else {
					if(Object.keys(sorin.chart.entrpsMetalItmStdr).length !== 0 && liveInfo.metalCode == sorin.chart.entrpsMetalItmStdr.metalCode) {
						sorin.chart.metalCode = sorin.chart.entrpsMetalItmStdr.metalCode;
						sorin.chart.itmSn = sorin.chart.entrpsMetalItmStdr.itmSn;
						sorin.chart.dstrctLclsfCode = sorin.chart.entrpsMetalItmStdr.dstrctLclsfCode;
						sorin.chart.brandGroupCode = sorin.chart.entrpsMetalItmStdr.brandGroupCode;
						sorin.chart.brandCode = sorin.chart.entrpsMetalItmStdr.brandCode;
						sorin.chart.sleMthdCode = sorin.chart.entrpsMetalItmStdr.sleMthdCode;
						sorin.chart.metalNm = sorin.chart.entrpsMetalItmStdr.codeNm;
					} else {
						sorin.chart.metalCode = liveInfo.metalCode;
						sorin.chart.itmSn = liveInfo.itmSn;
						sorin.chart.dstrctLclsfCode = liveInfo.dstrctLclsfCode;
						sorin.chart.brandGroupCode = liveInfo.brandGroupCode;
						sorin.chart.brandCode = liveInfo.brandCode;
						sorin.chart.sleMthdCode = liveInfo.sleMthdCode;
						sorin.chart.metalNm = liveInfo.codeNm;
					}
				}

				sorin.chart.pageMetal = liveInfo.metalCode;
				sorin.chart.pageSleMthd = liveInfo.sleMthdCode;

				//메탈탭변경시 메탈운영정보 갱신
				for (var i = 0; i < restDataList.length; i++) {
					if (restDataList[i].metalCode == sorin.chart.pageMetal && restDataList[i].sleMthdCode == sorin.chart.pageSleMthd) {
						headerRestWaitTerm = restDataList[i].topWaitTerm; // 상단 시간차
						headerRestWaitNm = restDataList[i].topWaitNm; // 소켓 타이머 문구
						headerOpenTimeCode = restDataList[i].openTimeCode; //개장시간 범위 코드
						chartStTitleNm = restDataList[i].chartStTitle;
						chartEdTitleNm = restDataList[i].chartEdTitle;
					}
				}

				var tableListAreaHtml;
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

						$('#t-' + sorin.chart.metalNm).text(sorin.chart.selPcChartList.goodsNm);


						//차트타이틀 화면표시부분
						var sumLiveVersusPc = sorin.chart.selPcChartList.endPc - sorin.chart.selPcChartList.endPcAgo;
						var sumTypeClass;

						if (headerOpenTimeCode == '20' || headerOpenTimeCode == '21' || headerOpenTimeCode == '23') {
							$(".rChart-sum").removeClass("sum-type2");
							$(".rChart-sum").removeClass("sum-type3");
							$(".rChart-sum").addClass("sum-type1");
							sumTypeClass = 'sum-type1';
						} else if (headerOpenTimeCode == '22' || headerOpenTimeCode == '24' || headerOpenTimeCode == '25') {
							$(".rChart-sum").removeClass("sum-type1");
							$(".rChart-sum").removeClass("sum-type3");
							$(".rChart-sum").addClass("sum-type2");
							sumTypeClass = 'sum-type2';
						} else if (headerOpenTimeCode == '00' || headerOpenTimeCode == '10' || headerOpenTimeCode == '30'|| headerOpenTimeCode == '40' || headerOpenTimeCode == '41') {
							$(".rChart-sum").removeClass("sum-type1");
							$(".rChart-sum").removeClass("sum-type2");
							$(".rChart-sum").addClass("sum-type3");
							sumTypeClass = 'sum-type3';
						} else {
							$(".rChart-sum").removeClass("sum-type1");
							$(".rChart-sum").removeClass("sum-type2");
							$(".rChart-sum").addClass("sum-type3");
							sumTypeClass = 'sum-type3';
						}

						var rChartSumHtml = '<div class="rChart-sum '+ sumTypeClass +'" metalGroup="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'">';

						if(sumLiveVersusPc == 0) {
							rChartSumHtml += '<div class="rChart-current" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-sum">'
						} else if(sumLiveVersusPc > 0) {
							rChartSumHtml += '<div class="rChart-current up" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-sum">'
						} else if(sumLiveVersusPc < 0) {
							rChartSumHtml += '<div class="rChart-current down" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-sum">'
						}

						rChartSumHtml += '<span class="c-price sumPrice" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-price"> '
							+ addComma(sorin.chart.chartTitleInfo.endPc) + ' <span class="txt">KRW</span></span>'
							+ '<span class="c-rate sumRate" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-rate">'
							+ sorin.chart.chartTitleInfo.fluctuationRate.toFixed(2) + '%</span>'
							+ '<span class="c-gap sumGap" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-gap">'
							+ addComma(sorin.chart.chartTitleInfo.versusPc) + '</span>'
							+ '<div class="desc" id="headDesc">'
							+ '<span class="desc-txt">' + sorin.chart.chartTitleInfo.dstrctLclsfName + '</span>'
							+ ' 보세창고 상차도 기준(<span class="brand">' + sorin.chart.chartTitleInfo.brandGroupNm + '</span>, 부가세 별도)'
							+ '</div></div>'
							+ '<div class="rChart-summary"><ul class="rChart-summ"><li>'
							+ '<span class="stit">시가</span> <span class="m-price" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-mprice"> '
							+ addComma(sorin.chart.chartTitleInfo.beginPc) + '</span></li><li>'
							+ '<span class="stit">고가</span> <span class="h-price" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-hprice">'
							+ addComma(sorin.chart.chartTitleInfo.topPc) + '</span></li><li>'
							+ '<span class="stit">저가</span> <span class="l-price" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-lprice">'
							+ addComma(sorin.chart.chartTitleInfo.lwetPc) + '</span></li><li>'
							+ '<span class="stit">전일가</span> <span class="y-price" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'-yprice">'
							+  addComma(sorin.chart.chartTitleInfo.endPcAgo) + '</li></ul></div>';

						$('#rChartSum').empty();
						$('#rChartSum').html(rChartSumHtml);

						//차트탭영역 화면표시부분
						tableListAreaHtml = '<div class="table-list-tbody" id="tbody'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'">'
							+ '<div class="table-list-thead"><ul class="th-text"><li>품목</li><li>현재가</li><li>등락률</li></ul></div>'
							+ '<div class="tb-list-section">'
							+ '<div class="tbody-title"><span class="tit">서린닷컴</span> <span class="txt">(KRW/MT)</span></div>'
							+ '<div class="list-inner al-sorin">';

						for(var i= 0; i < sorin.chart.selPcChartList.preminumSelListVO.length; i++) {
							var preminumSelVO = sorin.chart.selPcChartList.preminumSelListVO[i];

							if(preminumSelVO.versusPc == 0) {
								tableListAreaHtml +='<div class="l-inner">'
							} else if(preminumSelVO.versusPc > 0) {
								tableListAreaHtml += '<div class="l-inner up">'
							} else if(preminumSelVO.versusPc < 0) {
								tableListAreaHtml += '<div class="l-inner down">'
							}

							tableListAreaHtml += '<div class="c-wrhous">'
								+ '<span class="wrhous">' + preminumSelVO.dstrctLclsfNm + '/</span> <span class="brand-group">' + preminumSelVO.brandGroupNm + '</span>'
								+ '</div>'
								+ '<div class="c-price" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'EndPc' + i + '">'
								+ addComma(preminumSelVO.endPc)
								+ '</div>'
								+ '<div class="c-rate" id="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'Rate' + i + '">';

							if(preminumSelVO.versusPc > 0) {
								tableListAreaHtml += '+' + preminumSelVO.versusRate.toFixed(2) +'%';
							} else {
								tableListAreaHtml += preminumSelVO.versusRate.toFixed(2) +'%';
							}
							tableListAreaHtml += '</div></div>';
						}
						tableListAreaHtml += '</div></div>';
					}

					// 초기 타이틀 셋팅
					titleChange();
				});

				var liveFoldPpsHtml = '<span class="tit">조달청 <span class="unit">(KRW/MT)</span></span>';
				sorin.ajax.postSetDataType("/chart/getRvcmpnList", sorin.chart.pageMetal, "json", false, function(result) {
					if(!sorin.validation.isEmpty(result)) {
						tableListAreaHtml += '<div class="tb-list-section"><div class="tbody-title">'
							+ '<span class="tit">조달청</span> <span class="txt">(KRW/MT)</span>'
							+ '<button class="btn-vat-view" id="buttonVat'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'">부가세 별도</button></div>'
							+ '<div class="list-inner al-pps">';


						if(!sorin.validation.isEmpty(result.rvcmpnVOList)) {
							sorin.chart.rvcmpnVOList = result.rvcmpnVOList;
							for(var i = 0; i < sorin.chart.rvcmpnVOList.length; i++) {
								var rvcmpnVO = sorin.chart.rvcmpnVOList[i];

								liveFoldPpsHtml += '<div class="price-box" id="foldExistSarok_' + rvcmpnVO.brandGroupCode + '_' +rvcmpnVO.metalCode + '">'

								if(rvcmpnVO.sarokPc == rvcmpnVO.agoSarokPc) {
									tableListAreaHtml += '<div class="l-inner rvcmpn" id="existSarok_' + rvcmpnVO.brandGroupCode + '_' +rvcmpnVO.metalCode + '">';
								} else if (rvcmpnVO.sarokPc > rvcmpnVO.agoSarokPc) {
									tableListAreaHtml += '<div class="l-inner rvcmpn up" id="existSarok_' + rvcmpnVO.brandGroupCode + '_' +rvcmpnVO.metalCode + '">';
								} else if (rvcmpnVO.sarokPc < rvcmpnVO.agoSarokPc) {
									tableListAreaHtml += '<div class="l-inner rvcmpn down" id="existSarok_' + rvcmpnVO.brandGroupCode + '_' +rvcmpnVO.metalCode + '">';
								}

								if(sorin.chart.pageMetal == '1') {
									tableListAreaHtml += '<div class="c-wrhous"><span class="brand-group">아연</span></div>';
									liveFoldPpsHtml += '<span class="wrhous">아연</span>';
								} else if (sorin.chart.pageMetal == '5') {
									tableListAreaHtml += '<div class="c-wrhous"><span class="brand-group">구리(99.99%이상)</span></div>';
									liveFoldPpsHtml += '<span class="wrhous">구리(99.99%이상)</span>';
								} else {
									tableListAreaHtml += '<div class="c-wrhous"><span class="brand-group">' + rvcmpnVO.brandGroupName + '</span></div>';
									liveFoldPpsHtml += '<span class="wrhous">' + rvcmpnVO.brandGroupName + '</span>';
								}

								if(rvcmpnVO.sarokPc == rvcmpnVO.agoSarokPc) {
									liveFoldPpsHtml += '<div class="price">';
								} else if (rvcmpnVO.sarokPc > rvcmpnVO.agoSarokPc) {
									liveFoldPpsHtml += '<div class="price up">';
								} else if (rvcmpnVO.sarokPc < rvcmpnVO.agoSarokPc) {
									liveFoldPpsHtml += '<div class="price down">';
								}

								tableListAreaHtml += '<div class="c-price" nonVatSarokPc="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'">'
									+ addComma(rvcmpnVO.nonVatSarokPc) + '</div>'
									+ '<div class="c-price" sarokPc="'+ sorin.chart.metalNm + sorin.chart.sleMthdCode +'" style="display: none">'
									+ addComma(rvcmpnVO.sarokPc) + '</div>';

								liveFoldPpsHtml += addComma(rvcmpnVO.nonVatSarokPc) + '</div></div>';

								if(rvcmpnVO.sarokPc > rvcmpnVO.agoSarokPc) {
									tableListAreaHtml += '<div class="c-rate">+' + rvcmpnVO.sarokPcRate.toFixed(2) + '%</div>';
								} else {
									tableListAreaHtml += '<div class="c-rate">' + rvcmpnVO.sarokPcRate.toFixed(2) + '%</div>';
								}

								if(i != sorin.chart.rvcmpnVOList.length -1) {
									liveFoldPpsHtml += '<span class="diver">/</span>';
								}

								tableListAreaHtml += '</div>';
							}
							liveFoldPpsHtml += '<span class="ml5 fc-lgray fs12">(부가세 미포함)</span>';
						} else {
							if(sorin.chart.pageMetal == '1') {
								tableListAreaHtml += '<div class="l-inner rvcmpn" id="sarok_31_' + sorin.chart.pageMetal + '">'
									+ '<div class="c-wrhous"><span class="brand-group">아연</span></div>'
									+ '<div class="c-rate" style="width: 50%" id="noSarok_31_' + sorin.chart.pageMetal + '">판매가격 제공 없음</div></div>';

									liveFoldPpsHtml += '<div class="price-box" id="foldSarok_31_' +sorin.chart.pageMetal + '">'
										+ '<span class="wrhous">아연&nbsp;</span>'
										+ '<div class="price" id="foldNoSarok_31_' +sorin.chart.pageMetal + '">판매가격 제공 없음</div>'
										+ '</div>'
										+ '<span class="ml5 fc-lgray fs12 hide" id="foldVatSarok_' +sorin.chart.pageMetal + '">(부가세 미포함)</span>';
							} else if (sorin.chart.pageMetal == '5') {
								tableListAreaHtml += '<div class="l-inner rvcmpn" id="sarok_11_' +sorin.chart.pageMetal + '">'
									+ '<div class="c-wrhous"><span class="brand-group">구리(99.99%이상)</span></div>'
									+ '<div class="c-rate" style="width: 50%" id="noSarok_11_' + sorin.chart.pageMetal + '">판매가격 제공 없음</div></div>';

								liveFoldPpsHtml += '<div class="price-box" id="foldSarok_11_' +sorin.chart.pageMetal + '">'
										+ '<span class="wrhous">구리(99.99%이상)&nbsp;</span>'
										+ '<div class="price" id="foldNoSarok_11_' +sorin.chart.pageMetal + '">판매가격 제공 없음</div>'
										+ '</div>'
										+ '<span class="ml5 fc-lgray fs12 hide" id="foldVatSarok_' +sorin.chart.pageMetal + '">(부가세 미포함)</span>';
							} else if(sorin.chart.pageMetal == '7') {
								tableListAreaHtml += '<div class="l-inner rvcmpn" id="sarok_01_' +sorin.chart.pageMetal + '">'
									+ '<div class="c-wrhous"><span class="brand-group">서구산</span></div>'
									+ '<div class="c-rate" style="width: 50%" id="noSarok_01_' + sorin.chart.pageMetal + '">판매가격 제공 없음</div></div>'
									+ '<div class="l-inner rvcmpn" id="sarok_02_' +sorin.chart.pageMetal + '">'
									+ '<div class="c-wrhous"><span class="brand-group">비서구산</span></div>'
									+ '<div class="c-rate" style="width: 50%" id="noSarok_02_' + sorin.chart.pageMetal + '">판매가격 제공 없음</div></div>';

								liveFoldPpsHtml += '<div class="price-box" id="foldSarok_01_' +sorin.chart.pageMetal + '">'
									+ '<span class="wrhous">서구산&nbsp;</span>'
									+ '<div class="price" id="foldNoSarok_01_' +sorin.chart.pageMetal + '">판매가격 제공 없음</div>'
									+ '</div>'
									+ '<span class="diver">/</span>'
									+ '<div class="price-box" id="foldSarok_02_' +sorin.chart.pageMetal + '">'
									+ '<span class="wrhous">비서구산&nbsp;</span>'
									+ '<div class="price" id="foldNoSarok_02_' +sorin.chart.pageMetal + '">판매가격 제공 없음</div>'
									+ '</div>'
									+ '<span class="ml5 fc-lgray fs12 hide" id="foldVatSarok_' +sorin.chart.pageMetal + '">(부가세 미포함)</span>';
							} else if(sorin.chart.pageMetal == '8') {
								tableListAreaHtml += '<div class="l-inner rvcmpn" id="sarok_51_' +sorin.chart.pageMetal + '">'
									+ '<div class="c-wrhous"><span class="brand-group">합금용</span></div>'
									+ '<div class="c-rate" style="width: 50%" id="noSarok_51_' + sorin.chart.pageMetal + '">판매가격 제공 없음</div></div>'
									+ '<div class="l-inner rvcmpn" id="sarok_52_' +sorin.chart.pageMetal + '">'
									+ '<div class="c-wrhous"><span class="brand-group">도금용</span></div>'
									+ '<div class="c-rate" style="width: 50%" id="noSarok_52_' + sorin.chart.pageMetal + '">판매가격 제공 없음</div></div>';

								liveFoldPpsHtml += '<div class="price-box" id="foldSarok_51_' +sorin.chart.pageMetal + '">'
									+ '<span class="wrhous">합금용&nbsp;</span>'
									+ '<div class="price" id="foldNoSarok_51_' +sorin.chart.pageMetal + '">판매가격 제공 없음</div>'
									+ '</div>'
									+ '<span class="diver">/</span>'
									+ '<div class="price-box" id="foldSarok_52_' +sorin.chart.pageMetal + '">'
									+ '<span class="wrhous">도금용&nbsp;</span>'
									+ '<div class="price" id="foldNoSarok_52_' +sorin.chart.pageMetal + '">판매가격 제공 없음</div>'
									+ '</div>'
									+ '<span class="ml5 fc-lgray fs12 hide" id="foldVatSarok_' +sorin.chart.pageMetal + '">(부가세 미포함)</span>';
							}
						}
					tableListAreaHtml += '</div></div>';
					}
				});

				sorin.ajax.postSetDataType("/chart/getPrLmePblntfPc", JSON.stringify({"metalCode" : sorin.chart.pageMetal}), "json", false, function(result) {
					if(!sorin.validation.isEmpty(result)) {
						sorin.chart.prLmePblntfPcBasVO = result.prLmePblntfPcBasVO;
						tableListAreaHtml += '<div class="tb-list-section"><div class="tbody-title"><span class="tit">LME</span> <span class="txt">(USD/MT)</span></div>'
							+ '<div class="list-inner al-lme">';

						var acthngPblntfSalePcRate = sorin.chart.prLmePblntfPcBasVO.acthngPblntfSalePcRate.toFixed(2);

						if(acthngPblntfSalePcRate == 0) {
							tableListAreaHtml += '<div class="l-inner">';
						} else if(acthngPblntfSalePcRate > 0) {
							tableListAreaHtml += '<div class="l-inner up">';
						} else if(acthngPblntfSalePcRate < 0) {
							tableListAreaHtml += '<div class="l-inner down">';
						}

						tableListAreaHtml += '<div class="c-lme"><span class="day">전일</span>&nbsp;<span class="off">OFFICIAL CASH</span></div>'
							+ '<div class="c-price">' + sorin.mask.commaAndFixed(sorin.chart.prLmePblntfPcBasVO.acthngPblntfSalePc.toFixed(2)) + '</div>';

						if(acthngPblntfSalePcRate > 0) {
							tableListAreaHtml += '<div class="c-rate">+' + sorin.chart.prLmePblntfPcBasVO.acthngPblntfSalePcRate.toFixed(2) + '%</div>';
						} else {
							tableListAreaHtml += '<div class="c-rate">' + sorin.chart.prLmePblntfPcBasVO.acthngPblntfSalePcRate.toFixed(2) + '%</div>';
						}

						tableListAreaHtml += '</div>';

						var endPcRate = sorin.chart.prLmePblntfPcBasVO.endPcRate.toFixed(2);
						if(endPcRate == 0) {
							tableListAreaHtml += '<div class="l-inner">';
						} else if(endPcRate > 0) {
							tableListAreaHtml += '<div class="l-inner up">';
						} else if(endPcRate < 0) {
							tableListAreaHtml += '<div class="l-inner down">';
						}

						tableListAreaHtml += '<div class="c-lme"><span class="day">전일</span>&nbsp;<span class="off">CLOSING CASH</span></div>'
							+ '<div class="c-price">' + sorin.mask.commaAndFixed(sorin.chart.prLmePblntfPcBasVO.endPc.toFixed(2)) + '</div>';

						if(endPcRate > 0) {
							tableListAreaHtml += '<div class="c-rate">+' + sorin.chart.prLmePblntfPcBasVO.endPcRate.toFixed(2) + '%</div>';
						} else {
							tableListAreaHtml += '<div class="c-rate">' + sorin.chart.prLmePblntfPcBasVO.endPcRate.toFixed(2) + '%</div>';
						}

						tableListAreaHtml += '</div>';

						var ftrsPblntfSalePcRate = sorin.chart.prLmePblntfPcBasVO.ftrsPblntfSalePcRate.toFixed(2);
						if(ftrsPblntfSalePcRate == 0) {
							tableListAreaHtml += '<div class="l-inner">';
						} else if(ftrsPblntfSalePcRate > 0) {
							tableListAreaHtml += '<div class="l-inner up">';
						} else if(ftrsPblntfSalePcRate < 0) {
							tableListAreaHtml += '<div class="l-inner down">';
						}

						tableListAreaHtml += '<div class="c-lme"><span class="day">전일</span>&nbsp;<span class="off">OFFICIAL 3M</span></div>'
							+ '<div class="c-price">' + sorin.mask.commaAndFixed(sorin.chart.prLmePblntfPcBasVO.ftrsPblntfSalePc.toFixed(2)) + '</div>';

						if(ftrsPblntfSalePcRate > 0) {
							tableListAreaHtml += '<div class="c-rate">+' + sorin.chart.prLmePblntfPcBasVO.ftrsPblntfSalePcRate.toFixed(2) + '%</div>';
						} else {
							tableListAreaHtml += '<div class="c-rate">' + sorin.chart.prLmePblntfPcBasVO.ftrsPblntfSalePcRate.toFixed(2) + '%</div>';
						}

						tableListAreaHtml += '</div>';

						var threemonthEndPcRate = sorin.chart.prLmePblntfPcBasVO.threemonthEndPcRate.toFixed(2);
						if(threemonthEndPcRate == 0) {
							tableListAreaHtml += '<div class="l-inner">';
						} else if(threemonthEndPcRate > 0) {
							tableListAreaHtml += '<div class="l-inner up">';
						} else if(threemonthEndPcRate < 0) {
							tableListAreaHtml += '<div class="l-inner down">';
						}

						tableListAreaHtml += '<div class="c-lme"> <span class="day">전일</span>&nbsp;<span class="off">CLOSING 3M</span></div>'
							+ '<div class="c-price">' + sorin.mask.commaAndFixed(sorin.chart.prLmePblntfPcBasVO.threemonthEndPc.toFixed(2)) + '</div>';

						if(threemonthEndPcRate > 0) {
							tableListAreaHtml += '<div class="c-rate">+' + sorin.chart.prLmePblntfPcBasVO.threemonthEndPcRate.toFixed(2) + '%</div>';
						} else {
							tableListAreaHtml += '<div class="c-rate">' + sorin.chart.prLmePblntfPcBasVO.threemonthEndPcRate.toFixed(2) + '%</div>';
						}

						tableListAreaHtml += '</div>';
					}
				});

				$('#tableListArea').empty();
				$('#tableListArea').html(tableListAreaHtml);

				$('#liveFoldPps').empty();
				$('#liveFoldPps').html(liveFoldPpsHtml);

				$(document).off('click','#buttonVat' + liveInfo.codeNm + liveInfo.sleMthdCode).on('click','#buttonVat' + liveInfo.codeNm + liveInfo.sleMthdCode, function() {
					if ( $(this).hasClass('active') ) {
						$(this).removeClass('active');
						$(this).text("부가세 별도");
						$('[nonVatSarokPc=' + sorin.chart.metalNm + sorin.chart.sleMthdCode + ']').show();
						$('[sarokPc=' + sorin.chart.metalNm + sorin.chart.sleMthdCode + ']').hide();
					} else {
						$(this).addClass('active');
						$(this).text("부가세 포함");
						$('[nonVatSarokPc=' + sorin.chart.metalNm + sorin.chart.sleMthdCode + ']').hide();
						$('[sarokPc=' + sorin.chart.metalNm + liveInfo.sleMthdCode + ']').show();
					}
				});

				//알림설정 버튼
				if("02" == sorin.chart.pageSleMthd){
					$("#sorinModalAlarmId").hide();
				} else {
					$("#sorinModalAlarmId").show();
				}

				$(".rcharts-wrap.nodata").hide().siblings().show();

				if($("#chartHolder").is(":visible") & sorin.chart.metalCode == sorin.chart.pageMetal) {
					//차트 상단 시간 변경
					var dataType = $("#dataType").find("li.on").attr("value");
					var txt = $("#chart_type").find("li.selected.on").text();

					price	= addComma($("#"+ liveInfo.codeNm + liveInfo.sleMthdCode + "-price").html().replace(/[^0-9]/g,''));
					rate	= $("#"+ liveInfo.codeNm + liveInfo.sleMthdCode + "-rate").html();
					upDown	= rate > 0 ? "▲":"▼";
					selMetal = liveInfo.codeNm;
					$(document).prop('title', "[서린닷컴] LIVE "+selMetal+" "+price+" "+ upDown+" "+ rate);

					if(currentPage == "main" || currentPage == "/main/") {
						sorin.chart.type = dataType;
						setNewData(); //차트 호출
					}
				}

				if(headerOpenTimeCode == '40') {
					$('#msgAlOpening').show();
				} else {
					$('#msgAlOpening').hide();
				}

				chartSumTitle1 = true;
				chartSumTitle2 = false;
				avgEndPcChange('chartTab');
			}
		}
	}
});

$(document).off('click', '.rChart-table .li:not(.thead, .close)').on('click', '.rChart-table .li:not(.thead, .close)', function(){
	let activeLine = $('.rChart-table .list > .li.active');
	let clipProd = activeLine.children().find('.c-prod strong').text();
	let clipTicker;
	let clipDesc;

    $(this).addClass('active').siblings().removeClass('active');
    clipProd = $(this).children().find('.c-prod strong').text();

	let metalName = $(this).children().find('.c-prod span').text();
    let headProd = $(this).parents('.charts-wrap').find('#headProd');
    let headTicker = $(this).parents('.charts-wrap').find('#headTicker');
    let headDesc = $(this).parents('.charts-wrap').find('#headDesc');

	let metalCode = $('.rChart-table .list > .li.active').find('input[name=metalCode]').val();
	let itmSn = $('.rChart-table .list > .li.active').find('input[name=itmSn]').val();
	let dstrctLclsfCode = $('.rChart-table .list > .li.active').find('input[name=dstrctLclsfCode]').val();
	let brandGroupCode = $('.rChart-table .list > .li.active').find('input[name=brandGroupCode]').val();
	let brandCode = $('.rChart-table .list > .li.active').find('input[name=brandCode]').val();
	let sleMthdCode = $('.rChart-table .list > .li.active').find('input[name=sleMthdCode]').val();

	clipTicker = $('.rChart-table .list > .li.active').find('input[name=clipTicker]').val();
	clipDesc = $('.rChart-table .list > .li.active').find('input[name=clipDesc]').val();
	// 차트 상단 가격 동기화
	$('#cPrice').text($('.rChart-table .list > .li.active').find('.c-price').html());
	$('#cRate').text($('.rChart-table .list > .li.active').find('.c-rate').html());
	$('#cGap').text($('.rChart-table .list > .li.active').find('.c-gap').html());

	let rate = $('.rChart-table .list > .li.active').find('.c-rate').html().replace("%",'');

	if(Number(rate) >= 0){
		$(".rChart-current").removeClass("down");
		$(".rChart-current").addClass("up");
	} else{
		$(".rChart-current").removeClass("up");
		$(".rChart-current").addClass("down");
	}

    headProd.text(clipProd);
    headTicker.text(clipTicker);
    headDesc.text(clipDesc);

});

/*
if(currentPage != 'main'){
	$("#btns").hide();
} else {
	$("#btns").show();
}*/

function  loginPage(){
	pageMove('/account/login','','','-1');
}

//차트 영역 접기
$("#btnChartFold").off("click").on("click", function(){
	let chartWrap = $(this).parents().closest('.charts-wrap.sub');

    if (chartWrap.hasClass('fold')) {
        chartWrap.removeClass('fold');
        $(this).text('접어보기');
    } else {
        chartWrap.addClass('fold');
        $(this).text('펼쳐보기');
    }
});

function setSarokPcList() {
	let stopInterval = 0;
	sorin.ajax.postJSON("/main/getSarokPcList", JSON.stringify(''), false, function(result) {
		if(!sorin.validation.isNull(result)) {
			for(var i = 0; i < result.length; i++) {
				//메인차트 시작
				if( $("#sarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).length == 0 ){
					continue;
				}

				if($("#existSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).length > 0 ){
					continue;
				}else{
					let sleMthdCode = $("#sarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).attr("sleMthdCode");
					let appendHtml = "<div class='c-price' nonvatsarokpc='"+result[i].METAL_NAME+sleMthdCode+"'>"+result[i].NON_VAT_SAROK_PC+"</div>" +
							  		 "<div class='c-price' sarokpc='"+result[i].METAL_NAME+sleMthdCode+"' style='display: none'>"+result[i].SAROK_PC+"</div>" +
							   		 "<div class='c-rate'>"+result[i].SAROK_PC_RATE+"%</div>"
					$("#noSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).remove();

					if( result[i].SAROK_PC_RATE > 0 ){
						$("#sarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).addClass("up");
					}else if( result[i].SAROK_PC_RATE < 0 ){
						$("#sarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).addClass("down");
					}
					$("#sarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).append(appendHtml);
					$("#sarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).attr("id","existSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE );

					stopInterval++;
				}
				//메인차트 종료
			}
			for(var i = 0; i < result.length; i++) {
				//접어보기 차트 시작
				if( $("#foldSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).length == 0 ){
					continue;
				}

				if($("#foldExistSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).length > 0 ){
					continue;
				}else{
					let appendHtml = "";
					$("#foldNoSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).remove();

					if( result[i].SAROK_PC_RATE > 0 ){
						appendHtml = "<div class='price up'>"+result[i].NON_VAT_SAROK_PC+"</div>"
					}else if( result[i].SAROK_PC_RATE < 0 ){
						appendHtml = "<div class='price down'>"+result[i].NON_VAT_SAROK_PC+"</div>"
					}else{
						appendHtml = "<div class='price'>"+result[i].NON_VAT_SAROK_PC+"</div>"
					}
					$("#foldSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).append(appendHtml);
					$("#foldSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE ).attr("id","foldExistSarok_" + result[i].BRAND_GROUP_CODE + "_" + result[i].METAL_CODE );
					$("#foldVatSarok_" + result[i].METAL_CODE ).removeClass("hide");

					stopInterval++;
				}
				//접어보기 차트 시작
			}
		}
	});

	if(stopInterval == 0){
		for (var i = 0 ; i <= setIntervalId ; i++) {
			clearInterval(i);
		}
	}
}