<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header :: START -->
<header id="header" class="inwrap">
	<!-- logo :: START -->
    <h1 class="logo">
    	<a href="/fo/bid">
    		<span class="hidden">SORIN CORPORATION</span>
    		<span class="mark">구매입찰 시스템</span>
   		</a>
 	</h1>
 	<!-- logo :: END -->
 	<!-- 로그인시 -->
    <div id="header_loginY" class="util utility bid" style="display:none;">
        <div class="util-list">
            <ul>
                <li><a href="javascript:;">${loginUser.userNm}님</a></li>
                <li><a href="javascript:;" onclick="moveToMypage()">마이페이지</a></li>
                <li><a class="fc-lgray" href="/fo/member/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>

    <div id="header_loginN" class="util utility bid" style="display:none;">
        <div class="util-list">
            <ul>
                <li><a class="fc-lgray" href="/fo/bid">로그인</a></li>
                <li><a href="/fo/member/create_1">회원가입</a></li>
            </ul>
        </div>
    </div>

</header>
<script>
    // 로그인 세션 헤더에 등록
    var header_loginYn = "${loginYn}";
    var header_loginUserStat = "${loginUserStat}"

    // 로그인 / 비로그인 메뉴
	if (header_loginYn == 'N'){
		document.getElementById("header_loginY").style.display = "none";
		document.getElementById("header_loginN").style.display = "block";
	} else {
		document.getElementById("header_loginY").style.display = "block";
		document.getElementById("header_loginN").style.display = "none";
	}

	if (header_loginUserStat === '02') {
        alert("투찰 3회 이상 취소로 차단되었습니다.")
        location.href = "/fo/logout";
	}

	function header_toMyPage(){
        //
	}
	
	function moveToMypage(){
		location.href="/fo/mypage?bidEntrpsNo="+bidEntrpsNo
	}
</script>
<!-- header :: END -->