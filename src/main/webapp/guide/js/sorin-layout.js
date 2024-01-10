'use strict';

 /*** layout script: 신규 생성한 스크립트 하단에 추가 ***/
$(function () {
   
    /* 띠배너 > 닫기버튼 클릭시 >>> 23.01.04 | 고도화 3차: 띠매너 삭제로 주석처리
    $('.top-banner-wrap .banner-close').on('click', function(){
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
    $(window).on('resize',function(){
	    let gnbDepth2LeftSpace = parseInt($('.header-btm .gnb > ul > li.has-depth').offset().left);
	    let letterSpace = parseInt(gnbDepth2LeftSpace / 100);

	    $('.gnb-depth2 > ul').css({'padding-left': gnbDepth2LeftSpace - letterSpace});
	});
	*/

    /* 우측 하단 top 이동 버튼 클릭시 */
    $('.main-side__top').on('click',function(){
        $('html, body').stop().animate({scrollTop: 0});
    });
   
   
    /* 22.12 header 신규 > 로그인 회원 클릭시 */
    $('.login-user-info').on('click', function(){
      $('.toggle-box.active').not(this).removeClass('active');
       $(this).toggleClass('active');

    });
       
       
   /* 22.12 header 신규 > 햄버거 메뉴 클릭시 */
    $('.login-btn').on('click', function(){
      $('.toggle-box.active').not(this).removeClass('active');
       $(this).toggleClass('active');
    });
    
    
   /* 22.12 header 신규 > toggle-box 이 외의 영역을 클릭 시 */
   $('html').on('click',function(e) {
   
       //header- 알람 버튼
       if (!$('.toggle-box').has(e.target).length) {
           $('.login-user-info, .login-btn').removeClass('active');
       }
   
   });
    
    
   /* 22.12 header 신규 >  회원상태 툴팁 */
   $('.btn-tooltip-close').on('click', function(){
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
       }
   });
  
  
   /* 23.07 페이지 공통 > 신규 전광판 */
   new Swiper('.display-board-inner', {
	 direction: 'vertical',
     autoplay: {
          delay: 4500, // 시간 설정
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
    $('.lnb-wrap li.has-depth a').on('click', function(){
		$(this).toggleClass('on');
		$(this).next('.lnb-depth2').slideToggle();
	});
	
   	$('.lnb-wrap > ul > li.has-depth .lnb-depth2 > li').on('click', function(e){
		e.preventDefault()
		$('.lnb-wrap > ul > li.has-depth .lnb-depth2 > li').removeClass('active')
		$(this).addClass('active');
	});



	/* 23.10.23 | 메인 팝업(.pop-main-layer) 신규 */
	$('.btn-pop-close').each(function() {
		$(this).on('click', function() {
			$(this).parents('.pop-main-layer').hide();
		});
	});
	


	/* 23.10.23 | 카카오톡 채널 배너(.banner-kakao-ch) */
	$('.btn-banner-close').on('click', function() {
		$(this).parents('.banner-kakao-ch').hide();
	});



	/* 23.10.24 | 다크모드 on/off 스위치(.header-top > .mode-switch) */
	// 1. 오후 5시 이후 darkMode 자동 전환(#darkMode일 경우만 .mode-switch 보임)
	if (!$('#darkMode').length > 0) {
	    $('.mode-switch').hide();
	} else {
	    $('.mode-switch').show();
	}
	
	// 2. .mode-switch on/off 제어
	$("#modeSwitch").change(function(){
		
	    // 다크모드시: 협력사 소개 > src변경 및 마지막 로고(b2b more) 숨김처리
	    let alliance = $('.alliances li');
	    let alliancesNum = $('.alliances li').length;

        if(!$("#modeSwitch").is(":checked")){  // 라이트모드일 경우
        	$('.body-main').removeAttr('id', 'darkMode');
       	
		    for (let i = 0; i < alliancesNum; i++) {
			    let alliancesImgSrc = alliance.eq(i).find('img').attr('src');
				alliancesImgSrc = `/guide/images/ma/main-alliance${i+1}.png`;
				alliance.eq(i).find('img').attr('src',alliancesImgSrc);
			
				$('.alliance9').show();
			}
			
        } else {  // 다크모드일 경우
            $('.body-main').attr('id', 'darkMode');
            
            for (let i = 0; i < alliancesNum; i++) {
			    let alliancesImgSrc = alliance.eq(i).find('img').attr('src');			    
				alliancesImgSrc = `/guide/images/ma/dark-alliance${i+1}.png`;
				alliance.eq(i).find('img').attr('src',alliancesImgSrc);
				
				$('.alliance9').hide();
			}
        }
    });
    



});
