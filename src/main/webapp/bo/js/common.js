'use strict';


$(function () {
	sideMenuOpen();
})

/* =====================================
*
*   페이지에 쓰는 스크립트
*	<script type="text/javascript">
*	$(function(){	      
*	$('#treeMenu').jstree(); 
*	})
*	</script>
*
* =====================================*/

/* =====================================
* tab
* =====================================*/
function tab(e, num) {
	$('.tab-panel').css('display', 'none');
	// console.log("e",e);
	var num = num || 0;
	var menu = $(e).children();
	var con = $(e + 'Con').children();
	var select = $(menu).eq(num);
	var i = num;

	select.addClass('active');
	con.eq(num).show();
	menu.click(function () {
		if (select !== null) {
			select.removeClass("active");
			con.eq(i).hide();
		}
		select = $(this);
		i = $(this).index();
		select.addClass('active');
		con.eq(i).show();
	});
}

/* =====================================
* side submenu accordion
* =====================================
*/
//$('.web-sidebar .has-submenu:first-child').addClass('active'); //첫번째 메뉴는 열림, 20220112 제거, 동작하지 않음
$(document).on('click', '.web-sidebar .has-submenu > .sidebar-1depth', function () {
	//$('.web-sidebar .sidebar-2depth.has-submenu:first-of-type').addClass('active'); //첫번째 메뉴는 열림 - 20220112 제거
	
	if ($(this).parent().hasClass('active')) {
		// $(this).next('.web-sidebar .sidebar-2depth').slideUp(200); // 20220112 제거, jquery slide 함수 이용 시 display들이 꼬인다...
		$(this).parent().removeClass('active');
	} else {
		$(this).next('.web-sidebar .sidebar-2depth.has-submenu:first-of-type').addClass('active'); //첫번째 메뉴는 열림 - 20220112 추가
		
		//$(this).next('.web-sidebar .sidebar-2depth').slideDown(200); // 20220112 제거, jquery slide 함수 이용 시 display들이 꼬인다...
		
		// 대메뉴 선택 후 메뉴가 열릴 때, 열려있는 대메뉴, 중메뉴를 찾아서 닫아준다. 20220112 추가
		let currentActiveId = $(this).parent().attr('id');
		$.each($('.web-sidebar .has-submenu > .sidebar-1depth').parent().filter('.active'), function(depth1Idx, depth1El) {
			let preActiveId = $(depth1El).attr('id');
			if(currentActiveId != preActiveId) {
				$(depth1El).removeClass('active');
				
				$.each($(depth1El).children('.web-sidebar .has-submenu > .sidebar-2depth').filter('.active'), function(depth2Idx, depth2El) {
					$(depth2El).removeClass('active');
				});
			}
		});
		
		setTimeout(function () {
			$('.web-sidebar .sidebar-2depth').css({ 'overflow': 'visible' });
		}, 200);
		$(this).parent().addClass('active');
	}
});

$(document).on('click', '.web-sidebar .sidebar-2depth.has-submenu > a', function () {
	if ($(this).parent('.sidebar-2depth').hasClass('active')) {
		//$(this).next('.web-sidebar .sidebar-3depth').slideUp(200); // 20220112 제거, jquery slide 함수 이용 시 display들이 꼬인다...
		$(this).parent('.sidebar-2depth').removeClass('active');
	} else {
		//$(this).next('.web-sidebar .sidebar-3depth').slideDown(200); // 20220112 제거, jquery slide 함수 이용 시 display들이 꼬인다...
		
		// 중메뉴 선택 후 메뉴가 열릴 때, 열려있는 중메뉴를 찾아서 닫아준다. 20220112 추가
		let currentActiveId = $(this).parent().attr('id');
		$.each($('.web-sidebar .has-submenu > .sidebar-2depth').filter('.active'), function(idx, el) {
			let preActiveId = $(el).attr('id');
			if(currentActiveId != preActiveId) {
				$(el).removeClass('active');
			}
		});
		
		setTimeout(function () {
			$('.web-sidebar .sidebar-3depth').css({ 'overflow': 'visible' });
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
* select
* =====================================
*/
$(function() {
	var selectTarget = $('.form-select');
	// focus 가 되었을 때와 focus 를 잃었을 때
	selectTarget.on({
	  'click': function() {
		$(this).toggleClass('focus');
	  },
	  'blur': function() {
		$(this).removeClass('focus');
	  },
	  
	});
});

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
		modalBackdrop : true , 
		showMeridian: false,
	}); 
	$('body').on('focus', '.form-time .input', function() { //
		$(this).timepicker({
			minuteStep: 1,
			modalBackdrop : true , 
			showMeridian: false,
		}); 
	});
});

/* =====================================
* 파일 첨부
* =====================================
*/
/*$(function () {
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
});*/

/* =====================================
* 테이블 삭제 - SC-MBB-002.html 스크립트 임의작성
* =====================================
*/
$(function () {
	$('.table-del').on('click', function () {
		$(this).parents('.table').remove();
	})
})

