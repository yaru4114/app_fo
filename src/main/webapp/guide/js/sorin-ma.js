'use strict';
/********* MAIN */
$(function(){

  var metalWorldSwiper = new Swiper(".metal-world-swiper", {
    pagination: {
      // el: ".swiper-pagination",
      type: "fraction",
    },
    navigation: {
      nextEl: ".metal-world-next",
      prevEl: ".metal-world-prev",
    },
  });

  // chart-tab 클릭 이벤트
  $(document).on('click','.chart-tab-area > button', function(e) {
    e.preventDefault;
	let type;

    var buttonAl = $('.chart-tab-area .btn-AL');
    var buttonZn = $('.chart-tab-area .btn-ZN');

	let metalCode;
	let itmSn;
	let dstrctLclsfCode;
	let brandGroupCode;
	let brandCode;
	let sleMthdCode;

//metalGroup="${fixListProd.codeNm}"
    if ( $(this).hasClass('btn-AL') ) { // 알루미늄 탭 선택 시
      buttonAl.addClass('active').siblings().removeClass('active');  // 버튼
      $('#tbodyAL').show().siblings('div[id^="tbody"]').hide();      // 테이블
      $('#headProd > .prod-a').show().siblings().hide();             // 제품명
      $('#headTicker > .ticker-a').show().siblings().hide();         // 제품명 > 기준가 설명
      $('.scopi > .sc-a').show().siblings().hide();                  // 제품명 > scopi
      $('.scopi-info > .sc-info-AL').show().siblings().hide();        // scopi 설명

	  $('[metalGroup=AL]').show().siblings().not('#rCharts, #scopi-info').hide();
		metalCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyAL").find('input[name=metalCode]').val();
		itmSn = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyAL").find('input[name=itmSn]').val();
		dstrctLclsfCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyAL").find('input[name=dstrctLclsfCode]').val();
		brandGroupCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyAL").find('input[name=brandGroupCode]').val();
		brandCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyAL").find('input[name=brandCode]').val();
		sleMthdCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyAL").find('input[name=sleMthdCode]').val();

	 //사이드카일 경우 대체문구 노출
	  pageMetal = '7';
	  if(alRestdeStatus == 'Y'){
		$(".sidecar").addClass("show");
	  }else{
		$(".sidecar").removeClass("show");
	  }

	// 차트 상단 시간 변경
	  $("#dataType").show().children('li:first-child').addClass('on').siblings().removeClass('on');
	  $("#dataTypeZn").hide().children('li').removeClass('on');

	  type = "1minute";

	 if($("#chartHolder").is(":visible")){
		setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode); //차트 호출
	  }
    } else if ( $(this).hasClass('btn-ZN') ) {  // 아연 탭 선택 시
      buttonZn.addClass('active').siblings().removeClass('active');   // 버튼
      $('#tbodyZN').show().siblings('div[id^="tbody"]').hide();       // 테이블
      $('#headProd > .prod-z').show().siblings().hide();              // 제품명
      $('#headTicker > .ticker-z').show().siblings().hide();          // 제품명 > 기준가 설명
      $('.scopi > .sc-z').show().siblings().hide();                   // 제품명 > scopi
      $('.scopi-info > .sc-info-ZN').show().siblings().hide();         // scopi 설명

	  $('[metalGroup=ZN]').show().siblings().not('#rCharts').not('#scopi-info').hide();
		metalCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyZN").find('input[name=metalCode]').val();
		itmSn = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyZN").find('input[name=itmSn]').val();
		dstrctLclsfCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyZN").find('input[name=dstrctLclsfCode]').val();
		brandGroupCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyZN").find('input[name=brandGroupCode]').val();
		brandCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyZN").find('input[name=brandCode]').val();
		sleMthdCode = $(".chart-tab-area > button.active").parents().siblings(".table-list-area").children("#tbodyZN").find('input[name=sleMthdCode]').val();

	  //사이드카일 경우 대체문구 노출
	  pageMetal = '1';
	  if(znRestdeStatus == 'Y'){
		$(".sidecar").addClass("show");
	  }else{
		$(".sidecar").removeClass("show");
	  }

	  // 차트 상단 시간 변경
	  $("#dataType").hide().children('li').removeClass('on');
	  $("#dataTypeZn").show().children('li:first-child').addClass('on').siblings().removeClass('on');
	  type = "month";

	  if($("#chartHolder").is(":visible")){
		setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode); //차트 호출
	  }
    } else {
      return false;
    }
  });

  // 차트 내 부가세 제외보기 클릭 이벤트 (알루미늄)
  $(document).on('click','#buttonVatAL', function() {
    if ( $(this).hasClass('active') ) {
      $(this).removeClass('active');
	  $(this).text("부가세 별도");
	  $('[nonVatSarokPc=AL]').show();
	  $('[sarokPc=AL]').hide();
    } else {
      $(this).addClass('active');
	  $(this).text("부가세 포함");
	  $('[nonVatSarokPc=AL]').hide();
	  $('[sarokPc=AL]').show();
    }
  });

  // 차트 내 부가세 제외보기 클릭 이벤트 (아연)
  $(document).on('click','#buttonVatZN', function() {
    if ( $(this).hasClass('active') ) {
      $(this).removeClass('active');
	  $(this).text("부가세 별도");
	  $('[nonVatSarokPc=ZN]').show();
	  $('[sarokPc=ZN]').hide();
    } else {
      $(this).addClass('active');
	  $(this).text("부가세 포함");
	  $('[nonVatSarokPc=ZN]').hide();
	  $('[sarokPc=ZN]').show();
    }
  });
});


/* 롤링매뉴
if ($('.rChart-table').length > 0) {
    var intervalCharts = //function(){
    {
        init : function(){
            setInterval(function(){
                if ( $('.rChart-table .list > .li.active').index() == 6 ) {
                    $('.rChart-table .list > .li.active').removeClass('active');
                    $('.rChart-table .list > .li:first-of-type').addClass('active');
                }
                $('.rChart-table .list > .li.active').removeClass('active').next('.li').addClass('active');

                let activeLine = $('.rChart-table .list > .li.active')
                // console.log(  activeLine.index() )

                let clipProd = activeLine.children().find('.c-prod strong').text();
                let headProd = activeLine.parents('.charts-wrap').find('#headProd');
                let headTicker = activeLine.parents('.charts-wrap').find('#headTicker');
                let headDesc = activeLine.parents('.charts-wrap').find('#headDesc');
                let clipTicker;
                let clipDesc;
                let rCharts = activeLine.parents('.charts-wrap').find('#rCharts');
                switch (clipProd) {
                    case '알루미늄':
                        clipTicker = 'AL(P1020)';
                        clipDesc = '부산 보세창고 상차도 기준 (무관세, 서구산)';
//                        rCharts.text('알루미늄 차트를 그려주세요');
                    break;
                    case '아연':
                        clipTicker = 'ZN(P1020)';
                        clipDesc = '부산 보세창고 상차도 기준 (무관세, 서구산)2';
//                        rCharts.text('아연 차트를 그려주세요');
                    break;
                    case '구리':
                        clipTicker = 'CP(P1020)';
                        clipDesc = '부산 보세창고 상차도 기준 (무관세, 서구산)3';
//                        rCharts.text('구리 차트를 그려주세요');
                    break;
                    case '납':
                        clipTicker = 'LE(P1020)';
                        clipDesc = '부산 보세창고 상차도 기준 (무관세, 서구산)4';
//                        rCharts.text('납 차트를 그려주세요');
                    break;
                    case '니켈':
                        clipTicker = 'NK(P1020)';
                        clipDesc = '부산 보세창고 상차도 기준 (무관세, 서구산)5';
//                        rCharts.text('니켈 차트를 그려주세요');
                    break;
                    case '주석':
                        clipTicker = 'ST(P1020)';
                        clipDesc = '부산 보세창고 상차도 기준 (무관세, 서구산)6';
//                        rCharts.text('주석 차트를 그려주세요');
                    break;
                    default:
                    break;
                }
                headProd.text(clipProd);
                headTicker.text(clipTicker);
                headDesc.text(clipDesc);
            }, 5000);
        },
        stop : function(){
            clearInterval(intervalCharts);
        }
    }
    //};
    // setInterval(intervalCharts);
    //intervalCharts.init();

    function stopInterval(){
        // console.log('stop');
        // clearInterval(intervalCharts);
        intervalCharts.stop();
    }

    function playInterval(){
        intervalCharts.init();
    }

    // 제품별 가격 롤링 컨트롤러
    $('.controller-wrap .btn-controller.pause').on('click', function(){
        $(this).hide().siblings('.play').show();
        // stopInterval();
        intervalCharts.stop();
        console.log('pause')
    });
    $('.controller-wrap .btn-controller.play').on('click', function(){
        $(this).hide().siblings('.pause').show();
        // playInterval();
        intervalCharts.init();
        console.log('play')
    });

    //상단 차트
    var rollCharts = {
        init:   function(clipProd,clipTicker,clipDesc){
            $(document).on('click', '.rChart-table .li:not(.thead, .close)', function(){
                clearInterval(intervalCharts);// stop interval
                $(this).addClass('active').siblings().removeClass('active');
//                clipProd = $(this).children().find('.c-prod strong').text();
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
				clipTicker = $('.rChart-table .list > .li.active').find('input[name=clipTicker]').val();
				clipDesc = $('.rChart-table .list > .li.active').find('input[name=clipDesc]').val();

				let type;

                // let clipTicker;
                // let clipDesc;

                let rCharts = $(this).parents('.charts-wrap').find('#rCharts');
                switch (metalName) {
                    case 'Aluminium':
                        clipTicker = clipTicker;
                        clipDesc = clipDesc;
						type = "live";
						setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
                    break;
                    case 'Zinc':
                        clipTicker = clipTicker;
                        clipDesc = clipDesc;
						type = "live";
						setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
                    break;
                    case 'Copper':
                        clipTicker = clipTicker;
                        clipDesc = clipDesc;
						type = "live";
						setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
                    break;
                    case 'Lead':
                        clipTicker = clipTicker;
                        clipDesc = clipDesc;
						type = "live";
						setNewData(type,metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
                    break;
                    case 'Nickel':
                        clipTicker = clipTicker;
                        clipDesc = clipDesc;
						type = "live";
						setNewData(type,metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
                    break;
                    case 'Tin':
                        clipTicker = clipTicker;
                        clipDesc = clipDesc;
						type = "live";
						setNewData(type,metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
                    break;
                }
                headProd.text(clipProd);
                headTicker.text(clipTicker);
                headDesc.text(clipDesc);
            });
        },
    }
    rollCharts.init();
}
*/

$(document).on('click', '.rChart-table .li:not(.thead, .close)', function(){
	let activeLine = $('.rChart-table .list > .li.active')
                // console.log(  activeLine.index() )

    let clipProd = activeLine.children().find('.c-prod strong').text();
    let clipTicker;
    let clipDesc;
//    let rCharts = activeLine.parents('.charts-wrap').find('#rCharts');

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


	let type;

    let rCharts = $(this).parents('.charts-wrap').find('#rCharts');
    switch (metalName) {
        case 'Aluminium':
            clipTicker = clipTicker;
            clipDesc = clipDesc;
			type = "1minute";
			$("#dataType").show();
			$("#dataTypeZn").hide();
			setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
        break;
        case 'Zinc':
            clipTicker = clipTicker;
            clipDesc = clipDesc;
			type = "month";
			$("#dataType").hide();
			$("#dataTypeZn").show();
			setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
        break;
// 추후 판매금속 추가시 사용
//        case 'Copper':
//            clipTicker = clipTicker;
//            clipDesc = clipDesc;
//			type = "live";
//			setNewData(type, metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
//        break;
//        case 'Lead':
//            clipTicker = clipTicker;
//            clipDesc = clipDesc;
//			type = "live";
//			setNewData(type,metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
//        break;
//        case 'Nickel':
//            clipTicker = clipTicker;
//            clipDesc = clipDesc;
//			type = "live";
//			setNewData(type,metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
//        break;
//        case 'Tin':
//            clipTicker = clipTicker;
//            clipDesc = clipDesc;
//			type = "live";
//			setNewData(type,metalCode, itmSn, dstrctLclsfCode, brandGroupCode, brandCode);
        break;
    }
    headProd.text(clipProd);
    headTicker.text(clipTicker);
    headDesc.text(clipDesc);

});

//원자재 뉴스 클리핑 : 전체보기
/*
$(document).on('click', '.materials-news .btn-all', function(){
    alert('원자재 뉴스 클리핑 페이지로 이동');
});
//원자재 캘린더 : 전체보기
$(document).on('click', '.materials-cal .btn-all', function(){
    alert('원자재 캘린더 페이지로 이동');
});
*/
//원자재 캘린더 : 한달 + 오늘
$(document).on('click', '.cal-toggle button', function(){
    if ($(this).hasClass('active')){
        return;
    } else {
        $(this).addClass('active').siblings().removeClass('active');
    }
    if ($(this).hasClass('btn-cal-month')){
        $(this).parents('.cal-wrap').children('.cal-list').show().find('.li').show();
        $(this).parents('.cal-wrap').children('.cal-list').find('.li.today').hide();
        $(this).parents('.cal-wrap').children('.cal-holiday').hide();
        //$(this).parents('.cal-wrap').children('.cal-list').find('.li').show().removeAttr('style');
    }
    if ($(this).hasClass('btn-cal-today')){
        $(this).parents('.cal-wrap').children('.cal-list').show().find('.li.today').show();
        $(this).parents('.cal-wrap').children('.cal-list').find('.li:not(.today)').hide();
        $(this).parents('.cal-wrap').children('.cal-holiday').hide();
    }
    if ($(this).hasClass('btn-cal-holiday')){
      $(this).parents('.cal-wrap').children('.cal-holiday').show();
      $(this).parents('.cal-wrap').children('.cal-list').hide();
  }
});


// 메인 GRAB THE MOMENT Slider
var mainSwiperGrap = new Swiper(".grapWrapSwiper", {
    slidesPerView: 1,
    autoplay: {
        delay: 4000,
        disableOnInteration: true,
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
    on: {
        init: grapSwiperHover,
        slideChangeTransitionStart: grapSwiperBg,
    }
});


// 메인 GRAB THE MOMENT Slider:: 22.11.30 신규생성
var mainSwiperGrap = new Swiper(".grapWrapSwiper2", {
    slidesPerView: 1,
    effect: "fade",
    autoplay: {
        //delay: 4000,
       // disableOnInteration: true,
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
    on: {
        init: grapSwiperHover,
        slideChangeTransitionStart: grapSwiperBg,
    }
});


// 23.06.26 | 메인 슬라이드 신규 생성
var mainSwiperGrapNew = new Swiper(".main-swiper", {
    slidesPerView: 1,
    effect: "fade",
    autoplay: {
        //delay: 4000,
       // disableOnInteration: true,
    },
    loop: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        type : 'fraction'
    },
    on: {
        init: grapSwiperHover,
        slideChangeTransitionStart: grapSwiperBg,
    }
});

// 정지 버튼 클릭시 슬라이더 멈춤
$(".swiper-button-pause").on('click', function(){
	mainSwiperGrapNew.autoplay.stop();
	$('.player-btn').removeClass('on');
	$('.swiper-button-play').addClass('on');
});

// 재생 버튼 클릭시 슬라이더 재시작
$(".swiper-button-play").on('click', function(){
	mainSwiperGrapNew.autoplay.start();
	$('.player-btn').removeClass('on');
	$('.swiper-button-pause').addClass('on');
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
        grapWrap.attr('class','grap-wrap lme-on');
    } else if ($('.swiper-slide.swiper-slide-active').hasClass('pay')) {
        grapWrap.attr('class','grap-wrap pay-on');
    } else if ($('.swiper-slide.swiper-slide-active').hasClass('sinl')) {
        grapWrap.attr('class','grap-wrap sinl-on');
    } else {
        return false;
    }
};

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

/* 알림 생성 팝업 : 목표가 계산 */
/*$(document).on('click', '.target-price-set button', function(){
    $(this).addClass('btn-blue-md').removeClass('btn-stroke-md').siblings('button').addClass('btn-stroke-md').removeClass('btn-blue-md');
    let currentPrice = $('#currentPrice').text().replace(/[^\d]+/g, ""); // 숫자 외에 다른 문자는 모두 ""로 replace
    // let targetPrice = $(this).parents('.target-price-set').find('input').val().replace(/[^\d]+/g, "");
    let targetValue = Math.abs($(this).attr('data-value'));
    let newPrice = String(parseInt( currentPrice - (currentPrice * targetValue / 100) )).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$(this).parents('.target-price-set').find('input').val(newPrice);
	//$(this).parents('.target-price-set').find('input').attr('value', newPrice);
});*/


// 토스트 알림
/*
toastr.info('<span class="prod">알루미늄</span> <span class="prod-price">2,825,000</span>', '알림', {
    "allowHtml": true,
    "closeButton": true,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "slideDown",// fadeIn
    "hideMethod": "slideUp"// fadeOut
  //   ,"escapeHtml": false
  });
*/

  // 알림설정 팝업 : 희망가 알림 생성 내역, 원클릭 주문 알림
  $('#sorinModalAlarm .toggle').on('click', function(){
      if ($(this).attr('data-value') == 'oneclick-order') {
          $('#sorinModalAlarm .tbl-oneclick').addClass('active');
      } else {
          $('#sorinModalAlarm .tbl-oneclick').removeClass('active');
      }
  });