'use strict';
// console.log('SORIN e-Commerce');

$( function() {
    /* Select2 */
    $('select.dropdown').select2({
        width: 'element',
        minimumResultsForSearch: Infinity
    });
    $('select.dropdown').off('select2:open').on('select2:open', function (e) {
        $('.select2-dropdown').hide();
        setTimeout(function(){ jQuery('.select2-dropdown').slideDown("slow", "easeInOutQuint"); }, 200);
    });

    /* Datepicker */
    if ($('.datepicker').length > 0) {
        $('.datepicker').datepicker({
            showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여줌
            buttonImage: "/images/calendar.png", // 버튼 이미지
            buttonImageOnly: true, // 버튼에 있는 이미지만 표시
            changeMonth: false, // 월을 바꿀수 있는 셀렉트 박스를 표시
            changeYear: false, // 년을 바꿀 수 있는 셀렉트 박스를 표시
            minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시
            nextText: '다음 달', // next 아이콘의 툴팁
            prevText: '이전 달', // prev 아이콘의 툴팁
            numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시
            stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가
            yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가
            showButtonPanel: false, // 캘린더 하단에 버튼 패널을 표시
            // currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
            // closeText: '닫기', // 닫기 버튼 패널
            dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식
            showAnim: "slideDown", //애니메이션을 적용
            showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 변경
            dayNamesMin: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'], // 요일의 한글 형식
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식. yearRange: "2010:2013" //연도 범위
            weekHeader: "주",
            yearSuffix: '년'
        });
    }

	$('.button-group button').off('click').on('click', function(){
	    $(this).removeClass('btn-stroke-md').addClass('btn-blue-md').siblings().removeClass('btn-blue-md').addClass('btn-stroke-md');
	});


	// 헤더 util menu
	$('.util-list ul li').off('click mouseenter mouseleave').on({


	    click: function() {
	        // console.log('click');
	    },
	    mouseenter: function(e) {
	        e.preventDefault();
	        var toggleDivision = $(this).find('.header-toggle');
	        var memberPopState = $(this).parent();
			var classId = $(this).attr('class');
			var headUtil = $('.util-list > ul');


	        if(memberPopState.hasClass('member-pop-on') !== true) {
	        	//정회원 계좌 잔액
				if(classId=="util-memberinfo" && sessionStorage.getItem("headerInfoPopFlag") !== "Y" ){

					toggleDivision.addClass('active');

				}
	        	//정회원 인증 알림 O
				else if(classId=="util-memberinfo" && sessionStorage.getItem("headerInfoPopFlag") !== "N"){

		    		headUtil.addClass('member-pop-on');
				}
				//정회원 잔고 알림 팝업
				else{
					toggleDivision.addClass('active');
				}

	        }

	        //일반회원 팝업제어
	        if(sorinAccount != null && sorinAccount != undefined) {
		        if((sorinAccount.mberSttusCode == '01'||sorinAccount.mberSttusCode == '02') && sorinAccount.refndAcnutSttusCode == null){
					toggleDivision.addClass('active');
		        }
	        }

	    },
	    mouseleave: function(e) {
	        e.preventDefault();
	        var leaveDivision = $(this).find('.header-toggle');
	        var memberPopState = $(this).parent();
			var classId = $(this).attr('class');
			var headUtil = $('.util-list > ul');

	    	if(classId=="util-memberinfo" && sessionStorage.getItem("clickMberInfo") !== "N"){
		    		headUtil.removeClass('member-pop-on');
			}

	        if(sorinAccount != null && sorinAccount != undefined) {
	        	//정회원 팝업제어
		        if((sorinAccount.mberSttusCode == '01'||sorinAccount.mberSttusCode == '02') && sorinAccount.refndAcnutSttusCode == "05"){

					//정회원 잔고 알림
					if(classId=="util-memberinfo" && sessionStorage.getItem("headerInfoPopFlag") !== "Y" ){

						leaveDivision.removeClass('active');

					} else{

						leaveDivision.removeClass('active');
					}

		        } else{

					if(classId=="util-memberinfo"){

						if(classId=="util-memberinfo" && sessionStorage.getItem("clickMberInfo") !== "N"){
			    			headUtil.removeClass('member-pop-on');
						}

					} else {

						leaveDivision.removeClass('active');
					}

		        }

		        //일반회원 팝업제어
		        if((sorinAccount.mberSttusCode == '01'||sorinAccount.mberSttusCode == '02') && sorinAccount.refndAcnutSttusCode == null){
		            leaveDivision.removeClass('active');
		        }
	        }
	    }
	});

	// 안내 팝업 닫기
	$(document).off('click','.member-pop-close').on('click','.member-pop-close', function() {

        sessionStorage.setItem('clickMberInfo', "Y");
	    $('.util-list ul').removeClass('member-pop-on');
	});

	// 안내 팝업만 노출 시 클래스 추가 << 사용 시 주석 제거
	// 정회원의 경우 특정 상황에서만 일림팝업 추후에는 잔고 알림
	// 비밀번호 5회 오류시 회원상태 02로 되는 문제가 있어 02도 01과 함께 로그인시 정회원 취급

	if(sorinAccount != null && sorinAccount != undefined) {
		if ((sorinAccount.mberSttusCode == '01' || sorinAccount.mberSttusCode == '02') && sorinAccount.refndAcnutSttusCode == "05") {

			//접속일자 < 승인일자 : 알림팝업 띄우기
			 if(sorinAccount.currentDt < sorinAccount.mberConfmProcessDt){

	                sessionStorage.setItem('headerInfoPopFlag', "Y");
					headerInfoPop();
			 }

			//접속일자 > 승인일자 : e-wallet 잔고/이메일 띄우기
			 else {

	                sessionStorage.setItem('headerInfoPopFlag', "N");
			 }

		} else{
	                sessionStorage.setItem('headerInfoPopFlag', "Y");
					headerInfoPop();
		}
	}

});

// 안내 팝업만 노출 시 클래스 추가
function headerInfoPop() {
    var headUtil = $('.util-list > ul');
    headUtil.addClass('member-pop-on');
}


/*
// 헤더
$(document).off('mouseover', '.btn-header-member').on('mouseover', '.btn-header-member', function(e){
    e.preventDefault();
	var loginDivision = $(this).next().attr("id");
    $('#'+loginDivision).addClass('active');
});
$(document).off('mouseleave', '.util-memberinfo').on('mouseleave', '.util-memberinfo', function(){
	var loginDivision = $(this).parent().attr("id");
    //$('#'+loginDivision+' .header-toggle').removeClass('active');
});
 헤더에서 재작성
$(document).off('mouseover', '.btn-header-alarm').on('mouseover', '.btn-header-alarm', function(e){
    e.preventDefault();
    $('#noticeAlert').addClass('active');
});

$(document).off('mouseleave', '.util-alert').on('mouseleave', '.util-alert', function(){
    $('#noticeAlert').removeClass('active');
});
$(document).off('mouseover', '.btn-header-account').on('mouseover', '.btn-header-account', function(e){
    e.preventDefault();
    $('#chkAccount').addClass('active');
});
$(document).off('mouseleave', '.util-account').on('mouseleave', '.util-account', function(){
    $('#chkAccount').removeClass('active');
});
*/
var timeOut;
// Time Countdown
function countdown( elementName, minutes, seconds ){
    var element, endTime, hours, mins, msLeft, time;
    clearTimeout(timeOut);
    function twoDigits( n ) {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer() {
        msLeft = endTime - (+new Date);
        if ( msLeft < 1000 ) {
            element.innerHTML = "0:00";
        } else {
            time = new Date( msLeft );
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            element.innerHTML = (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() );
            timeOut = setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
        }
    }
    element = document.getElementById( elementName );
    endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
    updateTimer();
}
if ($('#timeset').length > 0) {
    countdown( "timeset", 100, 0 );
};

/* Button Effect */
function createRipple(event) {
    const button = event.currentTarget;
    const circle = document.createElement("span");
    const diameter = Math.max(button.clientWidth, button.clientHeight);
    const radius = diameter / 2;
    circle.style.width = circle.style.height = '${diameter}px';
    circle.style.left = '${event.clientX - button.offsetLeft - radius}px';
    circle.style.top = '${event.clientY - button.offsetTop - radius}px';
    circle.classList.add("ripple");
    const ripple = button.getElementsByClassName("ripple")[0];
    if (ripple) {
        ripple.remove();
    }
    button.appendChild(circle);
}
for (const button of document.getElementsByTagName("button")) {
    button.addEventListener("click", createRipple);
}

/* Button Toggle */
$(document).off('click', '.btn-toggle-wrap .toggle').on('click', '.btn-toggle-wrap .toggle', function(){
	/*2023.09.07 일반회원 로그인 중지*/
	if($(this).attr('id') == 'simpleLogin-tab') return;

    $(this).addClass('active').parent().siblings().find('.toggle').removeClass('active');
});

/* Input Effect */
$('.form-ani input').each(function(){
    if ( $(this).attr('value') == '' || $(this).attr('value') == 'undefined' || $(this).attr('value') == null ) {
        // console.log('t')
    } else {
        $(this).parents('.form-ani').addClass('hasValue');
    }
});

/******** 공통 : 관리자 등록 DB 로딩 이미지 처리 */
$('.figure img').each(function(){
    if ($(this).hasClass('initial')){ return; } else {
        let imgRatio = $(this).width() / $(this).height();
        let divRatio = $(this).parents('.figure').width() / $(this).parents('.figure').height();
        if (imgRatio > divRatio) {
            $(this).addClass('h');
        } else {
            $(this).addClass('w')
        }
    }
});

/* type=tel 숫자만 */
$('[type=tel]').keyup(function(e){
    let inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^0-9]/gi,''));
});

// 해시 버튼 / 임시 / 배송지 관리 : 배송지 목록 버튼화
$(document).off('click', '.hash-wrap button').on('click', '.hash-wrap button', function(){
    $(this).addClass('btn-blue-md').removeClass('btn-stroke-md').siblings().addClass('btn-stroke-md').removeClass('btn-blue-md');
});

/* Group Button */
$('.button-group button').off('click').on('click', function(){
    $(this).removeClass('btn-stroke-md').addClass('btn-blue-md').siblings().removeClass('btn-blue-md').addClass('btn-stroke-md');
});


/* ================= POPUP ================= */

/* popup 호출 */
$(document).off('click', '[data-popup]').on('click', '[data-popup]', function(e) {
    e.preventDefault();
    let dataPopup = $(this).attr('data-popup');
    let dataTarget = $(this).attr('data-target');
    popup(dataTarget, dataPopup);
	modalOpenFocus();

	$('body,html').css({'overflow':'hidden'});   // 팝업 활성화시 스크롤 막기
});

/* popup header X 버튼 close */
$(document).off('click', '.modal-x').on('click', '.modal-x', function(e) {
    e.preventDefault();
    $(this).closest('.popup').removeClass('active');
	modalCloseFocus();

	$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
});

function popup(dataTarget, dataPopup, msg){
    let dataId = '#' + dataTarget;
    if (dataPopup == 'modal') { // 일반 modal
        $(dataId).addClass('active');
    } else if (dataPopup == 'bottomsheet') { // 주문 modal
        $(dataId).addClass('active');
    } else if (dataPopup == 'alert') { // alert modal
        $(dataId).find('.alert-con').text(msg);
        $(dataId).addClass('active');
        $('#sorinModalAlert .alert-con').text(msg);
    } else if (dataPopup == 'confirm') { // confirm modal
        $(dataId).find('.alert-con').text(msg);
        $(dataId).addClass('active');
        $('#sorinModalConfirm .alert-con').text(msg);
    }
}

//alert 전용 popup 재 정의
function alertPopup(msg, callbackFunc){
	setTimeout(function () {
		$("#alertPopup .modal-ok").focus();
	}, 100);

	$("#alertPopup .modal-ok").unbind("click");

	if(msg != undefined) {
		let textArea = $("#alertPopup").find('.alert-con').text(msg);
		textArea.html(textArea.html().replace(/\n/g, '<br/>'));

	    $("#alertPopup").addClass('active');

		$("#alertPopup .modal-ok").click(function(e){
	        if(typeof callbackFunc != 'undefined' && callbackFunc){
	            if(typeof callbackFunc == 'function'){
	                if(callbackFunc() == true) {
						$("#alertPopup").closest('.popup').removeClass('active');
						modalCloseFocus();

						$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
					}
	            }
	        }
	    });
    } else {
    	let beforeTextArea = $("#alertPopup").find('.alert-con').text();
    	let afterTextArea = $("#alertPopup").find('.alert-con').text(beforeTextArea + '\ntime초 후 새로고침합니다.');
    	let message = afterTextArea.html().split("&");
		let time = 3;
		message = message[0].split("time");
		afterTextArea.html((message[0] + time + message[1]).replace(/\n/g, '<br/>'));

		$("#alertPopup").addClass('active');

		let timerId = setInterval(function() {
			time--;
			afterTextArea.html((message[0] + time + message[1]).replace(/\n/g, '<br/>'));
			if(time == 0) {
				clearInterval(timerId);
				$("#alertPopup").closest('.popup').removeClass('active');
				modalCloseFocus();
    			moveToMain();
			}
		}, 1000);
    }
}

//confirm 전용 popup 재 정의
function confirmPopup(msg, callbackFunc){
	setTimeout(function () {
		$("#confirmPopup .modal-ok").focus();
	}, 100);

	$("#confirmPopup .modal-ok").unbind("click");
    $("#confirmPopup .modal-cancel").unbind("click");

	let textArea = $("#confirmPopup").find('.alert-con').text(msg)
	textArea.html(textArea.html().replace(/\n/g, '<br/>'));

	$("#confirmPopup").addClass('active');

    $("#confirmPopup .modal-ok").click(function(e){
        if(typeof callbackFunc != 'undefined' && callbackFunc){
            if(typeof callbackFunc == 'function'){
                if(callbackFunc() == true) {
					$("#confirmPopup").closest('.popup').removeClass('active');
					modalCloseFocus();

					$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
				}
            }
        }
    });

    $("#confirmPopup .modal-cancel").click(function(e){
        $("#confirmPopup").closest('.popup').removeClass('active');
		modalCloseFocus();

		$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
    });
}

//confirm 전용 popup 재 정의 (가운데 정렬)
function confirmPopup2(msg, callbackFunc){
	setTimeout(function () {
		$("#confirmPopup2 .modal-ok").focus();
	}, 100);

	$("#confirmPopup2 .modal-ok").unbind("click");
    $("#confirmPopup2 .modal-cancel").unbind("click");

	let textArea = $("#confirmPopup2").find('.alert-con').text(msg)
	textArea.html(textArea.html().replace(/\n/g, '<br/>'));

	$("#confirmPopup2").addClass('active');

    $("#confirmPopup2 .modal-ok").click(function(e){
        if(typeof callbackFunc != 'undefined' && callbackFunc){
            if(typeof callbackFunc == 'function'){
                if(callbackFunc() == true) {
					$("#confirmPopup2").closest('.popup').removeClass('active');
					modalCloseFocus();

					$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
				}
            }
        }
    });

    $("#confirmPopup2 .modal-cancel").click(function(e){
        $("#confirmPopup2").closest('.popup').removeClass('active');
		modalCloseFocus();

		$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
    });
}

//confirm 전용 popup 재 정의 (가운데 정렬, 버튼명 재정의) 재정의버튼 후처리필요
function confirmPopupCustom(msg, btnNm, callbackFunc){
	
	var confirmPopupCustomHtml = '<div class="modal-content w490px"><div class="modal-header"><h1>알림메세지</h1>'
		+ '<div class="modal-close"><button type="button" class="modal-x"><span class="hidden">팝업 닫기</span></button></div></div>'
		+ '<div class="max-width"><div class="alert-con">잘못된 접근 입니다.</div></div>'
		+ '<div class="modal-btns"><button type="button" class="btn-gray-big modal-cancel">취소</button>'
		+ '<button type="button" class="btn-blue-big modal-ok">확인</button></div></div>'
		
	$('#confirmPopupCustom').empty();
	$('#confirmPopupCustom').append(confirmPopupCustomHtml);
	
	setTimeout(function () {
		$("#confirmPopupCustom .modal-ok").focus();
	}, 100);

	$("#confirmPopupCustom .modal-ok").unbind("click");
	$("#confirmPopupCustom .modal-cancel").unbind("click");
	$("#confirmPopupCustom .modal-ok").text(btnNm);

	let textArea = $("#confirmPopupCustom").find('.alert-con').text(msg);
	textArea.html(textArea.html().replace(/\n/g, '<br/>'));
	
	$("#confirmPopupCustom").addClass('active');
	
	$("#confirmPopupCustom .modal-ok").off("click").on("click", function(e) {
		if(typeof callbackFunc != 'undefined' && callbackFunc){
			$("#confirmPopupCustom").closest('.popup').removeClass('active');
			modalCloseFocus();
			$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
			callbackFunc(true);
		}
	});
	
	$("#confirmPopupCustom .modal-cancel").off("click").on("click", function(e) {
		$("#confirmPopupCustom").closest('.popup').removeClass('active');
		modalCloseFocus();

		$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
		callbackFunc(false); 
	});
}

//modal 확인버튼 or 취소버튼 전용 popup 재 정의
function confirmModal(dataTarget, callbackFunc) {
	let dataId = '#' + dataTarget;

	$(dataId + " .modal-ok").unbind("click");
    $(dataId + " .modal-cancel").unbind("click");

	$(dataId).addClass('active');

	$(dataId + " .modal-ok").click(function(e){
        if(typeof callbackFunc != 'undefined' && callbackFunc){
            if(typeof callbackFunc == 'function'){
                if(callbackFunc() == true){
					$(dataId).closest('.popup').removeClass('active');
					modalCloseFocus();

					$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
				}
            }
        }
    });

    $(dataId + " .modal-cancel").click(function(e){
        $(dataId).closest('.popup').removeClass('active');
		modalCloseFocus();

		$('body,html').css({'overflow':'inherit'});   // 팝업 비활성화시 스크롤
    });
}

// 팝업 내 탭키 이동
function modalOpenFocus() {
    const focusableElements = 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';
    const modal = document.querySelector('.modal.active');
	const firstFocusableElement = modal.querySelectorAll(focusableElements)[0];
    const focusableContent = modal.querySelectorAll(focusableElements);
    const lastFocusableElement = focusableContent[focusableContent.length - 1];



    document.addEventListener('keydown', function(e) {
        let isTabPressed = e.key === 'Tab' || e.keycode === 9;

        if (!isTabPressed) {
            return;
        }

        if (e.shiftKey) {
            if (document.activeElement === firstFocusableElement) {
                lastFocusableElement.focus();
                e.preventDefault();
            }
        } else {
            if (document.activeElement === lastFocusableElement) {
                firstFocusableElement.focus();
                e.preventDefault();
            }
        }
    });
    firstFocusableElement.focus();
}


// 2중 팝업(alert, confirm) 닫힐 때 체크
function modalCloseFocus() {
    const modalCount = $('.modal.active').length;
	if (modalCount !== 0) {
		modalOpenFocus();
	}
}

// 차트 data type active
function chartTimeActive() {
	$(document).off('click', '.top_data_dype li').on('click', '.top_data_dype li', function(e){
		var thisEl = $(e.target);
		thisEl.siblings().removeClass('on');
		thisEl.addClass('on');
	});
}
chartTimeActive();

/* function chartChangeCheck() {
 	$(document).off('click', '.chart-tab-area button').on('click', '.chart-tab-area button', function() {
		var changeTop = $(this).parents().parents().siblings('.rChart-graph').children('.rcharts-wrap').children('.top').find('ul');
		changeTop.children('li').removeClass('on');
		changeTop.children('li:first-child').addClass('on');
	});
}
chartChangeCheck(); */