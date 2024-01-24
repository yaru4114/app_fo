/*eslint-disable*/

var fields = [
    {
        fieldName: "rowNo",
        dataType: "int"
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
        dataType: "text",
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
        dataType: "text"
    },
    {
        fieldName: "bidConfmSttusCode",
        dataType: "text",
    }
];


var columns = [
    {
        name: "rowNo",
        fieldName: "rowNo",
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
        },
        sortable: false
    },
    {
        name: "bidMberEmail",
        fieldName: "bidMberEmail",
        width: "150",
        header: {
            text: "이메일"
        },
        sortable: false
    },
    {
        name: "moblphonNo2",
        fieldName: "moblphonNo2",
        width: "100",
        header: {
            text: "폰 번호"
        },
        sortable: false
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
        name: "bidConfmSttusCode",
        fieldName: "bidConfmSttusCode",
        width: "60",
        header: {
            text: "상태"
        }
    }
];