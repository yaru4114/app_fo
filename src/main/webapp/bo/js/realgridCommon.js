//$.document.ready(start);
window.onload = realGridStart;
//domloaded를 대신 써도 됩니다.

/*window.onunload = function() {
    dataProvider.clearRows();

    gridView.destroy();
    dataProvider.destroy();

    gridView = null;
    dataProvider = null;
};*/

function createGrid(grid, page) {
    grid.dataProvider = new RealGrid.LocalDataProvider();
    grid.gridView = new RealGrid.GridView(grid.name);
    grid.gridView.setDataSource(grid.dataProvider);
    grid.dataProvider.setFields(grid.fields);
    grid.gridView.setColumns(grid.columns);

    grid.gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
    grid.gridView.displayOptions.showEmptyMessage = true;
    // gridView.displayOptions.rowHeight = 36;
    // gridView.header.height = 40;
    // gridView.footer.height = 40;
    // gridView.stateBar.width = 16;
    grid.gridView.editOptions.insertable = true;
    grid.gridView.editOptions.appendable = true;

    grid.gridView.displayOptions.fitStyle = "even";// none, even, evenFill, fill
    grid.gridView.sortingOptions.enabled = true;
    //gridView.columnByName("ProductId").sortable = true;
    //gridView.sortingOptions.style = "none";// none, exclusive, inclusive, reverse
    grid.gridView.setRowIndicator({
        visible: false
    });
    grid.gridView.setStateBar({
        visible: false
    });
    var options = {
        width: 50,
    }
    grid.gridView.setCheckBar(options);
    grid.gridView.setFooters({
        visible:false
    });
    grid.gridView.displayOptions.selectionStyle = "block";// block, rows, columns, singleRow, singleColumn, none
    grid.gridView.displayOptions.rowHeight = -1;
    grid.gridView.displayOptions.minRowHeight = 39;
    grid.gridView.setDisplayOptions({
        useAlternateRowStyle: false,
        // liveScroll: false,
        // hscrollBar: false,
    });

    setContextMenu(grid.gridView);

    buttonEvent(grid, page);
    loadData(grid, page);
}

function createGridForNonShowExcel(grid) {
    grid.dataProvider = new RealGrid.LocalDataProvider();
    grid.gridView = new RealGrid.GridView(grid.name);
    grid.gridView.setDataSource(grid.dataProvider);
    grid.dataProvider.setFields(grid.fields);
    grid.gridView.setColumns(grid.columns);

    grid.gridView.editOptions.insertable = true;
    grid.gridView.editOptions.appendable = true;

    grid.gridView.displayOptions.fitStyle = "even";// none, even, evenFill, fill
    grid.gridView.sortingOptions.enabled = true;

    grid.gridView.setRowIndicator({
        visible: false
    });
    grid.gridView.setStateBar({
        visible: false
    });
    var options = {
        width: 50,
    }
    grid.gridView.setCheckBar(options);
    grid.gridView.setFooters({
        visible:false
    });
    grid.gridView.displayOptions.selectionStyle = "rows";// block, rows, columns, singleRow, singleColumn, none
    grid.gridView.displayOptions.rowHeight = -1;
    grid.gridView.displayOptions.minRowHeight = 39;
    grid.gridView.setDisplayOptions({
        useAlternateRowStyle: false,
        // liveScroll: false,
        // hscrollBar: false,
    });
}

function buttonEvent(grid, page) {
    if(!sorin.validation.isNull(grid.insertButton)) {
        $("#" + grid.insertButton).click(function(event){
            event.preventDefault();

            if(grid.isInsertPopUpModal) {
                var obj = {
                    "modalPageStatus" : "insert"
                }

                if(!sorin.validation.isNull(grid.popUpModalAddParams)){
                    Object.assign(obj, grid.popUpModalAddParams);
                }

                popUpModal(JSON.stringify(obj), grid, page);
            } else {
                btn_beginInsertRow(grid);
            }
        });
    }

    if(!sorin.validation.isNull(grid.updateButton)) {
        $("#" + grid.updateButton).click(function(event){
            event.preventDefault();

            if(grid.isUpdatePopUpModal) {
                var checkedDataArray = grid.gridView.getCheckedRows(true);
                if(checkedDataArray.length == 1){
                    var obj = grid.dataProvider.getJsonRow(checkedDataArray[0]);
                    obj.modalPageStatus = "update";

                    if(!sorin.validation.isNull(grid.popUpModalAddParams)){
                        Object.assign(obj, grid.popUpModalAddParams);
                    }

                    popUpModal(JSON.stringify(obj), grid, page);
                } else {
                    alert("수정하실 열 하나를 체크해야합니다.");
                }
            }
        });
    }

    if(!sorin.validation.isNull(grid.deleteButton)) {
        $("#" + grid.deleteButton).click(function(event){
            event.preventDefault();

            btn_beginDeleteRow(grid, page);
        });
    }

    if(!sorin.validation.isNull(grid.saveButton)) {
        $("#" + grid.saveButton).click(function(event){
            event.preventDefault();

            btn_beginSaveRow(grid, page);
        });
    }
}

function btn_beginInsertRow(grid) {
    if(grid.gridView.getItemCount() == 0) {
        grid.gridView.beginAppendRow();
    } else {
        //var curr = grid.gridView.getCurrent();
        grid.gridView.beginInsertRow(0, false);
    }

    grid.gridView.commit(true);
}

function btn_beginDeleteRow(grid, page) {
    var checkedDataArray = grid.gridView.getCheckedRows(true);
    if(checkedDataArray.length > 0) {

        if(confirm("체크한 열을 삭제 하시겠습니까?") == true){
            var dataArray = new Array();
            var deleteCreatedArray = new Array();
            for(var i = 0; i < checkedDataArray.length; i++) {
                if(grid.dataProvider.getRowState(checkedDataArray[i]) == 'created') {
                    deleteCreatedArray.push(checkedDataArray[i]);
                }

                var obj = grid.dataProvider.getJsonRow(checkedDataArray[i]);

                if(!sorin.validation.isNull(grid.delectAddParams)){
                    Object.assign(obj, grid.delectAddParams);
                }

                dataArray.push(obj);
            }

            if(deleteCreatedArray.length > 0) {
                grid.dataProvider.removeRows(deleteCreatedArray);
            } else {
                deleteGridDataList(dataArray, grid, page);
            }
        } else {
            return;
        }
    }
}

function btn_beginSaveRow(grid, page) {
    grid.gridView.clearCurrent();

    var rowDataArray = grid.dataProvider.getAllStateRows();

    var dataArray = new Array();
    for(var i = 0; i < rowDataArray.created.length; i++) {
        var obj = grid.dataProvider.getJsonRow(rowDataArray.created[i]);
        obj.gridRowStatus = "created";

        if(!sorin.validation.isNull(grid.insertAndUpdateAddParams)){
            Object.assign(obj, grid.insertAndUpdateAddParams);
        }

        dataArray.push(obj);
    }

    for(var i = 0; i < rowDataArray.updated.length; i++) {
        var obj = grid.dataProvider.getJsonRow(rowDataArray.updated[i]);
        obj.gridRowStatus = "updated";

        if(!sorin.validation.isNull(grid.insertAndUpdateAddParams)){
            Object.assign(obj, grid.insertAndUpdateAddParams);
        }

        dataArray.push(obj);
    }

    insertAndUpdateGridDataList(dataArray, grid, page);
}

function loadData(grid, page) {
	page.currentPage = 1;
    selectGridDataList(grid, page, null);
}

/**
 * CallBack 함수를 호출 할 수 있는 함수 추가
 */
function loadDataCallBackFunc(grid, page, func) {
	page.currentPage = 1;
    selectGridDataList(grid, page, func);
}

function setReceiveData(grid, page) {
    selectGridDataList(grid, page, null);
    //grid.dataProvider.setRows(data);
}

function selectGridDataList(grid, page, func){
    var recordCountPerPage = (page.dataRowPerPage * page.currentPage);
    var firstIndex = recordCountPerPage - (page.dataRowPerPage - 1);

    var params = {
        "firstIndex" : firstIndex
        , "recordCountPerPage" : recordCountPerPage
    }

    if(!sorin.validation.isNull(grid.searchParams)){
        Object.assign(params, grid.searchParams);
    }

    if(!sorin.validation.isNull(grid.selectAddParams)){
        Object.assign(params, grid.selectAddParams);
    }

    sorin.ajax.postSetDataType(grid.selectURL, JSON.stringify(params), "", true, function(result) {
        if(!sorin.validation.isNull(result)) {
            grid.dataProvider.setRows(result.dataList);
            page.totalRowCount = result.totalDataCount;
    		setPaging(grid, page);
    		
    		if( func != null ){
				eval(func + "()");
			}
        }
    });
}

function selectExportGridList (grid){

    var params = {}

    if(!sorin.validation.isNull(grid.searchParams)){
        Object.assign(params, grid.searchParams);
    }

    if(!sorin.validation.isNull(grid.selectAddParams)){
        Object.assign(params, grid.selectAddParams);
    }

    sorin.ajax.postSetDataType(grid.selectURL, JSON.stringify(params), "", false, function(result) {
        if(!sorin.validation.isNull(result)) {
            grid.dataProvider.setRows(result.dataList);
        }
    });
}

function insertAndUpdateGridDataList(dataArray, grid, page){

    // validation 체크
    if(chkValidation(grid) == false){
        return;
    }

    sorin.ajax.postSetDataType(grid.insertAndUpdateURL, JSON.stringify(dataArray), "", true, function(result) {
        if(!sorin.validation.isNull(result)){
            loadData(grid, page);
        }
    });
}

function deleteGridDataList(dataArray, grid, page){

    sorin.ajax.postSetDataType(grid.deleteURL, JSON.stringify(dataArray), "", true, function(result) {
        if(!sorin.validation.isNull(result)){
            loadData(grid, page);
        }
    });
}


function popUpModal(data, grid, page){
    sorin.ajax.postSetDataType(grid.popUpModalURL, data, "html", true, function(result) {
        if(!sorin.validation.isNull(result)) {
            $(grid.modalContentClass).html(result);
            $(grid.modalId).modal();
        }
    });
}

function setPaging(grid, page){
    grid.gridView.setPaging(true, page.dataRowPerPage);
    paging(grid, page);
    //page.currentPage = 1;
}

function paging(grid, page) {
    var totalPage = Math.ceil(page.totalRowCount/page.dataRowPerPage);    // 총 페이지 수
    var pageGroup = Math.ceil(page.currentPage/page.pageCount);    // 페이지 그룹

    var last = pageGroup * page.pageCount;    // 화면에 보여질 마지막 페이지 번호

    if(last > totalPage) {
        last = totalPage;
    }

    var first = last - (page.pageCount-1);    // 화면에 보여질 첫번째 페이지 번호

    if(first < 1) {
        first = 1;
    }

    var next = last+1;

    if(next > totalPage) {
        next = totalPage;
    }

    var prev = first-1;

    var $pingingView = $(page.page);

    var html = "";

    if(prev == 0) {
        html += "<a href=# id='first' class='disabled' aria-label='처음페이지'>|<</a> ";
        html += "<a href=# id='prev' class='disabled' aria-label='이전페이지'><</a> ";
    } else {
        html += "<a href=# id='first' aria-label='처음페이지'>|<</a> ";
        html += "<a href=# id='prev' aria-label='이전페이지'><</a> ";
    }


    for(var i = first; i <= last; i++){
        html += "<a href='#' id=" + i + ">" + i + "</a> ";
    }

    if(last < totalPage) {
        html += "<a href=# id='next' aria-label='다음페이지'>></a>";
        html += "<a href=# id='last' aria-label='마지막페이지'>>|</a>";
    } else {
        html += "<a href=# id='next' class='disabled' aria-label='다음페이지'>></a>";
        html += "<a href=# id='last' class='disabled' aria-label='마지막페이지'>>|</a>";
    }


    $(page.page).html(html);    // 페이지 목록 생성

    $(page.page + " a#" + page.currentPage).addClass('active');    // 현재 페이지 표시

    $(page.page + " a").click(function(event){
        event.preventDefault();

        var $item = $(this);
        var $id = $item.attr("id");
        var selectedPage = $item.text();

        switch ($id) {
            case 'first':
            	selectedPage = 1;
                break;
            case 'next':
            	selectedPage = next;
                break;
            case 'prev':
            	selectedPage = prev;
                break;
            case 'last':
            	selectedPage = totalPage;
                break;
            default:
            	break;
      	}

        if(selectedPage < 1) {
        	selectedPage = 1;
        }

        //grid.gridView.setPage(selectedPage-1);

        page.currentPage = selectedPage;

        setReceiveData(grid, page);

        //paging(grid, page);
    });

}

/**
 * <pre>
 * 함수명 : chkValidation</br>
 * 설  명 : setValidateColumn 메소드에 설정된 validation 설정을 기본으로 유효성 검사를 진행함</br>
 * 사용법 : </br>
 * 작성일 : 2021. 6. 14.</br>
 * 작성자 : Kwon sun hyung</br>
 * -------------------------------------</br>
 * 2021. 6. 14. Kown sun hyung - 생성
 * </pre>
 *
 * @return {Boolean} 유효성 통과값
 */
function chkValidation(grid){
    var returnList = grid.gridView.validateCells(null, false);

    if(returnList != null && returnList.length > 0) {
        alert(returnList[0].message);

        return false; // validation 통과 못함
    } else {
        return true; // validation 통과
    }
}

/**
 * <pre>
 * 함수명 : createGridSummary</br>
 * 설  명 : createGrid시 Summary 값 함께 표출</br>
 * 사용법 : </br>
 * 작성일 : 2022. 6. 17.</br>
 * 작성자 : Lee hyun jin</br>
 * -------------------------------------</br>
 * 2022. 6. 17. 2022. 6. 17. - 생성
 * </pre>
 *
 */
function createGridSummary(grid, page, summary) {
    grid.dataProvider = new RealGrid.LocalDataProvider();
    grid.gridView = new RealGrid.GridView(grid.name);
    grid.gridView.setDataSource(grid.dataProvider);
    grid.dataProvider.setFields(grid.fields);
    grid.gridView.setColumns(grid.columns);

    grid.gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
    grid.gridView.displayOptions.showEmptyMessage = true;
    // gridView.displayOptions.rowHeight = 36;
    // gridView.header.height = 40;
    // gridView.footer.height = 40;
    // gridView.stateBar.width = 16;
    grid.gridView.editOptions.insertable = true;
    grid.gridView.editOptions.appendable = true;

    grid.gridView.displayOptions.fitStyle = "even";// none, even, evenFill, fill
    grid.gridView.sortingOptions.enabled = true;
    //gridView.columnByName("ProductId").sortable = true;
    //gridView.sortingOptions.style = "none";// none, exclusive, inclusive, reverse
    grid.gridView.setRowIndicator({
        visible: false
    });
    grid.gridView.setStateBar({
        visible: false
    });
    var options = {
        width: 50,
    }
    grid.gridView.setCheckBar(options);
    grid.gridView.setFooters({
        visible:false
    });
    grid.gridView.displayOptions.selectionStyle = "rows";// block, rows, columns, singleRow, singleColumn, none
    grid.gridView.displayOptions.rowHeight = -1;
    grid.gridView.displayOptions.minRowHeight = 39;
    grid.gridView.setDisplayOptions({
        useAlternateRowStyle: false,
        // liveScroll: false,
        // hscrollBar: false,
    });

    buttonEvent(grid, page);
    loadDataSummary(grid, page, summary);
}

/**
 * <pre>
 * 함수명 : loadDataSummary</br>
 * 설  명 : loadData시 Summary 값 함께 표출</br>
 * 사용법 : </br>
 * 작성일 : 2022. 6. 17.</br>
 * 작성자 : Lee hyun jin</br>
 * -------------------------------------</br>
 * 2022. 6. 17. 2022. 6. 17. - 생성
 * </pre>
 *
 */
function loadDataSummary(grid, page, summary) {
	page.currentPage = 1;
    selectGridDataListSummary(grid, page, summary);
}

function selectGridDataListSummary(grid, page, summary){
    var recordCountPerPage = (page.dataRowPerPage * page.currentPage);
    var firstIndex = recordCountPerPage - (page.dataRowPerPage - 1);

    var params = {
        "firstIndex" : firstIndex
        , "recordCountPerPage" : recordCountPerPage
    }

    if(!sorin.validation.isNull(grid.searchParams)){
        Object.assign(params, grid.searchParams);
    }

    if(!sorin.validation.isNull(grid.selectAddParams)){
        Object.assign(params, grid.selectAddParams);
    }

    sorin.ajax.postSetDataType(grid.selectURL, JSON.stringify(params), "", true, function(result) {

    	if(!sorin.validation.isNull(result)) {
            grid.dataProvider.setRows(result.dataList);
            page.totalRowCount = result.totalDataCount;
            summary = result.summaryList;	// summary 그리드 호출시 map 형식으로 summaryList 추가

    		setPaging(grid, page);
			setSummary(summary);	// setSummary(summary)각 페이지 생성 후 수정 필요
        }
    });
}

var toggle = false;
function setContextMenu(grid) {
	grid.onContextMenuItemClicked = function (grid, item, clickData) {
		if (item.tag == "excel") {
			if( typeof(excelExport) == 'function' ) {
				excelExport();
			}else{
				grid.exportGrid({
			        type: "excel",
			        target: "local",
			        fileName: "EXCEL_EXPORT.xlsx",
			        progressMessage: "엑셀 Export중입니다.",
			        indicator: 'visible',
			        header: 'visible',
			        footer: 'visible',
			        lookupDisplay: true,
			        pagingAllItems: true,
			        applyDynamicStyles : true
			    })
			}
		} else if (item.tag == 'filter' && clickData.column) {
			createColumnFilter(grid, clickData.column);
		} else if (item.tag == 'visibleTrue') {
			var columns = grid.getColumns();

			for (var i in columns) {
				grid.setColumnProperty(columns[i].name, "visible", true);
			}
			toggle = false;
			setHeaderCellContextMenu(grid, toggle);
		} else if (item.tag == 'visibleFalse') {
			grid.setColumnProperty(clickData.column, "visible", false);
			toggle = true;
			setHeaderCellContextMenu(grid, toggle);
		} else if (item.tag == 'fixedCol') {
			var count = grid.getColumnProperty(clickData.column, "displayIndex") + 1;
			grid.setFixedOptions({ colCount: count });
		} else if (item.tag == 'fixedRow') {
			var count = clickData.itemIndex + 1;
			grid.setFixedOptions({ rowCount: count });
		} else if (item.tag == 'fixedCancel') {
			grid.setFixedOptions({ colCount: 0, rowCount: 0 });
		} else if (item.tag == 'copy') {
			var sel = grid.getSelection();
			var copied = grid.copyToClipboard(sel);
       };
   }

	grid.onContextMenuPopup = function (grid, x, y, elementName) {
		if(elementName != undefined){
			if (elementName.cellType == 'header') {
				return false;
				/*
				if(elementName['subType'] == undefined ){
					setHeaderCellContextMenu(grid, toggle);
				}else{
					return false;
				}
				*/
			} else if (elementName.cellType == 'data') {
				setDataCellContextMenu(grid);
			} else {
				return false;
			}
		}
	};

   setDataCellContextMenu(grid);
}

function setDataCellContextMenu(grid) {
	var contextMenu = [{
		label: "엑셀 내보내기"/*엑셀 내보내기*/,
		tag: 'excel'
	}, {
		label: "-"
	}, {
		label: "복사"/*복사*/,
		tag: 'copy'
	}, {
		label: "행 고정"/*'행 고정*/,
		tag: 'fixedRow'
	}, {
		label: "고정 취소"/*'고정 취소*/,
		tag: 'fixedCancel'
	}];

	grid.setContextMenu(contextMenu);
}

function setHeaderCellContextMenu(grid, val) {
	var contextMenu = [{
		label: "엑셀 내보내기"/*엑셀 내보내기*/,
       tag: 'excel'
	}, {
       label: "-"
	}, {
       label: "컬럼 숨기기"/*컬럼 숨기기*/,
       tag: 'visibleFalse'
	}, {
       label: "컬럼 모두 보이기"/*컬럼 모두 보이기*/,
       tag: 'visibleTrue',
       enabled: val
	}];

	grid.setContextMenu(contextMenu);
}