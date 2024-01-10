
///////////////////////////////      Message 처리      ///////////////////////////////

$(function () {
	$.i18n.properties({
	    name:'message-comm',
	    path:'/properties',
	    mode:'map',
	    language:'ko',
	    callback: function () {
	 	   console.log("Load OK");
	    }
	 });
});

sorin.message ={
	/**
	 * <pre>
	 * 함수명 : geti18nMsg</br>
	 * 설  명 : 메시지 프로퍼티에 등록된 메시지를 가져온다.</br>
	 * 사용법 : geti18nMsg(code, args)</br>
	 * 작성일 : 2021. 8. 18.</br>
	 * 작성자 : srec0012</br>
	 * -------------------------------------</br>
	 * 2021. 8. 18. srec0012 - 생성
	 * </pre>
	 *
	 * @param - code 메시지명
	 * @param - argss 메시지 Params
	 * @return {String} 값
	 */
	geti18nMsg : function(code, args){
		var msg;
		if (null==args || typeof args =="undefined" || args == ""){
			msg = $.i18n.prop(code);
		}
		else{
			 msg = $.i18n.prop(code,args);
		}
		return msg;
	}
};

sorin.sorinValidationReturn = function(msg,field) {
      alertPopup(msg,function(){field.focus();return true;});
};
///////////////////////////////      Message 처리 끝     ///////////////////////////////