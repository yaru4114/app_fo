'use strict';

 /*** layout script: 신규 생성한 스크립트 하단에 추가 ***/
$(function () {
   
    /* 띠배너 > 닫기버튼 클릭시 >>> 23.01.04 | 고도화 3차: 띠매너 삭제로 주석처리
    $('.top-banner-wrap .banner-close').off('click').on('click', function(){
        $('.top-banner-wrap').hide();
        $('.wrapper').css('padding-top','19rem');
        $(".pop-main").css('top', '28rem');
        $('.gnb-depth2').css('top', '19rem');
    });
   */
   
   /* 23.01.04 | 고도화 3차: 현 서린몰(전 내수판매) > .gnb-depth2 좌측 간격 영역 제어
    let gnbDepth2LeftSpace = parseInt($('.header-btm .gnb > ul > li.has-depth').offset().left);
    let letterSpace = parseInt(gnbDepth2LeftSpace / 100);

    $('.gnb-depth2 > ul').css({'padding-left': gnbDepth2LeftSpace - letterSpace});
    
    //resize
    $(window).off('resize').on('resize',function(){
	    let gnbDepth2LeftSpace = parseInt($('.header-btm .gnb > ul > li.has-depth').offset().left);
	    let letterSpace = parseInt(gnbDepth2LeftSpace / 100);

	    $('.gnb-depth2 > ul').css({'padding-left': gnbDepth2LeftSpace - letterSpace});
	});
 */

    /* 우측 하단 top 이동 버튼 클릭시 */
    $('.main-side__top').off('click').on('click',function(){
        $('html, body').stop().animate({scrollTop: 0});
    });
   
   
    /* 22.12 header 신규 > 로그인 회원 클릭시 */
    $('.login-user-info').off('click').on('click', function(){
      $('.toggle-box.active').not(this).removeClass('active');
       $(this).toggleClass('active');

    });
       
       
   /* 22.12 header 신규 > 햄버거 메뉴 클릭시 */
    $('.login-btn').off('click').on('click', function(){
      $('.toggle-box.active').not(this).removeClass('active');
       $(this).toggleClass('active');
    });
    
    
   /* 22.12 header 신규 > toggle-box 이 외의 영역을 클릭 시 */
   $('html').off('click').on('click',function(e) {
   
       //header- 알람 버튼
       if (!$('.toggle-box').has(e.target).length) {
           $('.login-user-info, .login-btn').removeClass('active');
       }
   
   });
    
    
   /* 22.12 header 신규 >  회원상태 툴팁 */
   $('.btn-tooltip-close').off('click').on('click', function(){
      $('.member-state').fadeOut(300);
   });
     
     
   /* 22.12 header 신규 > 공지 슬라이드 */
   new Swiper('.header-notice', {
     direction: 'vertical', 
     autoplay: true, 
     loop: true,
     pagination: {
         el: ".swiper-pagination",
         type: "fraction",
       },
   });
  
  
   /* 23.07 페이지 공통 > 신규 전광판 */
   new Swiper('.display-board-inner', {
	 direction: 'vertical',
     autoplay: {
          delay: 5000, // 시간 설정
          disableOnInteraction: false, // false-스와이프 후 자동 재생
        }, 
		loop: true,
		navigation: {  
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
		observer: true,	
  		observeParents: true
   });

   
   /* 23.06.19 lnb > depth2 스타일 추가 */
    $('.lnb-wrap li.has-depth a').off('click').on('click', function(){
		$(this).toggleClass('on');
		$(this).next('.lnb-depth2').slideToggle();
	});
	
   	$('.lnb-wrap > ul > li.has-depth .lnb-depth2 > li').off('click').on('click', function(e){
		e.preventDefault()
		$('.lnb-wrap > ul > li.has-depth .lnb-depth2 > li').removeClass('active')
		$(this).addClass('active');
	});



});
