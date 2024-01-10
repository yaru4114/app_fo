

/* =====================================
* full calendar ITB-007, ITB-008 화면용
* =====================================
*/

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		// initialView: 'dayGridMonth',
        initialDate: '2021-02-12',
        locale: 'ko',
        // day: '2-digit',
        day: '',

        // day: 'numeric',
        // weekday: 'numeric',
        
        // headerToolbar: {
        //     left: '',
        //     center: 'title',
        //     right: 'prev,next today'
        // },
        // height: 650,
        // editable: true,
        // dayMaxEventRows:true,

        // eventDidMount: function(info) {
        //     tippy(info.el, {
        //         content:  info.event.extendedProps.description,//이벤트 디스크립션을 툴팁으로 가져옵니다. 
        //     });
        // },
        // columnFormat: {
        //     day: 'M월d일 dddd'
        // },
        meridiem: 'short',
        slotLabelFormat: [
            // { month: 'long', year: 'numeric' }, // top level of text
            { weekday: 'short' } // lower level of text
          ],
        events: [
            {
            title: '휴일',
            // description: '설명',
            start: '2021-02-01',
            end: '2021-02-04',
            color: '#f85e38',
            // textColor: '#fff'
            },
            {
            title: '휴일아님',
            // description: '설명',
            start: '2021-02-08',
            end: '2021-02-10',
            color: '#1e60d1'
            },
        ],
		// dayHeaderContent: function (date) { // 한글로 표시
		// 	let weekList = ["일", "월", "화", "수", "목", "금", "토"];
		// 	return weekList[date.dow];
		// }
	});
	calendar.render();
});


// [06-03 오후 4:14] 우승아[E커머스]
    

// 휴일
// 글씨 : #fff
// 배경 : #f85e38


// 휴일이 아닐 경우 
// 글씨 : #fff
// 배경 : #1e60d1



// ​[06-03 오후 4:14] 우승아[E커머스]
//     헙 다 복사가 되었네영 ㅋㅋ
// ​[06-03 오후 4:14] 우승아[E커머스]
//     주황색 : 포인트 색상 
// 파란색 : 주황의 보색
