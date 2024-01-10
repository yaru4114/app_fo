'use strict';
/********* My Page */

// 내정보관리 버튼
$('.btn-myinfo').off('click').on('click', function(){
    document.location.href="/fo/simplMyPage/selectSimplMberMyInfoMng"
});
// 결제수단-잔고- 리로드 버튼
$('.btn-reload').off('click').on('click', function(){
//    alert('새로고침');
});
// 인출하기 버튼
$('.btn-withdrawal').off('click').on('click', function(){
//    alert('인출하기');
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