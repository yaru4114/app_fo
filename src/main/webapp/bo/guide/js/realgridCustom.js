/*eslint-disable*/

var fields = [
	{
		fieldName: "Id",
		dataType: "text",
	},
	{
		fieldName: "Datetime1",
		dataType: "datetime",
		datetimeFormat: "yyyyMMddHHmmssSSS"
	},
	{
		fieldName: "Bar",
		dataType: "text",
	},
	{
		fieldName: "Datetime2",
		dataType: "datetime",
		datetimeFormat: "yyyyMMddHHmmssSSS"
	},
	{
		fieldName: "Datetime-bt",
		dataType: "datetime",
		datetimeFormat: "yyyyMMddHHmmssSSS"
	},
	{
		fieldName: "Monthpicker1",
	},
	{
		fieldName: "Datepicker1",
	},
	{
		fieldName: "Monthpicker-bt",
	},
	{
		fieldName: "Datepicker-bt",
	},
	{
		fieldName: "KorName",
		dataType: "text"
	},
	{
		fieldName: "Gender",
		dataType: "text"
	},
	{
		fieldName: "Button",
		dataType: "text"
	},
	{
		fieldName: "Age",
		dataType: "number"
	},
	{
		fieldName: "Phone",
		dataType: "text"
	},
	{
		fieldName: "ProductId",
		dataType: "text"
	},
	{
		fieldName: "KorCountry",
		dataType: "text"
	},
	{
		fieldName: "OrderDate",
		dataType: "datetime",
		datetimeFormat: "yyyy-MM-dd",
		amText: "오전",
		pmText: "오후"
	},
	{
		fieldName: "CardNumber",
		dataType: "text"
	},
	{
		fieldName: "Grade",
		dataType: "text"
	},
	{
		fieldName: "Monetary",
		dataType: "text"
	},
	{
		fieldName: "StartDate",
		dataType: "datetime",
		datetimeFormat: "yyyy-MM-dd",
		amText: "오전",
		pmText: "오후"
	},
	{
		fieldName: "EndDate",
		dataType: "datetime",
		datetimeFormat: "yyyy-MM-dd",
		amText: "오전",
		pmText: "오후"
	},
	{
		fieldName: "ToMonth",
		dataType: "text"
	},
	{
		fieldName: "Month",
		dataType: "text"
	},
	{
		fieldName: "Year",
		dataType: "number"
	},
	{
		fieldName: "InterestRate",
		dataType: "number"
	},
	{
		fieldName: "SaveCost",
		dataType: "number"
	},
	{
		fieldName: "SaveMaturity",
		dataType: "number"
	},
	{
		fieldName: "CurrentSave",
		dataType: "number"
	}
];


var columns = [
	{
		name: "Id",
		width: "190",
		header: {
			text: "아이디"
		},
		editable: false,
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
					// [D] 카카오의 경우 .icon-kakao 추가
					str += '<span class="">price92@nate.com</span> <i class="icon icon-naver">네이버</i>';
				return str;
			}
		},
		styleName: "text-left"
	},
	{
		name: "Datetime1",
		fieldName: "Datetime1",
		width: "80",
		header: {
			text: "시간"
		},
		editor: {
			datetimeFormat: "HH:mm",
		},
		datetimeFormat: "HH:mm",

	},
	{
		name: "Bar",
		fieldName: "Bar",
		width: "30",
		type: "data",
		editable: false,
		header: {
			text: "시간"
		},
		styleName: "pd-0"
	},
	{
		name: "Datetime2",
		fieldName: "Datetime2",
		width: "80",
		header: {
			text: "시간"
		},
		editor: {
			datetimeFormat: "HH:mm;2000;AM,PM"
		},
		datetimeFormat: "HH:mm",

	},
	{
		name: "Datetime-bt",
		fieldName: "Datetime-bt",
		width: "240",
		header: {
			text: "시간 커스텀"
		},
		editable: false,
		editor: {
			datetimeFormat: "HH:mm;2000;AM,PM"
		},
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
					str += '<div class="form-set">';
					str += '<div class="input-group timepicker form-time">';
					str += 		'<input type="text" class="input input" value="01:11"/>';
					str += 		'<label class="btn has-icon">';
					str += 			'<i class="icon icon-time">달력</i>';
					str += 		'</label>';
					str += '</div>';
					str += '<span>~</span>';
					str += '<div class="input-group timepicker form-time">';
					str += 		'<input type="text" class="input input" value="01:11"/>';
					str += 		'<label class="btn has-icon">';
					str += 			'<i class="icon icon-time">달력</i>';
					str += 		'</label>';
					str += '</div>';
					str += '</div>';
				return str;
			}
		},
		datetimeFormat: "HH:mm",

	},
	{
		name: "Monthpicker1",
		fieldName: "Monthpicker1",
		width: "140",
		header: {
			text: "월 선택(기본)"
		},
		editor: {
            type: "btdate",
            btOptions: {
                startView: 1,
                minViewMode: 1,
                todayBtn: "linked",
                language: "ko",
                todayHighlight: true
            },
            textReadOnly: true,
            datetimeFormat: "yyyy-MM",
            mask: {
                "editMask": "9999-99",
                "includedFormat": true
            }
        }
	},
	{
		name: "Datepicker1",
		fieldName: "Datepicker1",
		width: "140",
		header: {
			text: "일 선택(기본)"
		},
		editor: {
            type: "date",
            textReadOnly: true,
            datetimeFormat: "yyyy-mm-dd",
        }
	},
	{
		name: "Monthpicker-bt",
		fieldName: "Monthpicker-bt",
		width: "150",
		header: {
			text: "월 선택(커스텀)"
		},
		editable: false,
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
					str += '<div class="input-group date form-month">';
					str += 		'<input type="text" class="input" value="2021-01" />';
					str += 		'<label class="btn has-icon">';
					str += 			'<i class="icon icon-calendar">달력</i>';
					str += 		'</label>';
					str += '</div>';
				return str;
			}
		},
	},
	{
		name: "Datepicker-bt",
		fieldName: "Datepicker-bt",
		width: "150",
		header: {
			text: "일 선택(커스텀)"
		},
		editable: false,
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
					str += '<div class="input-group date form-date">';
					str += 		'<input type="text" class="input" value="2021-01-01" />';
					str += 		'<label class="btn has-icon">';
					str += 			'<i class="icon icon-calendar">달력</i>';
					str += 		'</label>';
					str += '</div>';
				return str;
			}
		},

	},
	{
		name: "KorName",
		fieldName: "KorName",
		type: "data",
		width: "200",
		editable: false,
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = '<a class="text-link" href="javascript:;" target="_blank" >이것은 링크입니다.</a></p>';
				return str;
			}
		},
		header: {
			text: "링크 & 좌측정렬"
		},
		styleName: "text-left"
		
	},
	{
		name: "Gender",
		fieldName: "Gender",
		type: "data",
		width: "80",
		editable: false,
		header: {
			text: "버튼"
		},
		renderer:{
			type:"button",
		},
		
		
	},
	{
		name: "Button",
		fieldName: "Button",
		type: "data",
		width: "85",
		editable: false,
		header: {
			text: "버튼"
		},
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = '<button type="button" class="btn btn-sm btn-dark-blue-border">설정</button>';
				return str;
			}
		},
		
	},
	{
		name: "Age",
		fieldName: "Age",
		type: "data",
		width: "60",
		editable: false,
		header: {
			text: "나이"
		},
		styleName: ""
	},
	{
		name: "Phone",
		fieldName: "Phone",
		type: "data",
		width: "120",
		editable: false,
		header: {
			text: "전화번호"
		}
	},
	{
		name: "KorCountry",
		fieldName: "KorCountry",
		type: "data",
		width: "120",
		editable: false,
		header: {
			text: "투자국가"
		}
	},
	{
		name: "OrderDate",
		fieldName: "OrderDate",
		type: "data",
		width: "120",
		editable: false,
		header: {
			text: "주문일자"
		},
		datetimeFormat: "yyyy-MM-dd",
	},
	{
		name: "CardNumber",
		fieldName: "CardNumber",
		type: "data",
		width: "160",
		editable: false,
		header: {
			text: "카드번호"
		}
	},
	{
		name: "Grade",
		fieldName: "Grade",
		type: "data",
		width: "120",
		editable: false,
		header: {
			text: "평가점수"
		},
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
					str += '<div class="star-grade">';
					//[D] 등급에 따라 star0, star1, star2, star3, star4, star5 로 변경 사용    
					str += 		'<img src="/images/star'+cell.value+'.svg">';
					str += 	'</div>';
				return str;
			}
		}
	},
	{
		name: "Monetary",
		fieldName: "Monetary",
		type: "data",
		width: "280",
		editable: false,
		header: {
			text: "체크박스"
		},
		values: ["EUR", "USD", "HKD", "KRW"],
		labels: ["EUR", "USD", "HKD", "KRW"],
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
				var data = (cell.value && cell.value.split(",")) || [];
				var labels = cell.dataColumn.labels;
				var values = cell.dataColumn.values;
				for (var i = 0; i < labels.length; i++) {
					var checked = data.indexOf(values[i]) >= 0 ? "checked": "";
					str = str + "<input type='checkbox' value = '"+values[i]+"'" + checked  + " onclick='javascript:valuecheck("+cell.index.dataRow+", event)' />"+labels[i];
				}
				return str;
			}
		}
	},
	{
		name: "StartDate",
		fieldName: "StartDate",
		type: "data",
		width: "120",
		editable: false,
		header: {
			text: "최초납입일"
		}
	},
	{
		name: "EndDate",
		fieldName: "EndDate",
		type: "data",
		width: "120",
		editable: false,
		header: {
			text: "종료일"
		}
	},
	{
		name: "ToMonth",
		fieldName: "ToMonth",
		type: "data",
		width: "100",
		editable: true,
		sortable: false,
		lookupDisplay: true,
		values: [
			"1",
			"2",
			"3",
			"4",
			"5",
			"6"
		],
		labels: [
			"1",
			"2",
			"3",
			"4",
			"5",
			"6"
		],
		"editor": {
			"type": "dropdown",
			"dropDownCount": 4
		},
		"header": {
			"text": "DropDown Edit"
		},
		styleName: "",
	},

	{
		name: "Month",
		fieldName: "Month",
		type: "data",
		width: "100",
		header: {
			text: "관세율"
		},
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
				var str = "";
					str += '<input type="text" class="input text-right" value="'+ cell.value + '"/>';
				return str;
			}
		},
		styleName: ""
	},
	{
		name: "InterestRate",
		fieldName: "InterestRate",
		type: "data",
		width: "70",
		numberFormat: "0.00",
		editable: false,
		header: {
			text: "이율"
		},
		styleName: ""
	},
	{
		name: "SaveCost",
		fieldName: "SaveCost",
		type: "data",
		width: "120",
		numberFormat: "#,##0",
		editable: false,
		header: {
			text: "종가"
		},
		styleName: "text-right color-gray"
	},
	{
		name: "SaveMaturity",
		fieldName: "SaveMaturity",
		type: "data",
		width: "120",
		numberFormat: "#,##0",
		editable: false,
		header: {
			text: "최저가"
		},
		styleName: "text-right color-blue"
	},
	{
		name: "CurrentSave",
		fieldName: "CurrentSave",
		type: "data",
		width: "120",
		numberFormat: "#,##0",
		editable: false,
		header: {
			text: "최고가"
		},
		styleName: "text-right color-red"
	}
];

var layout1
layout1 = [
	"Id",
	{
	  name: "dateGroup",
	  direction: "horizontal",
	  hideChildHeaders: true,  
	  width: 190,
	  items: [
		"Datetime1",
		"Bar",
		"Datetime2"
	  ],
	  header: {
		text: "시간 & 그룹핑"
	  }
	}, 
	// "Datetime-bt",
	"Monthpicker1",
	"Datepicker1",
	// "Monthpicker-bt",
	// "Datepicker-bt",
	"KorName",
	"Gender",
	// "Button",
	// "Age",
	// "Phone",
	// "KorCountry",
	"OrderDate",
	// "CardNumber",
	"Grade",
	// "Monetary",
	// "StartDate",
	// "EndDate",
	"ToMonth",
	// "Month",
	// "InterestRate",
	"SaveCost",
	"SaveMaturity",
	"CurrentSave",

];
  

var httpRequest;

function setProvider(filename) {
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = loadData;
	httpRequest.open("GET", "/guide/data/" + filename);
	httpRequest.send();
}

function loadData() {
	if (httpRequest.readyState === XMLHttpRequest.DONE) {
		if (httpRequest.status === 200) {
			var data = JSON.parse(httpRequest.responseText);
			dataProvider.setRows(data);
			setPaging();
		}
	}
}

var dataProvider, gridContainer, grid;

function createGrid(container) {
	dataProvider = new RealGrid.LocalDataProvider();
	gridView = new RealGrid.GridView(container);

	gridView.setDataSource(dataProvider);
	dataProvider.setFields(fields);
	gridView.setColumns(columns);
	
	//체크 이벤트 설정
	function valuecheck(dataRow, event) {
	var target = event.target;
	var value = target.value;
	var dataValue = dataProvider.getValue(dataRow, "Monetary").split(",");
	var idx = dataValue.indexOf(value);
	if (target.checked) {
		if (idx < 0) {
			dataValue.push(value);
		}
	} else {
		if (idx >= 0)
		dataValue.splice(idx, 1);
	}
	dataProvider.setValue(dataRow, "Monetary", dataValue.join(","));
  }
	gridView.displayOptions.useFocusClass = true;
	gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
	gridView.header.height = 42;

	
	
	/* 차장님 작업분 */
	gridView.sortingOptions.enabled = true;
	gridView.setRowIndicator({
		visible: false,
	});
	gridView.setStateBar({
		visible: false
	});
	var options = {
		width: 50,
	}
	gridView.setCheckBar(options);
	gridView.setFooters({
		visible: false
	});

	gridView.displayOptions.selectionStyle = "rows";// block, rows, columns, singleRow, singleColumn, none  
	gridView.displayOptions.rowHeight = -1;
	gridView.displayOptions.minRowHeight = 42;
	gridView.setDisplayOptions({
		useAlternateRowStyle: false,
	});
	/* // 차장님 작업분 */
	

	setProvider("simple_data300.json");
	gridView.setColumnLayout(layout1);
	
}

function start() {
	createGrid("realgrid");
}

window.onload = start;
// domloaded를 대신 써도 됩니다.

window.onunload = function () {
	dataProvider.clearRows();

	gridView.destroy();
	dataProvider.destroy();

	gridView = null;
	dataProvider = null;
};

function setPaging() {
	var totalData = dataProvider.getRowCount();    // 총 데이터 수
	var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
	var pageCount = 10;        // 한 화면에 나타낼 페이지 수

	setPageSelbox(totalData, dataPerPage);
	gridView.setPaging(true, dataPerPage);
	paging(totalData, dataPerPage, pageCount, 1);
}

function paging(totalData, dataPerPage, pageCount, currentPage) {
	console.log("currentPage : " + currentPage);

	var totalPage = Math.ceil(totalData / dataPerPage);    // 총 페이지 수
	var pageGroup = Math.ceil(currentPage / pageCount);    // 페이지 그룹

	console.log("pageGroup : " + pageGroup);

	var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
	if (last > totalPage)
		last = totalPage;
	var first = last - (pageCount - 1);    // 화면에 보여질 첫번째 페이지 번호
	var next = last + 1;
	var prev = first - 1;

	console.log("last : " + last);
	console.log("first : " + first);
	console.log("next : " + next);
	console.log("prev : " + prev);

	var $pingingView = $("#paging");

	var html = "";

	if (prev == 0) {
		html += "<a href=# id='first' class='disabled' aria-label='처음페이지'>|<</a> ";
		html += "<a href=# id='prev' class='disabled' aria-label='이전페이지'><</a> ";
	} else {
		html += "<a href=# id='first' aria-label='처음페이지'>|<</a> ";
		html += "<a href=# id='prev' aria-label='이전페이지'><</a> ";
	}


	for (var i = first; i <= last; i++) {
		html += "<a href='#' id=" + i + ">" + i + "</a> ";
	}

	if (last < totalPage) {
		html += "<a href=# id='next' aria-label='다음페이지'>></a>";
		html += "<a href=# id='last' aria-label='마지막페이지'>>|</a>";
	} else {
		html += "<a href=# id='next' class='disabled' aria-label='다음페이지'>></a>";
		html += "<a href=# id='last' class='disabled' aria-label='마지막페이지'>>|</a>";
	}

	$("#paging").html(html);    // 페이지 목록 생성

	$("#paging a#" + currentPage).addClass('active');    // 현재 페이지 표시

	$("#paging a").click(function (event) {
		event.preventDefault();

		var $item = $(this);
		var $id = $item.attr("id");
		var selectedPage = $item.text();


		if ($id == "first") selectedPage = 1;
		if ($id == "next") selectedPage = next;
		if ($id == "prev") selectedPage = prev;
		if ($id == "last") selectedPage = totalPage;
		/* custom 수정 */
		if (selectedPage < 1) selectedPage = 1;
		/* //custom 수정 */
		gridView.setPage(selectedPage - 1);
		paging(totalData, dataPerPage, pageCount, selectedPage);
	});

}

function setPageSelbox(totalData, dataPerPage) {
	var totalPage = Math.ceil(totalData / dataPerPage);    // 총 페이지 수

	for (var i = 1; i <= totalPage; i++) {
		var optStr = "<option value=" + i + ">" + i + "</option>";
		// console.log(optStr);
		$("#selBox").append(optStr);
	}

	$("#selBox").change(function () {
		var totalData = dataProvider.getRowCount();    // 총 데이터 수
		var dataPerPage = 10;    // 한 페이지에 나타낼 데이터 수
		var pageCount = 10;        // 한 화면에 나타낼 페이지 수
		var selectedPage = $(this).val();

		gridView.setPage(selectedPage - 1);
		paging(totalData, dataPerPage, pageCount, selectedPage);
	});
}

