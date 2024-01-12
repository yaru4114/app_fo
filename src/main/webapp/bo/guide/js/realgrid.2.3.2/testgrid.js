/*eslint-disable*/

var fields = [
    {
        fieldName: "bidEntrpsNo",
        dataType: "number",
    },
    {
        fieldName: "entrpsNm",
        dataType: "text",
    },
    {
        fieldName: "bidMberId",
        dataType: "text",
    },
    {
        fieldName: "bsnmRegistNo",
        dataType: "number",
    },
    {
        fieldName: "bidMberEmail",
        dataType: "text",
    },
    {
        fieldName: "moblphonNo2",
        dataType: "text",
    },
    {
        fieldName: "frntnEntrpsAt",
        dataType: "text",
    },
    {
        fieldName: "etrConfmRequstDt",
        dataType: "datetime",
        datetimeFormat: "yyyy-MM-dd HH:mm:ss"
    },
    {
        fieldName: "etrConfmProcessDt",
        dataType: "datetime",
        datetimeFormat: "yyyy-MM-dd HH:mm:ss"
    },
    {
        fieldName: "bidMberIntrcpDt",
        dataType: "datetime",
        datetimeFormat: "yyyy-MM-dd HH:mm:ss"
    },
    {
        fieldName: "successCount",
        dataType: "number",
    },
    {
        fieldName: "failCount",
        dataType: "number",
    },
    {
        fieldName: "sttusCode",
        dataType: "text",
    }
];


var columns = [
    {
        name: "bidEntrpsNo",
        fieldName: "bidEntrpsNo",
        width: "94",
        header: {
            text: "순번"
        }
    },
    {
        name: "entrpsNm",
        fieldName: "entrpsNm",
        width: "140",
        header: {
            text: "기업명"
        }
    },
    {
        name: "bidMberId",
        fieldName: "bidMberId",
        width: "120",
        header: {
            text: "ID"
        }
    },
    {
        name: "bsnmRegistNo",
        fieldName: "bsnmRegistNo",
        width: "160",
        header: {
            text: "사업자번호"
        }
    },
    {
        name: "bidMberEmail",
        fieldName: "bidMberEmail",
        width: "150",
        header: {
            text: "이메일"
        }
    },
    {
        name: "moblphonNo2",
        fieldName: "moblphonNo2",
        width: "100",
        header: {
            text: "폰 번호"
        }
    },
    {
        name: "frntnEntrpsAt",
        fieldName: "frntnEntrpsAt",
        width: "100",
        header: {
            text: "외국기업유무"
        }
    },
    {
        name: "etrConfmRequstDt",
        fieldName: "etrConfmRequstDt",
        width: "140",
        header: {
            text: "승인요청일"
        }
    },
    {
        name: "etrConfmProcessDt",
        fieldName: "etrConfmProcessDt",
        width: "140",
        header: {
            text: "승인처리일"
        }
    },
    {
        name: "bidMberIntrcpDt",
        fieldName: "bidMberIntrcpDt",
        width: "140",
        header: {
            text: "차단일"
        }
    },
    {
        name: "successCount",
        fieldName: "successCount",
        width: "100",
        header: {
            text: "낙찰건수"
        }
    },
    {
        name: "failCount",
        fieldName: "failCount",
        width: "100",
        header: {
            text: "패찰건수"
        }
    },
    {
        name: "sttusCode",
        fieldName: "sttusCode",
        width: "60",
        header: {
            text: "상태"
        }
    }
];

var httpRequest;

function setProvider(filename) {
    httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = loadData;
    httpRequest.open("GET", "/public/data/" + filename);
    httpRequest.send();
}

function loadData() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
        if (httpRequest.status === 200) {
            var data = JSON.parse(httpRequest.responseText);
            dataProvider.setRows(data);
            gridView.refresh();
        }
    }
}

var dataProvider, gridContainer, gridView;

function createGrid(container) {
    dataProvider = new RealGrid.LocalDataProvider();
    dataProvider.setFields(fields);

    gridView = new RealGrid.GridView(container);
    gridView.displayOptions.emptyMessage = "입찰 회원이 존재하지 않습니다.";
    gridView.header.height = 40;
    gridView.displayOptions.rowHeight = 36;
    gridView.footer.height = 40;
    gridView.stateBar.width = 16;

    gridView.setCheckBar({
        visible: false
    });
    gridView.setRowIndicator({
        visible: false
    });
    gridView.displayOptions.fitStyle = "even";
    gridView.setDataSource(dataProvider);
    gridView.setColumns(columns);
    // setProvider("simple_data.json");

    gridView.editOptions.insertable = true;
    gridView.editOptions.appendable = true;


}

function start() {
    createGrid("realgrid");
}

// $.document.ready(start);
window.onload = start;
// domloaded를 대신 써도 됩니다.

window.onunload = function() {
    dataProvider.clearRows();

    gridView.destroy();
    dataProvider.destroy();

    gridView = null;
    dataProvider = null;
};

// function changeCSS(cssFile, cssLinkIndex) {
//
//     var oldlink = document.getElementsByTagName("link").item(cssLinkIndex);
//
//     var newlink = document.createElement("link");
//     newlink.setAttribute("rel", "stylesheet");
//     newlink.setAttribute("type", "text/css");
//     newlink.setAttribute("href", cssFile);
//
//     document.getElementsByTagName("head").item(0).replaceChild(newlink, oldlink);
// }
