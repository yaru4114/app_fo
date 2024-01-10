
var stompClient = null;
var stompSubscribeJSON = {};

/**
 * <pre>
 * 함수명 : stompConnect</br>
 * 설  명 : 웹 소켓의 접속 정보를 만든다.</br>
 * 사용법 : stompConnect(socketURI)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @param socketURI 소켓으로 접속 할 URL
 * @return 웹 소켓 접속 정보 객체
 */
function stompConnect(socketURI) {
    //let webSocket = new SockJS(socketURI);
    //return Stomp.over(webSocket);

    let client = Stomp.over(function(){
		return new SockJS(socketURI);
	});

    client.reconnect_delay = 5000;

	return client;
}

/**
 * <pre>
 * 함수명 : stompOpen</br>
 * 설  명 : 웹소켓에 접속한다.</br>
 * 사용법 : stompOpen(stompClient, successCallBackFunc)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @param stompClient 웹 소켓 접속 정보 객체
 * @param successCallBackFunc 성공 callback function
 */
function stompOpen(stompClient, successCallBackFunc) {
	stompClient.connect({}, function (receiveData) {
        successCallBackFunc(receiveData);
    });
}

/**
 * <pre>
 * 함수명 : stompSubscribe</br>
 * 설  명 : 구독 정보를 등록한다.</br>
 * 사용법 : stompSubscribe(stompClient, subscribeURI, successCallBackFunc)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @param stompClient 웹 소켓 접속 정보 객체
 * @param subscribeURI 구독 할 URI
 * @param receiveCallBackFunc 메시지 받는 callback function
 * @return 등록 성공한 구독 ID
 */
function stompSubscribe(stompClient, subscribeURI, receiveCallBackFunc) {
	let subscribeId =  stompClient.subscribe(subscribeURI, function (receiveData) {
		receiveCallBackFunc(receiveData);
    });
	
	stompSubscribeJSON[subscribeURI] = subscribeId.id;
}

/**
 * <pre>
 * 함수명 : stompCloseSubscribe</br>
 * 설  명 : 등록된 구독 정보를 없앤다.</br>
 * 사용법 : stompCloseSubscribe(stompClient, subscribeId)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @param stompClient 웹 소켓 접속 정보 객체
 * @param subscribeId 구독 할 URI
 */
function stompCloseSubscribe(stompClient, subscribeURI){
	stompClient.unsubscribe(stompSubscribeJSON[subscribeURI]);
	delete stompSubscribeJSON[subscribeURI];
}

/**
 * <pre>
 * 함수명 : stompDisconnect</br>
 * 설  명 : 웹소켓의 접속을 끊는다.</br>
 * 사용법 : stompDisconnect(stompClient)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @param stompClient 웹 소켓 접속 정보 객체
 */
function stompDisconnect(stompClient) {
    stompClient.disconnect();
}

/**
 * <pre>
 * 함수명 : stompSend</br>
 * 설  명 : 서버로 메시지를 보낸다.</br>
 * 사용법 : stompSend(stompClient, sendURI, header, message)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @param stompClient 웹 소켓 접속 정보 객체
 * @param sendURI 정보를 보낼 URI
 * @param header 헤더정보
 * @param message 보낼 메시지
 */
function stompSend(stompClient, sendURI, header, message) {
	stompClient.send(sendURI, {"header" : header}, message);
}

/**
 * <pre>
 * 함수명 : stompSendMessage</br>
 * 설  명 : 메시지를 보낼때 JSON.stringify으로 convert하여 보낸다.</br>
 * 사용법 : stompSendMessage(sendData)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @return JSON
 */
function stompSendMessage(sendData) {
	return JSON.stringify(sendData);
}

/**
 * <pre>
 * 함수명 : stompReceiveMessage</br>
 * 설  명 : 서버로 부터 받은 JSON 형식 메시지를 파싱한다.</br>
 * 사용법 : stompReceiveMessage(receiveData)</br>
 * 작성일 : 2021. 9. 3.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 9. 3. Kown sun hyung - 생성
 * </pre>
 *
 * @return JSON
 */
function stompReceiveMessage(receiveData) {
	return JSON.parse(receiveData.body);
}

