'use strict';
var visibleItemSizeNum = 180;
//차트 타이틀
var chartSumTitle1 = true;
var chartSumTitle2 = false;
var avgEndPcSleMthdCode;
//현재 날짜
var date = new Date();
var dateMonth = date.getMonth() + 1; 
var dateDay = date.getDate();

var overArr = [], maxOverLength = 2;
var sideArr = [], maxSideLength = 4;
// 현재 오버레이 설정에서 선택된 오버레이명 보관
var currentOverlayName = "";

// 현재 보조지표 설정에서 선택된 보조지표(차트)명 보관
var currentSideChartName = "";

// 보조지표, 보조차트의 데이터 생성 변수 기본값 보관
var genDataDefaultValues = {
    "movingAvgLine": [5, 20, 60, 120],
    "ilmokBalance": [9, 26, 52],
    "bollingerBand": [20],
    "parabolic": [0.02, 0.2],
    "envelop": [20, 6],
    "movingAvgRibbon": [5, 2, 10],
    "volumeByPrice": [10],
    "macdChart": [12, 26, 9],
    "slowStcChart": [15, 5, 5],
    "fastStcChart": [15, 5],
    "rsiChart": [10, 5],
    "dmiChart": [14],
    "adxChart": [14],
    "williamsChart": [14],
    "obvChart": [],
    "vrChart": [25],
    "trixChart": [12, 9],
    "pmaoChart": [10, 20],
    "simridoChart": [10],
    "rocChart": [12]
};

var props;

$(function() {
    //차트 속성 클릭 이벤트
    $("#chart_option > li").click(function (e) {
        var txt = e.currentTarget.innerText;
        contentHide();
        if (txt == "차트유형") {
            $("#chart_type").toggle();
        } else if (txt == "오버레이") {
            $("#overlay_type").toggle();
        } else if (txt == "보조지표") {
            $("#side_type").toggle();
        } else if (txt == "기타속성") {
            $("#other_type").toggle();
        }

        e.stopPropagation();
    });

    //차트 유형 클릭 이벤트
    $("#chart_type > ul > li").click(function (e) {
        var txt = e.currentTarget.innerText;
        $("#chart_type > ul > li").removeClass("selected");
        $(e.currentTarget).addClass("selected");
        var chartType = "";

        //hloc, line, bar, hloc , baseLine
        if (txt.indexOf("캔들차트") >= 0) {
            chartType = "hloc";
        } else if (txt.indexOf("바차트") >= 0) {
            chartType = "bar";
        } else if (txt.indexOf("종가선차트") >= 0) {
            chartType = "line";
        } else if (txt.indexOf("삼선전환") >= 0) {
            chartType = "lineBreak";
        } else if (txt.indexOf("P&F") >= 0) {
            chartType = "pnf";
        } else if (txt.indexOf("BaseLine") >= 0) {
            chartType = "baseLine";
        } else if (txt.indexOf("BaseArea") >= 0) {
            chartType = "baseArea";
        } else if (txt.indexOf("Area") >= 0) {
            chartType = "area";
        } else {
            chartType = "hloc";
        }

        rMateStock.setChartType("chart1", chartType);
    });

    //오버레이 유형 클릭 이벤트
    $("#overlay_type > ul > li").click(function (e) {
        var f = true;
        for (var i = 0; i < overArr.length; i++) {
            if (overArr[i] == e.currentTarget) {
                rMateStock.toggleOverlay("chart1", overArr[i].id, false);
                overArr.splice(i, 1);
                f = false;
            }
        }
        if (f)
            overArr.push(e.currentTarget);

        if (overArr.length > maxOverLength) {
            rMateStock.toggleOverlay("chart1", overArr[0].id, false);
            overArr.splice(0, 1);
        }

        $("#overlay_type > ul > li").removeClass("selected");
        for (i = 0; i < overArr.length; i++) {
            $(overArr[i]).addClass("selected");
        }

        var overName = e.currentTarget.id;
        rMateStock.toggleOverlay("chart1", overName, $(e.currentTarget).hasClass("selected"));

    });

    //보조지표 유형 클릭 이벤트
    $("#side_type > ul > li").click(function (e) {
        var f = true;
        for (var i = 0; i < sideArr.length; i++) {
            if (sideArr[i] == e.currentTarget) {
                rMateStock.toggleSideChart("chart1", sideArr[i].id, false);
                sideArr.splice(i, 1);
                f = false;
            }
        }
        if (f)
            sideArr.push(e.currentTarget);

        if (sideArr.length > maxSideLength) {
            rMateStock.toggleSideChart("chart1", sideArr[0].id, false);
            sideArr.splice(0, 1);
        }

        $("#side_type > ul > li").removeClass("selected");
        for (i = 0; i < sideArr.length; i++) {
            $(sideArr[i]).addClass("selected");
        }

        var overName = e.currentTarget.id;
        rMateStock.toggleSideChart("chart1", overName, $(e.currentTarget).hasClass("selected"));

    });

    //마우스휠 확대/축소
    $("#wheel_change > li").click(function (e) {
        if ($(e.currentTarget).hasClass("selected"))
            $(e.currentTarget).removeClass("selected");
        else
            $(e.currentTarget).addClass("selected");
        rMateStock.setProperty("chart1", "isZoomByWheel", $(e.currentTarget).hasClass("selected"));
    });

    //마우스 십자선 표시 여부
    $("#crossHair_change > li").click(function (e) {
        if ($(e.currentTarget).hasClass("selected"))
            $(e.currentTarget).removeClass("selected");
        else
            $(e.currentTarget).addClass("selected");

        var text = $(e.currentTarget).html();
        var dashed = {
            dashed: $(e.currentTarget).hasClass("selected"),
            dashLength: 3
        };
        if (text.indexOf("점선") > 0)
            rMateStock.setProperty("chart1", "crossHairDashed", dashed);
        else
            rMateStock.setProperty("chart1", "showCrossHair", $(e.currentTarget).hasClass("selected"), true);
    });

    //범례 출력 여부
    $("#legend_change > li").click(function (e) {
        if ($(e.currentTarget).hasClass("selected"))
            $(e.currentTarget).removeClass("selected");
        else
            $(e.currentTarget).addClass("selected");
        rMateStock.setProperty("chart1", "showLegend", $(e.currentTarget).hasClass("selected"), true);
    });

    //Y축 유형
    $("#yAxis_type > li").click(function (e) {
        $("#yAxis_type > li").removeClass("selected");
        $(e.currentTarget).addClass("selected");

        rMateStock.setYAxisType("chart1", e.currentTarget.id);
    });

    //Y축 유형
    $("#dataTip_mode > li").click(function (e) {
        $("#dataTip_mode > li").removeClass("selected");
        $(e.currentTarget).addClass("selected");

        rMateStock.setProperty("chart1", "dataTipMode", e.currentTarget.id);
    });

    // 확대 클릭 핸들러
    $("#zoomInBtn").click(function () {
        rMateStock.zoomIn("chart1");
    });

    // 축소 클릭 핸들러
    $("#zoomOutBtn").click(function () {
        rMateStock.zoomOut("chart1");
    });


    //팔레트 클릭
    $("#palette_button").click(function (e) {
        if ($("#palette_button").hasClass("palette_btn_active")) {
            $("#palette_list").removeClass("palette_active");
            $("#palette_button").removeClass("palette_btn_active");
        }
        else {
            $("#palette_list").addClass("palette_active");
            $("#palette_button").addClass("palette_btn_active");
        }
    });

    // 팔레트에서 색상 선택 핸들러
    $("#palette").click(function (event) {
        isPaletteShow = false;
        var selColor = $(event.target).css("background-color");
        $("#palette").css("display", "none");
        rMateStock.changeDrawingColor("chart1", selColor, 2);
    });

    //
    $("#item_info").click(function (e) {
        contentHide();
        $("#item_list").show();
        e.stopPropagation();
    });

    //펼쳐진 컨텐츠들을 닫는 이벤트
    $("html").click(function (e) {
        contentHide(e);
    });

    $("#overlayTabs").click(function (e) {
        e.stopPropagation();
    });

    $("#sideTabs").click(function (e) {
        e.stopPropagation();
    });

    //--------- 오버레이 메뉴 정의 시작 -----------------------------------------
    // 오버레이 설정 기본값 버턴 클릭 핸들러
    $("#overlayDefaultBtn").click(function () {
        var values = genDataDefaultValues[currentOverlayName];
        doOverlaySettingTabChange(values); // Spinner 기본값으로 설정
        rMateStock.setOverlayDataValues("chart1", currentOverlayName, values); // 차트 기본값으로 다시 그리기
    });

    // 보조지표 설정 기본값 버턴 클릭 핸들러
    $("#sideDefaultBtn").click(function () {
        var values = genDataDefaultValues[currentSideChartName];
        doSideChartSettingTabChange(values); // Spinner 기본값으로 설정
        rMateStock.setSideChartDataValues("chart1", currentSideChartName, values); // 차트 기본값으로 다시 그리기
    });
});

/**
 * jQuery UI 위젯 설정 및 이벤트 핸들링 함수입니다.
 */
function initjQueryUI() {
    // jQuery UI 스핀너 사용 (오버레이 스핀너)
    $("#overlayTabs ul input[name=overlaySpinner]").spinner({
        stop: overlayValueChangeHandler
    });

    // jQuery UI 스핀너 사용 (보조차트 스핀너)
    $("#sideTabs ul input[name=sideSpinner]").spinner({
        stop: sideChartValueChangeHandler
    });
}

// 현재 팔레트가 표시되었는지 여부
var isPaletteShow = false;

/**
 * 색상 변경 팔레트를 표시합니다.
 */
function togglePalette() {
    if (isPaletteShow) {
        isPaletteShow = false;
        $("#palette").css("display", "none");
    } else {
        isPaletteShow = true;
        var offset = $("#paletteBtn").offset();
        $("#palette").css("display", "block")
            .css("top", offset.top + "px")
            .css("left", (offset.left - 370) + "px");
    }
};


function deleteLastDrawingElement() {
    rMateStock.deleteLastDrawingElement("chart1");
};

//-------------오버레이 정의 시작
/**
 * 오버레이의 Spinner 변경 핸들러.
 * 오버레이 설정 탭의 Spinner 를 클릭 또는 값 변경시 해당 값으로 차트에 적용시킵니다.
 */
function overlayValueChangeHandler(event, ui) {
    var values = [];
    $("#overlayTabs ul input[name=overlaySpinner]").each(function (i, name) {
        values.push($(name).val());
    });

    rMateStock.setOverlayDataValues("chart1", currentOverlayName, values);
}
function doOverlaySettingTabChange(values) {
    var overName = currentOverlayName;
    var len = values.length;
    // 설정에서 values 만큼만 <li> 태그 보이기
    $("#overlayTabs ul li").each(function (i, name) {
        if (i >= len) {
            $(name).hide();
        } else {
            $(name).show();
        }
    });
    var labels = $("#overlayTabs ul label");
    var spinners = $("#overlayTabs ul input[name=overlaySpinner]");

    switch (overName) {
        case "movingAvgLine": //이동평균
            labels.each(function (i, name) {
                $(name).html("이평선" + (i + 1).toString() + " :");
            });
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 240, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "ilmokBalance": // 일목균형지표
            $(labels[0]).html("전환선 : ");
            $(labels[1]).html("기준후선 : ");
            $(labels[2]).html("선행스팬 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 240, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "bollingerBand": // 볼린저밴드
            $(labels[0]).html("기간 : ");
            $(spinners[0]).spinner({ min: 1, max: 240, step: 1 }).spinner("value", values[0]);
            break;
        case "parabolic": // 파라볼릭 Sar
            $(labels[0]).html("AF 계수 : ");
            $(labels[1]).html("Max AF : ");
            $(spinners[0]).spinner({ min: 0.01, max: 0.5, step: 0.01 }).spinner("value", values[0]);
            $(spinners[1]).spinner({ min: 0.1, max: 0.5, step: 0.05 }).spinner("value", values[1]);
            break;
        case "envelop": // 인벨로프
            $(labels[0]).html("기간 : ");
            $(labels[1]).html("가감 : ");
            $(spinners[0]).spinner({ min: 1, max: 100, step: 1 }).spinner("value", values[0]);
            $(spinners[1]).spinner({ min: 1, max: 50, step: 1 }).spinner("value", values[1]);
            break;
        case "volumeByPrice": // 매물대
            $(labels[0]).html("개수 : ");
            $(spinners[0]).spinner({ min: 1, max: 20, step: 1 }).spinner("value", values[0]);
            break;
        case "movingAvgRibbon": // 그물차트
            $(labels[0]).html("시작 : ");
            $(labels[1]).html("증가 : ");
            $(labels[2]).html("개수 : ");
            $(spinners[0]).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[0]);
            $(spinners[1]).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[1]);
            $(spinners[2]).spinner({ min: 1, max: 20, step: 1 }).spinner("value", values[2]);
            break;
    }
}

//오버레이 셋팅 오픈
function settingOpenOverlay(e, overName) {
    $("#overlayTabs").show();
    currentOverlayName = overName;
    var values = rMateStock.getDataGenValues("chart1", currentOverlayName, true);
    doOverlaySettingTabChange(values);
    //contentHide();
    e.stopPropagation();
}

//-------------보조지표 정의 시작
/**
 * 오버레이의 Spinner 변경 핸들러.
 * 오버레이 설정 탭의 Spinner 를 클릭 또는 값 변경시 해당 값으로 차트에 적용시킵니다.
 */
function sideChartValueChangeHandler(event, ui) {
    var values = [];
    $("#sideTabs ul input[name=sideSpinner]").each(function (i, name) {
        values.push($(name).val());
    });

    rMateStock.setSideChartDataValues("chart1", currentSideChartName, values);
}
function doSideChartSettingTabChange(values) {
    var sideName = currentSideChartName;
    var len = values.length;
    $("#sideTabs ul li").each(function (i, name) {
        if (i >= len) {
            $(name).hide();
        } else {
            $(name).show();
        }
    });
    var labels = $("#sideTabs ul label");
    var spinners = $("#sideTabs ul input[name=sideSpinner]");

    // 보조지표에 맞게 label 과 spinner 재설정합니다.
    switch (sideName) {
        case "volumeChart": // 거래량
            break;
        case "macdChart": // MACD 지표
            $(labels[0]).html("단기 : ");
            $(labels[1]).html("장기 : ");
            $(labels[2]).html("Signal : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "slowStcChart": // Slow STC 지표
            $(labels[0]).html("기간 : ");
            $(labels[1]).html("Slow%K : ");
            $(labels[2]).html("Slow%D : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "fastStcChart": // Fast STC 지표
            $(labels[1]).html("Fast%K : ");
            $(labels[2]).html("Fast%D : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "rsiChart": // RSI 지표
            $(labels[0]).html("기간 : ");
            $(labels[1]).html("Signal : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "dmiChart": // DMI 지표
            $(labels[0]).html("기간 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "adxChart": // ADX 지표
            $(labels[0]).html("기간 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "williamsChart": // williams 지표
            $(labels[0]).html("기간 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "obvChart": // OBV 지표
            break;
        case "vrChart": // VR 지표
            $(labels[0]).html("기간 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "trixChart": // TRIX 지표
            $(labels[0]).html("기간 : ");
            $(labels[1]).html("Signal : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "simridoChart": // 심리도 지표
            $(labels[0]).html("기간 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "pmaoChart": // PMAO 지표
            $(labels[0]).html("단기 : ");
            $(labels[1]).html("장기 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
        case "rocChart": // ROC 지표
            $(labels[0]).html("기간 : ");
            spinners.each(function (i, name) {
                $(name).spinner({ min: 1, max: 120, step: 1 }).spinner("value", values[i]);
            });
            break;
    }
}

//보조지표 셋팅 오픈
function settingOpenSideChart(e, sideName) {
    $("#sideTabs").show();
    currentSideChartName = sideName;
    var values = rMateStock.getDataGenValues("chart1", currentSideChartName, false);
    doSideChartSettingTabChange(values);
    //contentHide();
    e.stopPropagation();
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function changeRate(d1, d2) {
    var item = {};
    item.change = d1[4] - d2[4];
    item.rate = (100 * d1[4] / d2[4]) - 100;
    return item;
}

function contentHide(e) {
    $("#tick_list").hide();
    $("#min_list").hide();
    $("#item_list").hide();
    //$("#chart_type").hide();
    $("#overlay_type").hide();
    $("#side_type").hide();
    $("#other_type").hide();
    $("#overlayTabs").hide();
    $("#sideTabs").hide();
}

/**
 * 시간 포맷 변경 (yyyy/MM/dd 00:00:00)
 */
function date_to_str_zero(format) {
    var year = format.getFullYear();

    var month = format.getMonth() + 1;
    if (month < 10) month = '0' + month;

    var date = format.getDate();
    if (date < 10) date = '0' + date;


    return year + month + date;

}

/**
 * 시간 포맷 변경 (hh:mm:ss)
 */
function dateToTime(date) {

    var hour = date.getHours();
    if (hour < 10) hour = '0' + hour;

    var min = date.getMinutes();
    if (min < 10) min = '0' + min;

    var sec = date.getSeconds();
    if (sec < 10) sec = '0' + sec;

    return hour + ":" + min + ":" + sec;
}

function createDepthProps() {
    // 증권 차트 속성 설정
    props = {
        mainChart: {
            showCrossHair: true,
            dataTipMode: "titleDepth", //툴팁 모드
            //Y축 포맷
            formatter: {
                "useThousandsSeparator": true,
                "useNegativeSign": true,
                "precision": 0,
                "thousandsSeparatorTo": ",",
                "decimalSeparatorTo": ".",
                "rounding": "none"
            },
            //Y축 툴팁의 포맷
            vAxisTipFormatter: {
                "useThousandsSeparator": true,
                "useNegativeSign": true,
                "precision": 0,
                "thousandsSeparatorTo": ",",
                "decimalSeparatorTo": ".",
                "rounding": "none"
            },
            labelStyle: {
                fontSize: 10,
                color: "#666",
                fontFamily: "Noto Sans regular",
                fontWeight: "normal",
                fontStyle: "normal"
            },
            horizontalInnerPadding: false
        },
        scrollNavi: {
            visibleItemSize: 2400,
            maxVisibleItemSize: 2400,
        },
        mainChart: {
            gutterLeft: 0,
            gutterRight: 80,
            gutterBottom: 15,
            gutterTop: 20
        },
        depthChart: {
            show: true,
            bidsSeries: {
                displayNames: ["수량"],
                strokes: [{
                    "color": "#FF3845",
                    "weight": 1
                }, //bids 부분의 상단 선 설정
                {
                    "color": "rgba(255,150,0,1)",
                    "weight": 1
                }, // 사용하지 않는 부분
                {
                    "color": "rgba(0,150,0,0)",
                    "weight": 1
                }], //bids 부분의 하단 선
                fillColor: "rgba(255,235,237,0.8)"//bids 영역 부분의 색
            },
            asksSeries: {
                displayNames: ["수량"],
                strokes: [{
                    "color": "#318DFE",
                    "weight": 1
                }, // asks 부분의 상단 선 설정
                {
                    "color": "rgba(255,150,0,1)",
                    "weight": 1
                }, // 사용하지 않는 부분
                {
                    "color": "rgba(0,150,0,0)",
                    "weight": 1
                }], // asks 부분의 하단 선
                fillColor: "rgba(233,243,255,0.8)"//asks 영역 부분의 색
            }
        },
        callback: {
            /**
             * ========================================================
             *  id : chart id
             * item : 사용자가 추가한 bids 혹은 asks의 데이터  
             * 		  bidsQuantity 와 asksQuantity는 누적 합계입니다.
             * fieldName : 해당 아이템의 필드명
             * displayName : 설정된 디스플레이네임
             * ======================================================== 
             * 
             * depthData.json 을 참고하여 데이터를 넣을 경우 하단과 같이 접근 가능합니다.
             * 
             * "quantity": "114759", -> item.quantity
             * "price": "1673", -> item.price
             * "btcSum" : "1000", -> item.btcSum
             * "ethSum" : "1000" -> item.ethSum
             * 
             * 하단의 툴팁에서는 누적수량을 보여주기 위하여 item[item.type+"Quantity"] 와 같이 접근하여 툴팁에 보여주고 있습니다.
             * 실제 수량을 툴팁으로 보여주기 위해서는 item.quantity 로 수정하여 주시기 바랍니다.
             * 
             */
            dataTipFunction: function (id, item, fieldName, displayName) {
                var precision = 100;
                var tipText = "날짜 : " + dateFormat(item.Date) + "<br>";
                var value;

                if (isNull(fieldName) || isNull(displayName)) {
                    for (var p in item) {
                        if (p == "Date")
                            continue;
                        value = item[p];
                        if (!isNaN2(value)) {
                            value = formatter((value * precision) / precision);
                            if (!isNull(rMateStock.dataKeyMap[p])) {
                                if (p == "High") {
                                    tipText += '<span style="width:80px; color:#ff0000">' + rMateStock.dataKeyMap[p] + " : " + value + "</span><br>";
                                } else if (p == "Low") {
                                    tipText += '<span style="width:80px; color:#0000ff">' + rMateStock.dataKeyMap[p] + " : " + value + "</span><br>";
                                } else if (p == "Close") {
                                    if (item["Change"] > 0) {
                                        tipText += '<span style="width:80px; color:#ff0000">' + rMateStock.dataKeyMap[p] + " : " + value + " (" + item["Rate"].toFixed(2) + "%)</span><br>";
                                    } else if (item["Change"] <= 0) {
                                        tipText += '<span style="width:80px; color:#0000ff">' + rMateStock.dataKeyMap[p] + " : " + value + " (" + item["Rate"].toFixed(2) + "%)</span><br>";
                                    }
                                } else if (p == "Volume") {
                                    continue;
                                } else {
                                    tipText += '<span style="width:80px;">' + rMateStock.dataKeyMap[p] + " : " + value + "</span><br>";
                                }
                            }
                        }
                    }
                } else {
                    var tipValue = item[fieldName];
                    tipValue = formatter((tipValue * precision) / precision);
                    tipText += displayName + " : " + tipValue;
                }

                return tipText;
            }

            // 			dataTipFunction : function(id, item, fieldName, displayName) {
            // 				var tipText = "";
            // 				tipText += item.price + " 원</br>";

            // 				if(item.type == "bids")
            // 					tipText += "<span style='width:80px; color:#ff0000'>매수</span> : " + item[item.type+"Quantity"] + "<br>";
            // 				else
            // 					tipText += "<span style='width:80px; color:#0000ff'>매도</span> : " + item[item.type+"Quantity"] + "<br>";

            // 				tipText += "sum(BTC) : " + item.btcSum + "<br>";
            // 				tipText += "sum(ETH) : " + item.ethSum + "<br>";

            // 				return tipText;
            // 			}
        }
    };

    return props;
}

function createProps(movingAvgLine) {
    props = {
            sideChart: {
                common: {
                    gutterRight: 65,
                    titleStyle: {
                        bgColor: "#cccccc",
                        stroke: {
                            "color": "#aaaaaa",
                            "weight": 1
                        },
                        fontSize: 11,
                        fontWeight: "normal",
                        fontFamily: "Noto Sans regular",
                        fontStyle: "normal",
                        color: "#666"
                    },
                    labelStyle: {
                        fontSize: 11,
                        color: "#666",
                        fontFamily: "Noto Sans regular",
                        fontWeight: "normal",
                        fontStyle: "normal"
                    }
                },
                volumeChart: {
                    show: false
                }
            },
            scrollNavi: {
                visibleItemSize: visibleItemSizeNum,
                maxVisibleItemSize: 2400,
            },
            overlay: {
                movingAvgLine: {
                    show: movingAvgLine
                },
            },
            mainChart: {
                dataTipMode: "titleDepth", //툴팁 모드
                legendY: -25,
                legendX: 20,
                recentSizeLeft: 0,
                showRecentTip: true,
                recentTipColor: "#073763",
                titleStyle: {
                    color: "rgba(255,255,255,0)"
                },
                recentTipDashed: {
                    dashed: true,
                    dashLength: 2
                },
                pnfValue: 500,
                gutterRight: 65,
                mainSeries: {
                    baseValue: 4548000,
                    lineChartStroke: {
                        "color": "#ff0000",
                        "weight": 1
                    },
                    declineStroke: {
                        "color": "#2548fb",
                        "weight": 1
                    },
                    raiseFill: "#ff0000",
                    fallFill: "#2548fb",
                },
                crossHairStroke: {
                    "color": "#939393",
                    "weight": 1
                },
                baseLineStroke: {
                    color: "#E2E2E2",
                    weight: 1
                },
                labelStyle: {
                    fontSize: 12,
                    color: "#666666",
                    fontFamily: "Noto Sans regular",
                    fontWeight: "normal",
                    fontStyle: "normal"
                },
                dataTipFormatter: {
                    "useThousandsSeparator": true,
                    "useNegativeSign": true,
                    "precision": 2,
                    "thousandsSeparatorTo": ",",
                    "decimalSeparatorTo": ".",
                    "rounding": "none"
                },
                gridStroke: {
                    "color": "#eeeeee",
                    "weight": 1
                },
                gridBoxStroke: {
                    "color": "#eeeeee",
                    "weight": 1
                },
            },
            callback: {
                getLegendData: function (id, title, names, colors, prefixTag, suffixTag) {
                    var len = Math.min(names.length, colors.length);
                    if (isNull(prefixTag))
                        prefixTag = "";
                    if (isNull(suffixTag))
                        suffixTag = "";
                    var str = prefixTag;

                    str += '<span class="legend_main noto">' + '<span class="legend_title">' + title + '</span>';

                    for (var i = 0; i < len; i++) {
                        str += '<span class="legend_marker" style="background-color:' + colors[i].color + ';" ></span>';
                        str += '<span class="legend_name" style="color:' + colors[i].color + ';">' + names[i] + '</span>';
                    }
                    str += '</span>';
                    str += suffixTag;
                    return str;
                },
                overlayAddedEventHandler: function (uid, name) {
                    $("input[name=" + name + "]").prop("checked", true);
                },
                overlayRemovedEventHandler: function (uid, name) {
                    $("input[name=" + name + "]").prop("checked", false);
                },
                sideChartAddedEventHandler: function (uid, name) {
                    //trace("sideChartAddedEventHandler");
                    $("input[name=" + name + "]").prop("checked", true);
                },
                sideChartRemovedEventHandler: function (uid, name) {
                    //trace("sideChartRemovedEventHandler");
                    $("input[name=" + name + "]").prop("checked", false);
                },
                itemOverChangeHandler: function (uid, item, focusFieldName, focusDisplayName) {
                    var str = dateFormat(item.Date);
                    str += "&nbsp;&nbsp;&nbsp;<b>시가:</b> " + commafy(item.Open);
                    str += "&nbsp;&nbsp;&nbsp;<b>고가:</b> " + commafy(item.High);
                    str += "&nbsp;&nbsp;&nbsp;<b>저가:</b> " + commafy(item.Low);
                    str += "&nbsp;&nbsp;&nbsp;<b>종가:</b> " + commafy(item.Close) + "&nbsp;&nbsp;&nbsp;";

                    if (item.Change > 0) {
                        str += "<span class=\"raise\"> ▲" + commafy(item.Change.toFixed(2)) + "<span style=\"margin-left:10px;\"></span> " + item.Rate.toFixed(2) + "%</span>";
                    } else {
                        str += "<span class=\"fall\"> ▼" + commafy(item.Change.toFixed(2)) + "<span style=\"margin-left:10px;\"></span> " + item.Rate.toFixed(2) + "%</span>";
                    }
                    if (focusFieldName && focusFieldName != "")
                        str += ", (" + focusDisplayName + ": " + commafy(item[focusFieldName]) + ")";

                    str += "&nbsp;&nbsp;&nbsp;<b>거래량:</b> " + commafy(item.Volume);

                    document.getElementById("chart_info").innerHTML = "<div class='noto item_over'>" + str + "</div>";
                },
                dataTipFunction: function (id, item, fieldName, displayName) {
                    var precision = 100;
                    var tipText = "날짜 : " + dateFormat(item.Date) + "<br>";
                    var value;
                    var timeFrame = rMateStock.getTimeFrame("chart1");
                    if (timeFrame == "minute") {
                        tipText += "시간 : " + dateFormat(item.Date, "H:i") + "<br>";
                    }

                    if (isNull(fieldName) || isNull(displayName)) {
                        for (var p in item) {
                            if (p == "Date")
                                continue;
                            value = item[p];
                            if (!isNaN2(value)) {
                                value = formatter((value * precision) / precision);
                                value = Math.floor(Number(value.replaceAll(",", ""))).toLocaleString(); // 소수점 제거
                                if (!isNull(rMateStock.dataKeyMap[p])) {
                                    if (p == "High") {
                                        tipText += '<span style="width:80px; color:#ff0000">' + rMateStock.dataKeyMap[p] + " : " + value + "</span><br>";
                                    } else if (p == "Low") {
                                        tipText += '<span style="width:80px; color:#0000ff">' + rMateStock.dataKeyMap[p] + " : " + value + "</span><br>";
                                    } else if (p == "Close") {
                                        if (item["Change"] > 0) {
                                            tipText += '<span style="width:80px; color:#ff0000">' + rMateStock.dataKeyMap[p] + " : " + value + " (" + item["Rate"].toFixed(2) + "%)</span><br>";
                                        } else if (item["Change"] <= 0) {
                                            tipText += '<span style="width:80px; color:#0000ff">' + rMateStock.dataKeyMap[p] + " : " + value + " (" + item["Rate"].toFixed(2) + "%)</span><br>";
                                        }
                                    } else if (p == "Volume") {
                                        continue;
                                    } else {
                                        tipText += '<span style="width:80px;">' + rMateStock.dataKeyMap[p] + " : " + value + "</span><br>";
                                    }
                                }
                            }
                        }
                    } else {
                        var tipValue = item[fieldName];
                        tipValue = formatter((tipValue * precision) / precision);
                        tipText += displayName + " : " + tipValue;
                    }

                    return tipText;
                },
            } // end of callback
        };

    return props;
};

function setDepthInterval(num) {

    var props = {
        mainChart: {
            yAxisPlacement: "right"
        },
        depthChart: {
            bidsSeries: {
                depthInterval: num
            },
            asksSeries: {
                depthInterval: num
            }
        }
    };

    rMateStock.setPropertys("depthChart", props, true);
}

function formatter(value) {
    var t = $(this);
    t.useThousandsSeparator = true;
    t.useNegativeSign = true;
    t.precision = 2;
    t.thousandsSeparatorTo = ",";
    t.decimalSeparatorTo = ".";
    t.rounding = "none";
    t.returnValueWhenError = false;

    var n = parseFloat(value),
        c = t.precision == -1 ? 0 : Math.abs(t.precision),
        d = t.decimalSeparatorTo,
        s = t.useThousandsSeparator ? t.thousandsSeparatorTo : "";



    n = t.rounding == "down" ? t.precision > -1 && c > 0 ? Math.floor(n * Math.pow(10, c)) / Math.pow(10, c) : Math.floor(n) :
        (t.rounding == "up" ? t.precision > -1 && c > 0 ? Math.ceil(n * Math.pow(10, c)) / Math.pow(10, c) : Math.ceil(n) :
            (t.rounding == "nearest" ? t.precision > -1 && c > 0 ? Math.round(n * Math.pow(10, c)) / Math.pow(10, c) : Math.round(n) : n));

    var sign = (n < 0) ? (t.useNegativeSign ? '-' : '(') : "",
        //extracting the absolute value of the integer part of the number and converting to string
        i = parseInt(n = t.precision > -1 ? Math.abs(n).toFixed(c + 1) : Math.abs(n)) + '';

    var j = i.length;
    j = ((j) > 3) ? j % 3 : 0;
    var f = n - i,
        ff = "";

    t.error = undefined;

    if (isNaN(f)) {
        t.error = "invalid number";
        if (t.returnValueWhenError)
            return value;
        else
            return "";
    }

    if (f > 0)
        ff = d + n.toString().slice(i.toString().length + 1);
    else if (c > 0)
        ff = d + f.toFixed(c + 1).slice(2);

    return sign + (j ? i.substr(0, j) + s : '') +
        i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + s) +
        (t.precision > -1 ? c ? ff.substr(0, c + d.length) : "" : ff) +
        (sign == "(" ? ")" : "");
};

function isNumber(n) {
    return typeof n === "number";
};

function isNull(obj) {
	return obj == null || typeof obj === "undefined" || obj === "undefined";
}