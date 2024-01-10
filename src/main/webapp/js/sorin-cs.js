'use strict';
/********* Community */

/* FAQ */
if ($('.faq-list').length > 0) {
    $('.faq-list .toggle').off('click').on('click', function(){
        $(this).parent('.f').addClass('active').siblings('.f').removeClass('active');

    });
}

/* 뉴스레터 */
if ($('.tbl-newsletter').length > 0) {
    $('.tbl-newsletter tr').off('mouseover focusin').on('mouseover focusin', function(){
        $(this).addClass('hover');
    });
    $('.tbl-newsletter tr').off('mouseleave focusout').on('mouseleave focusout', function(){
        $(this).removeClass('hover').removeAttr('class');
    });
}
/* 뉴스 클리핑 */
if ($('.tbl-newsclip').length > 0) {
    $('.tbl-newsclip tr').off('mouseover focusin').on('mouseover focusin', function(){
        $(this).addClass('hover');
    });
    $('.tbl-newsclip tr').off('mouseleave focusout').on('mouseleave focusout', function(){
        $(this).removeClass('hover').removeAttr('class');
    });
}
/* 원자재 캘린더 */
if ($('.fullcal-wrap').length > 0) {
    document.addEventListener('DOMContentLoaded', function() {

        // 캘린더 영역 비우기
        // $('#calendar').empty)();
        // 월간 스케줄
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        //   plugins: [ 'interaction', 'dayGrid'], // 캘린더 view 타입
          expandRows: true,
          slotMinTime: '08:00',
          slotMaxTime: '20:00',
          headerToolbar: { // 캘린더 상단 타이틀 표시 
            left: '',
            center: 'prev,title,next',
            right: 'today,dayGridMonth,listMonth,listDay'
            //right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
          },
          height: '100%',
          showNonCurrentDates: false, // 이전달 일자 다음자 일자 미리보기
          initialView: 'dayGridMonth',
          //defaultView: 'dayGridWeek',
          initialDate: defaultDate, // '2021-07-07',
          //defaultDate: defaultDate,
          navLinks: true, // can click day/week names to navigate views
          editable: false, // 이벤트 수정 가능 여부
          //eventLimit: false, // 이벤트 5개 이상 more+ 표시, 숫자 기입시 지정 숫자 이상
          eventOrder: 'ord', // 이벤트 정렬 기준값 (역정렬시 -ord)
          selectable: true,
          nowIndicator: true,
          dayMaxEvents: true, // allow "more" link when too many events
          locale: 'ko',
          buttonText: {
            today: '오늘',
            // day: '',
            // week: '',
            // month: '',
            dayGridMonth: '달력보기',
            listMonth: '월 목록',
            listDay: '일 목록',
          },
          fixedWeekCount: false, //일수에 맞춰 주간 표시, 디폴트는 6주
              /*
          // 캘린더 이벤트 로드시 발생 이벤트
          eventRender: function(event, element){
              console.log('event', event);
          },
          // 캘린더 day 로드시 발생 이벤트
          datesRender: function(info){
            console.log('info.view', info.view);
          },
          // 캘린더 내부 day 클릭시 발생 이벤트 
          dateClick: function(info){
            alert('clicked on: ', + info.dateStr);
          },
          // 캘린더 내부 이벤트 클릭시 발생 이벤트 
          eventClick: function(info){            
            console.log('click.info', info);
          },
          // 캘린더 내부 이벤트 마우스오버시 발생 이벤트 
          eventMouseEnter: function(info){
            console.log('hover:info', info);
          },
          */
          // 회의 행사 기념일 국경일 공휴일 
          events: [
            {
              title: 'Nikkei 한국 제조업 구매 관리자지수 (3월)',
              start: '2021-07-01',
              className: 'bg-meeting',
            },
            {
              title: '광저우 종합 무역 박람회',
              start: '2021-07-05',
              end: '2021-07-07',
              className: 'bg-event',
            },
            {
              title: '미국 4월 FOMC 기념',
              start: '2021-07-05',
              className: 'bg-meeting',
            },
            {
              title: '미국 4월 FOMC 기념',
              start: '2021-07-05',
              className: 'bg-anniverary',
            },
            {
              title: '미국 4월 FOMC 기념',
              start: '2021-07-05',
              className: 'bg-meeting',
            },
            {
              title: '미국 4월 FOMC 기념',
              start: '2021-07-05',
              className: 'bg-meeting',
            },
            {
              title: '대한민국 임시정부 수립 기념일',
              start: '2021-07-11',
              className: 'bg-holiday',
            },
            {
              title: '한국 생산자물가지수 (MoM) (4월)',
              start: '2021-07-12',
              className: 'bg-meeting',
            },
            {
              title: '서린상사 사무실 리모델링으로 인한 공휴일',
              start: '2021-07-20',
              className: 'bg-co-holiday',
            },
            {
              title: '한국 서비스부문 산출 (MoM) (3월)',
              start: '2021-07-30',
              className: 'bg-meeting',
            }
          ],
        });
    
        // 오늘 날짜 
        var defaultDate = function(){
            var date = new Date();
            return date.getFullYear() + '-' + ('0'+(date.getMonth()+1)).slice(-2) + '-' + ('0'+date.getDate()).slice(-2);
        };

        calendar.render();
    
        var defaultHeight = $('.fc-daygrid.fc-view').height();

        $('.fc-next-button, .fc-prev-button, .fc-dayGridMonth-button, .fc-today-button').off('click').on('click', function(){
          replaceDay();
          // $('.fullcal-wrap').css('height', defaultHeight + 90).css('height', defaultHeight + 90);
        });

        $('.fc-dayGridMonth-button').off('click').on('click', function(){
          // $('.fullcal-wrap').css('height', defaultHeight + 90).css('height', defaultHeight + 90);
          // $('.fullcal-wrap').removeAttr('style');
        });


        $('.fc-listMonth-button, .fc-listDay-button').off('click').on('click', function(){
          // $('.fullcal-wrap').css('height', $('.fc .fc-list.fc-view').height() + 90);
        });

        function replaceDay() {
          $('.fc-daygrid-day-number').each(function(){
              let dayNumber = $(this).text();
              dayNumber = dayNumber.split("일");
              $(this).text(dayNumber[0]);
          });
        }
        replaceDay();
    
    });
    
}
