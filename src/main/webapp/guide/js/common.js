'use strict';


$(function () {
	sideMenuOpen();
})
/* =====================================
* tab
* =====================================*/
function tab(e, num) {
	$('.tab-panel').css('display', 'none');
	//console.log("e",e);
	var num = num || 0;
	var menu = $(e).children();
	var con = $(e + 'Con').children();
	var select = $(menu).eq(num);
	var defaultSelect = $(menu).eq(0);
	var i = num;
	
	con.hide();
	con.eq(0).show();
	defaultSelect.addClass('active');
	select.addClass('active');
	con.eq(num).show();
	
	menu.click(function () {
		if (select !== null) {
			defaultSelect.removeClass('active');
			select.removeClass("active");
			con.eq(i).hide();
		}
		select = $(this);
		i = $(this).index();
		select.addClass('active');
		con.hide();
		con.eq(i).show();
	});
}

/* =====================================
* side submenu accordion
* =====================================
*/
$('.web-sidebar .has-submenu:first-child').addClass('active'); //첫번째 메뉴는 열림
$(document).on('click', '.web-sidebar .has-submenu > .sidebar-1depth', function () {
	$('.web-sidebar .sidebar-2depth.has-submenu:first-of-type').addClass('active'); //첫번째 메뉴는 열림
	if ($(this).parent().hasClass('active')) {
		$(this).next('.web-sidebar .sidebar-2depth').slideUp(200);
		$(this).parent().removeClass('active');
	} else {
		$(this).next('.web-sidebar .sidebar-2depth').slideDown(200);
		setTimeout(function () {
			$('.web-sidebar .sidebar-2depth').css({ "overflow": "visible" });
		}, 200);
		$(this).parent().addClass('active');
	}
});

$(document).on('click', '.web-sidebar .sidebar-2depth.has-submenu > a', function () {
	if ($(this).parent('.sidebar-2depth').hasClass('active')) {
		$(this).next('.web-sidebar .sidebar-3depth').slideUp(200);
		$(this).parent('.sidebar-2depth').removeClass('active');
	} else {
		$(this).next('.web-sidebar .sidebar-3depth').slideDown(200);
		setTimeout(function () {
			$('.web-sidebar .sidebar-3depth').css({ "overflow": "visible" });
		}, 200);
		$(this).parent('.sidebar-2depth').addClass('active');
	}

});

/* =====================================
* side menu open 
* =====================================
*/
function sideMenuOpen() {
	$(document).on('click', '.hamburger', function (e) {
		e.preventDefault();

		if ($('.web-wrapper').hasClass('is-active')) { // 메뉴 열렸을 때
			$('.web-wrapper').removeClass('is-active');


		} else { //메뉴 닫혔을 때
			$('.web-wrapper').addClass('is-active');
		}
	});
	if ($(document).width() < 1480) {
		$('.web-wrapper').addClass('is-active');
	} else {
		$('.web-wrapper').removeClass('is-active');
	}
	$(window).resize(function () {
		if ($(document).width() < 1480) {
			$('.web-wrapper').addClass('is-active');
		} else {
			$('.web-wrapper').removeClass('is-active');
		}
	})
}

/* =====================================
*  bootstrap datepicker (월선택)
* =====================================
*/

$(function() {
	$('.form-month').click(function() {
		console.log('월선택');
	})
	$(document).find('.form-month').datepicker({
		format: "yyyy-mm",
		startView: 1,
		minViewMode: 1,
		maxViewMode: 3,
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		todayHighlight: true,
		language:"ko",
	});
	$('body').on('focus', '.form-month', function() { // Id's Containing "datepickerfrom" string, bind the datetimepicker
        $(this).datepicker({
            format: "yyyy-mm",
			startView: 1,
			minViewMode: 1,
			maxViewMode: 3,
			keyboardNavigation: false,
			forceParse: false,
			autoclose: true,
			todayHighlight: true,
			language:"ko",
        });
    });
});
/* =====================================
*  bootstrap datepicker (일선택)
* =====================================
*/
$(function() {
	$('.form-date').datepicker({
		format: "yyyy-mm-dd",
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		todayHighlight: true,
		language:"ko",
	});
	$('body').on('focus', '.form-date', function() { // Id's Containing "datepickerfrom" string, bind the datetimepicker
        $(this).datepicker({
            format: "yyyy-mm-dd",
			keyboardNavigation: false,
			forceParse: false,
			autoclose: true,
			todayHighlight: true,
			language:"ko",
        });
    });
});
/* =====================================
*  bootstrap datepicker (시간선택)
* =====================================
*/
$(function() {
	$('.form-time .input').timepicker({
		minuteStep: 1,
		defaultTime: '',
		showSeconds: false,
		showMeridian: false,
		snapToStep: true
	}); 
	$('body').on('focus', '.form-time .input', function() { //
		$(this).timepicker({
			minuteStep: 1,
			defaultTime: '',
			showSeconds: false,
			showMeridian: false,
			snapToStep: true
		}); 
	});
});


/* =====================================
* 파일 첨부
* =====================================
*/
$(function () {
	$(".btn-file").click(function () {
		$(this).find('[type=file]').not('.is-evented').on('change', function () {
			var value = $(this).val();
			console.log('value', value);

			var newRowContent = '';

			newRowContent += ' <tr>';
			newRowContent += ' <td>';
			newRowContent += '<div class="file-group">';
			newRowContent += '<span class="file">' + value + '</span>';
			newRowContent += '<div class="btn-box btn-box-sm">';
			newRowContent += '<button type="button" class="btn btn-border" disabled><span>다운로드</span><i class="icon icon-download"></i></button>';
			newRowContent += '<button type="button" class="btn btn-border" disabled><span>미리보기</span><i class="icon icon-preview"></i></button>';
			newRowContent += '<button type="button" class="btn btn-border" disabled><span>삭제하기</span><i class="icon icon-delete"></i></button>';
			newRowContent += ' </div>';
			newRowContent += ' </div>';
			newRowContent += ' </td>';
			newRowContent += ' <td>' + "224.96KB" + '</td>';
			newRowContent += ' </tr>';
			$(".table-inner tbody").append(newRowContent);
		}).addClass('is-evented');
	});
});


/* =====================================
* 테이블 삭제 - SC-MBB-002.html 스크립트 임의작성
* =====================================
*/

$(function () {
	$('.table-del').on('click', function () {
		$(this).parents('.table').remove();
	})
})


/* =====================================
* 모달창 오픈시 스크롤 잠금, 닫기 시 스크롤 오픈
* =====================================
*/

function modalFix(){
	$('body').css('overflow', 'hidden');
	$('.modal-x').click(function(){
		$('body').css('overflow', 'auto');
	})
}


/* =====================================
* momth-picker 
*
* 페이지 내에 스크립트 적용되어있음
* 
* 사용 예 ) 
* <script type="text/javascript">
* 	$( function() {
* 		$( "#monthpicker1" ).datepicker({});
* 	});
* </script>
* =====================================
*/
// $(function(){	
// 	var monthpicker = {
// 		monthNames : [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
// 		monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",	"9월", "10월", "11월", "12월" ],
// 		changeMonth: true,
// 		changeYear: true,
// 		showButtonPanel: false, //하단 오늘, 완료 버튼 삭제
// 		dateFormat: 'yy-MM',
// 		showButtonPanel: false,
// 		showMonthAfterYear : true,
// 		beforeShow: function(input, inst) {
// 			$('#ui-datepicker-div').addClass('form-month');
// 		},
// 		onClose : function(dateText, inst) { 
// 			$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));

// 		},
// 	}
// });
/* =====================================
* datepicker 
*
* 페이지 내에 스크립트 적용되어있음
* 
* 사용 예 ) 
* <script type="text/javascript">
* 	$( function() {
* 		$( "#datepicker1" ).datepicker({});
* 	});
* </script>
*
* =====================================
*/
// $(function () {
// 	// KR language callendar
// 	$.datepicker.regional['kr'] = {
// 		closeText: '닫기',
// 		currentText: '오늘',
// 		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
// 		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
// 		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
// 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
// 		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
// 		dateFormat: 'yy-mm-dd',
// 		showMonthAfterYear: true,
// 		changeYear: true,
// 	};
// 	// Seeting up default language, Korean
// 	$.datepicker.setDefaults($.datepicker.regional['kr']);
// });
