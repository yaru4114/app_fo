// SockJS라이브러리를 이용하여 서버에 연결하고 해당 Instance 반환
function websocketConnect(socketURI) {
    return webSocket = new SockJS(socketURI);
}

function websocketDisconnect(webSocket) {
    if (webSocket != null) {
        webSocket.close();
		webSocket = null;
    }
}

function websocketSend(webSocket, data) {
	if(!sorin.validation.isNull(webSocket)) {
		webSocket.send(data);
	}
}

function websocketOpen(webSocket, callBackFunc) {
	if(!sorin.validation.isNull(webSocket)) {
		// onopen : connection이 맺어졌을 때의 callback
	    webSocket.onopen = function (data) {
			callBackFunc(data);
		}
	}
}

function websocketOnMessage(webSocket, callBackFunc) {
	if(!sorin.validation.isNull(webSocket)) {
		// onmessage : message를 받았을 때의 callback
		webSocket.onmessage = function (data) {
			callBackFunc(data);
		}
	}
}

function websocketSendMessage(sendData) {
	return JSON.stringify(sendData);
}

function websocketReceiveMessage(receiveData) {
	return JSON.parse(receiveData.data);
}