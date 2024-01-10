// "사이드 메뉴 리스트"
sorin.ajax.getSetAllType("/bo/Menu/getSideBarMenu/",'','','',true, function(data){
	if (data.menuList == "") {
		alert("권한이 없습니다.");
	} else {
		var arr1 = new Array();
		var arr2 = new Array();
		var arr3 = new Array();

		for(var i=0; i<data.menuList.length; i++){

			if(data.menuList[i].menuLevel == "1"){ //menuLevel1
				arr1.push(data.menuList[i]);
			}

			if(data.menuList[i].menuLevel == "2"){ //menuLevel2
				arr2.push(data.menuList[i]);
			}

			if(data.menuList[i].menuLevel == "3"){ //menuLevel3
				arr3.push(data.menuList[i]);
			}
		}


		for(var i of arr1){ // menuLevel1 li 생성
			$('.sidebar-menu').append(
				'<li class="has-submenu" id="sidebar_'+i.menuNo+'">'
				+'<a class="sidebar-1depth" aria-label="">'+i.menuNm+'</a>'
				+'</li>'
			);
		}

		for(var j of arr2){ // menuLevel2 div 생성

				$("#sidebar_"+j.upperMenuNo+"").append(
					'<div class="sidebar-2depth has-submenu" id="sidebar_'+j.menuNo+'">'
					+'<a class="has-submenu">'+j.menuNm+'</a>'
					+'<ul class="sidebar-3depth"></ul>'
					+'</div>'
				);
		}

		for(var k of arr3){ // menuLevel3 li 생성
			$("#sidebar_"+k.upperMenuNo+" .sidebar-3depth").append(
				'<li id="sidebar_' + k.menuNo + '" value='+k.menuUrl+'>'+k.menuNm+'</li>'
			);
	   	}
	}
});

/* 탭 이벤트 */
var dynamicMenuWidth = function(){
    let array = $('.header-tab');
    let sumElement = 0;
    for (let i = 0; i < array.length; i++) {
        sumElement += array[i].getBoundingClientRect().width;
    }
    $('.header-tab-set .scroll-x').css({
        'width': (sumElement) +'px'
    });
};

$(window).on('resize', function(){
    dynamicMenuWidth();
})

$(document).on('click', '#closeAll', function() {
    var length = $('.header-tab').length;
    for(var i=0; i<length; i++) {
        $('.header-tab')[0].remove();
        $('.web-content')[0].remove();
    }
    $($(".web-content")[0]).show();
    $($('.header-tab')[0]).addClass('is-active');
    dynamicMenuWidth();
})


// 사이드바 클릭
$(document).on("click",".sidebar-3depth li",function(){
    $(".sidebar-3depth li").removeClass("active"); // 3depth 모두 활성화 초기화 20220112 추가
    $(this).addClass("active"); // 선택한 3depth 활성화 20220112 추가
    
    selectSidebar($(this).attr('value'), $(this).text(), $(this).attr('id').split("_")[1]);
});

// 사이드바 선택
function selectSidebar(uri, html, id) {
    var pages = $(".link-to-page");
    for(var item of pages) {
        if($(item).html() == html) {
            $(".header-tab").removeClass('is-active');
            $(item).parent().addClass('is-active'); // 탭변경
            changePage(html); // 페이지변경
            scrollPosition();
            return;
        }
    }
    $(".header-tab").removeClass('is-active');
    addPage(uri, html, id); // 페이지추가
    $('.scroll-x').css('width', '9999px')
    $(".scroll-x").append('<span class="header-tab is-active"><a href="javascript:;" class="link-to-page">' + html + '</a><button class="icon icon-tab-close"</button><span>'); // 탭추가
    dynamicMenuWidth();
    $('.header-tab-set').scrollLeft(9999);
}

// 페이지 추가
function addPage(uri, html, id) {
    $(".web-content").hide();
    $(".web-tabs").append("<div class='web-content' value='" + html + "'><iframe src='" + uri + "' frameborder='0' class='ifr' id='iframe" + id + "'></iframe></div>");
}

// 페이지 변경
function changePage(html) {
    $(".web-content").hide();
    var content = $(".web-content");
    for(var item of content) {
        if($(item).attr('value') == html) {
            $(item).show();
            break;
        }
    }
}

// 페이지 삭제
function deletePage(html, isActive) {
    var content = $(".web-content");
    for(var item of content) {
        if($(item).attr('value') == html) {

			//닫는 page의 removeStompSubscriber를 불러온다. 필수요소 -> 삭제하지 않는다.
			let removeIframe = document.getElementById($(item).find("iframe").attr("id"));

			if(!sorin.validation.isEmpty(removeIframe)){
				let frameContent = removeIframe.contentWindow || removeIframe.contentDocument;

				if(typeof frameContent.removeStompSubscriber != "undefined"){
					frameContent.removeStompSubscriber();
				}
			}

            if(isActive){
                $(item).prev().length == 0 ? $(item).next().show() : $(item).prev().show();
            }

            $(item).remove();
            dynamicMenuWidth();
            return;
        }
    }
}

// 탭 닫기 (x 클릭)
$(document).on('click', ".icon-tab-close", function() {
    if($(this).parent().hasClass('is-active')) {
        if($(this).parent().prev().length == 0) {
            $(this).parent().next().addClass('is-active')
        }
        else {
            $(this).parent().prev().addClass('is-active')
        }
        $(this).parent().remove();
        deletePage($(this).prev().html(), true);
    }
    else {
        $(this).parent().remove();
        deletePage($(this).prev().html(), false);
    }
    dynamicMenuWidth();
    scrollPosition();
})

// 탭 닫기 (더블 클릭)
$(document).on('dblclick','.header-tab', function() {
    if($(this).hasClass('is-active')) {
        if($(this).prev().length == 0) {
            $(this).next().addClass('is-active')
        }
        else {
            $(this).prev().addClass('is-active')
        }
        deletePage($(this)[0].innerText, true);
        $(this).remove();
    }
    else {
        deletePage($(this)[0].innerText, false);
        $(this).remove();
    }
    dynamicMenuWidth();
    scrollPosition();
})

// 탭 이동
$(document).on('click', ".link-to-page", function() {
    $(".link-to-page").parent().removeClass('is-active');
    $(this).parent().addClass('is-active');
    changePage($(this).html());
    scrollPosition();
})

// 오른쪽 버튼
function toRight() {
    var tabs = $('.header-tab');
    var scrollTarget = 0; // 목표 스크롤위치
    var scrollPos = $('.header-tab-set').scrollLeft(); // 현재 스크롤 위치
    for(var i=0; i<tabs.length; i++) {
        if(scrollTarget-1 > scrollPos) {
            break;
        } else {
            scrollTarget += tabs[i].getBoundingClientRect().width
        }
    }
    $('.header-tab-set').scrollLeft(scrollTarget);
}

// 왼쪽버튼
function toLeft() {
    var tabs = $('.header-tab');
    var scrollTarget = 0;
    var scrollPos = $('.header-tab-set').scrollLeft();
    for(var i=0; i<tabs.length; i++) {
        if(scrollTarget >= scrollPos) {
            if(i!=0) scrollTarget -= tabs[i-1].getBoundingClientRect().width;
            break;
        } else {
            scrollTarget += tabs[i].getBoundingClientRect().width;
        }
    }
    $('.header-tab-set').scrollLeft(scrollTarget);
}

// 스크롤 위치조정
function scrollPosition() {
    var scrollTarget = 0;
    var tabs = $('.header-tab');
    for(var item of tabs) {
        if($(item).hasClass('is-active')) {
            break;
        }
        scrollTarget += item.getBoundingClientRect().width;
    }

    var leftEnd = $('.header-tab-set').scrollLeft();
    var rightEnd = $('.header-tab-set').scrollLeft() + $('.header-tab-set').width();
    if(scrollTarget < leftEnd) { // 탭이 현재시야의 좌측 외부에
        $('.header-tab-set').scrollLeft(scrollTarget);
    }

	//null 버그 수정
	if(!sorin.validation.isEmpty($('.header-tab.is-active')[0])) {
	    if(scrollTarget + $('.header-tab.is-active')[0].getBoundingClientRect().width > rightEnd) { // 탭이 현재시야의 우측 외부에
	        $('.header-tab-set').scrollLeft(scrollTarget - $('.header-tab-set')[0].getBoundingClientRect().width + $('.header-tab.is-active')[0].getBoundingClientRect().width);
	    }
	}
}

$(document).on('click', '.tab-next', function() {
    toRight();
})
$(document).on('click', '.tab-prev', function() {
    toLeft();
})


var tabChangeData = null;

/**
 * <pre>
 * 함수명 : setDataMenuNo</br>
 * 설  명 : 다른 화면으로 이동하며 데이터 전송</br>
 * 사용법 : setDataMenuNo(menuNo, data)</br>
 * 작성일 : 2021. 8. 10.</br>
 * 작성자 : srec0041</br>
 * -------------------------------------</br>
 * 2021. 8. 10. srec0041 - 생성
 * </pre>
 *
 * @param - menuNo 이동할 메뉴번호
 * @param - data 데이터
 */
function setDataMenuNo(menuNo, data) {
    var sideBars = $("body", parent.document).contents().find(".sidebar-3depth li");
    var html;
    var uri;
    var id;
    for(var item of sideBars) {
        if(item.getAttribute('id').split("_")[1] == menuNo) {
            html = $(item).html();
            uri = $(item).attr('value');
            id = $(item).attr('id').split("_")[1];
            break;
        }
    }
    tabChangeData = data;
    var pages = $(".link-to-page");
    for(var item of pages) { // 이미 켜진 탭인지 확인
        if($(item).html() == html) {
            $(".header-tab").removeClass('is-active');
            $(item).parent().addClass('is-active'); // 탭변경
            changePage(html); // 페이지변경
            $("#iframe"+id)[0].contentWindow.doGetTabChangeData();
            return;
        }
    }

    $(".header-tab").removeClass('is-active');
    $(".scroll-x").append('<span class="header-tab is-active"><a href="javascript:;" class="link-to-page">' + html + '</a><button class="icon icon-tab-close"</button><span>'); // 탭추가
    $(".web-content").hide();
    $(".web-tabs").append("<div class='web-content' value='" + html + "'><iframe src='" + uri + "' frameborder='0' class='ifr' id='iframe" + id + "'></iframe></div>");
}

function setDataMenuNo2(menuNo, data, isTabDel) {

    var sideBars = $("body", parent.document).contents().find(".sidebar-3depth li");
    var html;
    var uri;
    var id;
    for(var item of sideBars) {
        if(item.getAttribute('id').split("_")[1] == menuNo) {
            html = $(item).html();
            uri = $(item).attr('value');
            id = $(item).attr('id').split("_")[1];
            break;
        }
    }
    tabChangeData = data;
    var pages = $(".link-to-page");
    var obj = null;

    for(var item of pages) { // 이미 켜진 탭인지 확인
        if($(item).html() == html) {
            if(isTabDel) {
                obj = $(item);

                deletePage(html, false);
                $(item).parent().remove();

                $(".header-tab").removeClass('is-active');
                $(".scroll-x").append('<span class="header-tab is-active"><a href="javascript:;" class="link-to-page">' + html + '</a><button class="icon icon-tab-close"</button><span>'); // 탭추가
                $(".web-content").hide();
                $(".web-tabs").append("<div class='web-content' value='" + html + "'><iframe src='" + uri + "' frameborder='0' class='ifr' id='iframe" + id + "'></iframe></div>");

                setTimeout(function() {
                    obj.parent().addClass('is-active');
                }, 100);
                return;
            } else {
                $(".header-tab").removeClass('is-active');
                $(item).parent().addClass('is-active'); // 탭변경
                changePage(html); // 페이지변경
                $("#iframe"+id)[0].contentWindow.doGetTabChangeData();
                return;
            }
        }
    }

    $(".header-tab").removeClass('is-active');
    $(".scroll-x").append('<span class="header-tab is-active"><a href="javascript:;" class="link-to-page">' + html + '</a><button class="icon icon-tab-close"</button><span>'); // 탭추가
    $(".web-content").hide();
    $(".web-tabs").append("<div class='web-content' value='" + html + "'><iframe src='" + uri + "' frameborder='0' class='ifr' id='iframe" + id + "'></iframe></div>");

}

/**
 * <pre>
 * 함수명 : setDataURL</br>
 * 설  명 : 다른 화면으로 이동하며 데이터 전송</br>
 * 사용법 : setDataURL(url, data)</br>
 * 작성일 : 2021. 8. 10.</br>
 * 작성자 : srec0041</br>
 * -------------------------------------</br>
 * 2021. 8. 10. srec0041 - 생성
 * </pre>
 *
 * @param - url 이동할 url
 * @param - data 데이터
 */
function setDataURL(url, data) {
    var sideBars = $("body", parent.document).contents().find(".sidebar-3depth li");
    var html;
    var id;
    for(var item of sideBars) {
        if($(item).attr('value') == url) {
            html = $(item).html();
            id = $(item).attr('id').split("_")[1];
            break;
        }
    }
    tabChangeData = data;
    var pages = $(".link-to-page");
    for(var item of pages) {
        if($(item).html() == html) {
            $(".header-tab").removeClass('is-active');
            $(item).parent().addClass('is-active'); // 탭변경
            changePage(html); // 페이지변경
            tabChangeData = data;
            $("#iframe"+id)[0].contentWindow.doGetTabChangeData();
            return;
        }
    }

    $(".header-tab").removeClass('is-active');
    $(".scroll-x").append('<span class="header-tab is-active"><a href="javascript:;" class="link-to-page">' + html + '</a><button class="icon icon-tab-close"</button><span>'); // 탭추가
    $(".web-content").hide();
    $(".web-tabs").append("<div class='web-content' value='" + html + "'><iframe src='" + url + "' frameborder='0' class='ifr' id='iframe" + id + "'></iframe></div>");
}

function getData() {
    return tabChangeData;
}
function cleanData() {
    tabChangeData = null;
}

function doGetTabChangeData(){}

