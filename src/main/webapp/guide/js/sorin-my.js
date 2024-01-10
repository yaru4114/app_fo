'use strict';
/********* My Page */

// 내정보관리 버튼
$('.btn-myinfo').on('click', function(){
    document.location.href="/fo/simplMyPage/selectSimplMberMyInfoMng"
});
// 결제수단-잔고- 리로드 버튼
$('.btn-reload').on('click', function(){
    alert('새로고침');
});
// 인출하기 버튼
$('.btn-withdrawal').on('click', function(){
    alert('인출하기');
});

/*
// 마이페이지 대시보드 상단 결제수단 슬라이더
var mySwiperPay = new Swiper(".payWrapSwiper", {
    slidesPerView: 3,
    // spaceBetween: 30,
    // autoplay: {
    //     delay: 5000,
    //     disableOnInteration: false,
    // },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    // pagination: {
    //     el: ".swiper-pagination",
    //     clickable: true,
    // },
});
*/

$(function() {
	// 마이페이지 > LNB > 간편회원 display func.
	let isNormalMember_LNB = $('title').text().includes('간편회원');
	if(isNormalMember_LNB) {
		$('.lnb-wrap li').css('display', 'none');
		$('.lnb-wrap li:nth-of-type(1), .lnb-wrap li:nth-of-type(4), .lnb-wrap li:nth-of-type(10)').css('display', 'block');
		$('.lnb-wrap li a').css('border-bottom', '1px solid #dedede');	
	}
	
	// 마이페이지 > LNB active status control func.
	let menuLength = $('.lnb-wrap li').length;
	let titleTxt = $('title').text();
	for( let i = 1; i < menuLength + 1; i++ ) {
		let menuTit = $(`.lnb-wrap li:nth-of-type(${i}) a`).text();
		if(titleTxt.includes(menuTit)) {
			$(`.lnb-wrap li:nth-of-type(${i}) a`).addClass('active');
		}
	}

	// 마이페이지 > 대시보드 > 간편회원 display func.
	let isNormalMember = $('title').text().includes('간편회원');
	if(isNormalMember) {
		$('.normal-member-wrap, .normal-member-wrap > .inwrap').removeClass('hide');
		$('.my-dashboard-head > .head-box > .inwrap').addClass('hide');
	}
});


