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
    grid.gridView.displayOptions.selectionStyle = "rows";// block, rows, columns, singleRow, singleColumn, none  
    grid.gridView.displayOptions.rowHeight = -1;
    grid.gridView.displayOptions.minRowHeight = 39;
    grid.gridView.setDisplayOptions({
        useAlternateRowStyle: false,
        // liveScroll: false,
        // hscrollBar: false,
    });
    
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
    selectGridDataList(grid, page);
}

function setReceiveData(grid, page) {
    selectGridDataList(grid, page);
    //grid.dataProvider.setRows(data);
}

function selectGridDataList(grid, page){
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