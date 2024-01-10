/* ============================================
*  카카오 우편번호 팝업 표시(도로명주소/지번주소 모두 표시)
*  ============================================
*/
function openPostcodeJibun() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;

			//2021-09-15 추가 기존에 없었던 내용이라 null check 추가
			if (null!=document.getElementById("bcode")){
				document.getElementById("bcode").value = data.bcode;
            }
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }
        },
        hideMapBtn : true,
        useBannerLink : false
    }).open();
}

/* ============================================
*  카카오 우편번호 팝업 표시(도로명주소/지번주소 중 하나만 표시)
*  ============================================
*/
function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        },
        hideMapBtn : true,
        useBannerLink : false
    }).open();
}

// 카카오 우편번호 레이어 팝업을 위한 element   
var element_layer;

/* ============================================
*  카카오 우편번호 레이어 팝업을 화면의 가운데로 이동시킨다.
*  ============================================
*/
function initLayerPosition(){
    var width = 400; //우편번호서비스가 들어갈 element의 width
    var height = 400; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

/* ============================================
*  카카오 우편번호 레이어 팝업을 숨긴다.
*  ============================================
*/
function closePostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

/* ============================================
*  카카오 우편번호 레이어 팝업 표시(도로명주소/지번주소 모두 표시)
*  ============================================
*/
function openPostcodeLayerJibun() {
	element_layer = document.getElementById('layerPostcode');
	
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;

            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // iframe을 넣은 element를 안보이게 한다.
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5,
        hideMapBtn : true,
        useBannerLink : false
    }).embed(element_layer);

    // iframe을 넣은 element를 보이게 한다.
    element_layer.style.display = 'block';

    // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

/* ============================================
*  카카오 우편번호 레이어 팝업 표시(도로명주소/지번주소 중 하나만 표시)
*  ============================================
*/
function openPostcodeLayer() {
	element_layer = document.getElementById('layerPostcode');
	
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();

            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5,
        hideMapBtn : true,
        useBannerLink : false
    }).embed(element_layer);

    element_layer.style.display = 'block';

    initLayerPosition();
}

/* ============================================
*  쿠기 생성(만기시간 지정)
*  ============================================
*/
function setCookie(name, value, expires) {
	name = name.replaceAll("\r", "").replaceAll("\n", "");
	value = value.replaceAll("\r", "").replaceAll("\n", "");
	document.cookie = name + "=" + escape(value) + "; domain=" + document.domain + "; path=/; expires=" + expires.toGMTString();
}

/* ============================================
*  쿠기 생성(만기시간 미지정)
*  ============================================
*/
function setCookie(name, value) {
	name = name.replaceAll("\r", "").replaceAll("\n", "");
	value = value.replaceAll("\r", "").replaceAll("\n", "");
	document.cookie = name + "=" + escape(value) + "; domain=" + document.domain + "; path=/; expires=";
}

/* ============================================
*  쿠기값 가져오기
*  ============================================
*/
function getCookie(Name) {
	var search = Name + "=";
	if ( document.cookie.length > 0 ) {
		offset = document.cookie.indexOf(search);
		if ( offset != -1 ) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if ( end == -1 ) end = document.cookie.length;
			
			return unescape(document.cookie.substring(offset, end));
		}
	}
	
	return "";
}

/* ============================================
*  화면을 PDF로 저장
*  ============================================
*/
function pdfPrint(filename) {
	// 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
	html2canvas(document.getElementById("content_pdf"), {
		onrendered: function (canvas) {
			// 캔버스를 이미지로 변환
			var imgData = canvas.toDataURL('image/png');
			
			var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준 
			var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
			var imgHeight = canvas.height * imgWidth / canvas.width;
			var heightLeft = imgHeight;
			
			var doc = new jsPDF('p', 'mm');
			var position = 0;
			
			doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;
			
			// 한 페이지 이상일 경우 루프 돌면서 출력
			while ( heightLeft >= 20 ) {
				position = heightLeft - imgHeight;
				doc.addPage();
				doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
				heightLeft -= pageHeight;
			}
			
			// 파일 저장
			doc.save(filename);
		}
	})
}