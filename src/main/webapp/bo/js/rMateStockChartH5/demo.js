// 주어진 Date 에서 YYYY. MM. DD ( 요일 ) 형식으로 반환합니다.
// 실제 프로젝트 시엔 더 좋은 DateFormatter 를 사용하십시오.
var dateFormat = function(d, type) {
	var dYear = d.getFullYear();
	var dMonth = d.getMonth() + 1;
	if (parseInt(dMonth) < 10) // 01월 씩으로 표현
		dMonth = "0" + dMonth;
	var dDate = d.getDate();
	if (parseInt(dDate) < 10)
		dDate = "0" + dDate;
	var dDay = d.getDay();
	var dd = [ "일", "월", "화", "수", "목", "금", "토" ];
	var ret;
	if (type == 0) {
		ret = dYear + "" + dMonth + "" + dDate;
	} else if(type == "H:i"){
		ret = d.getHours()+":"+(d.getMinutes()<10?'0':'')+d.getMinutes();
	} else {
		ret = dYear + ". " + dMonth + ". " + dDate + " ( " + dd[dDay] + " ) ";
	}
	return ret;
};

function formatter(value) {
	var t = this;
	t.useThousandsSeparator = true;
	t.useNegativeSign = true;
	t.precision = 2;
	t.thousandsSeparatorTo = ",";
	t.decimalSeparatorTo = ".";
	t.rounding = "none";
	t.returnValueWhenError = false;

	var	n = parseFloat(value),
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

// 숫자를 컴마 적용시켜 반환합니다.
var commafy = function(n) {
	var reg = /(^[+-]?\d+)(\d{3})/; // 정규식
	n += ''; // 숫자를 문자열로 변환

	while (reg.test(n))
		n = n.replace(reg, '$1' + ',' + '$2');

	return n;
};


//-----------------------------------------------------------------
//
// Ajax 모듈
//
//------------------------------------------------------------------

var rlocalProtocol = /^(?:about|app|app\-storage|.+\-extension|file|widget):$/;
var rurl = /^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+))?)?/;
var ajaxLocation;
var ajaxLocParts;

try {
	ajaxLocation = location.href;
} catch( e ) {
	ajaxLocation = document.createElement( "a" );
	ajaxLocation.href = "";
	ajaxLocation = ajaxLocation.href;
}

ajaxLocParts = rurl.exec( ajaxLocation.toLowerCase() ) || [];

var isLocal = rlocalProtocol.test( ajaxLocParts[ 1 ] );

var ajax = function(options) {

	options = {
		type : options.type || "GET", // 요청 타입
		url : options.url || "", // url
		timeout : options.timeout || 30000, // 타임아웃(30초)
		onError : options.error || function() {}, // 요청 실패
		onSuccess : options.success || function() {}, // 요청 성공
		data : options.data || "" // 서버에서 반환할 데이터 타입
	};

	var i, xhr,
		activeXids = ['MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP', 'Microsoft.XMLHTTP'];

	// 로컬환경, IE 에서 ajax rpc 사용하기 위해 우선적으로 로컬인 경우 ActiveX 로 생성함.
	if("ActiveXObject" in window) {
		if(isLocal) {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	if(!xhr) {
		try{
			xhr = new XMLHttpRequest();
		} catch(e) { // IE 7 이하 버전
			for (i=0; i<activeXids.length; i++) {
				try {
					xhr = new ActiveXObject(activeXids[i]);
					break;
				}catch(e) {}
			}
		}
	}

	var timeoutLength = options.timeout;
	var requestDone = false;

	setTimeout(function() {
		requestDone = true;
	}, timeoutLength);

	// 문서 상태가 언제 갱신되는지 검사.
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && !requestDone) {

			if(httpSuccess(xhr)) { // 성공 여부 검사
				if(xhr.responseXML && (xhr.responseText == "" || typeof xhr.responseText == "undefined")) {
					options.onSuccess.call(xhr, xhr.responseXML);
				} else {
					options.onSuccess.call(xhr, __parseJSON(xhr.responseText));
				}
			} else {
				options.onError.call(xhr, xhr.status,targets);
			}
			xhr = null;
		}
	};

	//--- XMLHttpRequest 보안 사항
	// XMLHttpRequests는 로컬 파일에 대한 접근은 기본적으로 불가능함
	// 단, 파폭에선 로컬에서 로컬 접근은 가능함.
	// IE의 경우 ActiveXObject 의 Microsoft.XMLHTTP 로 생성하는 경우 가능함. (권장사항은 아님)
	try{
		xhr.open(options.type, options.url, true); // 요청 생성
		xhr.send();
	}catch(e) {
		options.onError(e.message);
	}

	// HTTP 응답이 성공했는지 확인하는 함수
	function httpSuccess(r) {
		try {
			// 로컬인 경우 status 가 없는 경우도 성공으로 간주
			return !r.status && isLocal ||

				// 상태코드가 200대라면 성공
				(r.status >= 200 && r.status < 300) ||

				// 문서가 변경되지 않았으면 성공으로 간주
				r.status == 304 ||

				// 사파리인 경우 문서가 변경되지 않은 경우 빈 상태 코드 반환.
				navigator.userAgent.indexOf("Safari") >= 0 && isNull(r.status);
		} catch(e) {}
		return false;
	};
};

// JSON 스트링을 JSON Obejct 로 변환하여 반환합니다.
var __parseJSON = function(data) {
	if (window.JSON && window.JSON.parse) {
		return window.JSON.parse(data);
	}

	if (data === null) {
		return data;
	}

	if (typeof data === "string") {
		data = data.replace(/(^\s*)|(\s*$)/gi, ""); // 공백제거
		if (data) {
			return (new Function("return " + data))();
		}
	}

	throw ("Invalid JSON: " + data);
};

function isNaN2( obj ) {
	return isNaN(obj) || obj == null || !isNumber(obj);
};

function isNull(obj) {
	return obj == null || typeof obj === "undefined" || obj === "undefined";
};


