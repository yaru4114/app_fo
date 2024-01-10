class Grids{
	//그리드 이름
	//String
	get name(){
		return this._name;
	}
	set name(value){
		this._name = value;
	}
	//컬럼변수 
	//coulmns
	get columns(){
		return this._columns;
	}
	set columns(value){
		this._columns = value;
	}
	//필드변수 
	//field
	get fields(){
		return this._field;
	}
	set fields(value){
		this._field = value;
	}
	//insertButton ID 
	//String
	get insertButton(){
		return this._insertButton;
	}
	set insertButton(value){
		this._insertButton = value;
	}
	//updateButton ID 
	//String
	get updateButton(){
		return this._updateButton;
	}
	set updateButton(value){
		this._updateButton = value;
	}
	//deleteButton ID 
	//String
	get deleteButton(){
		return this._deleteButton;
	}
	set deleteButton(value){
		this._deleteButton = value;
	}
	//save ID 
	//String
	get saveButton(){
		return this._saveButton;
	}
	set saveButton(value){
		this._saveButton = value;
	}
	//isInsertPopUpModal 
	//boolean
	get isInsertPopUpModal(){
		return this._isInsertPopUpModal;
	}
	set isInsertPopUpModal(value){
		this._isInsertPopUpModal = value;
	}
	//isUpdatePopUpModal
	//boolean
	get isUpdatePopUpModal(){
		return this._isUpdatePopUpModal;
	}
	set isUpdatePopUpModal(value){
		this._isUpdatePopUpModal = value;
	}
	//modalInsertButton ID 
	//String
	get modalInsertButton(){
		return this._modalInsertButton;
	}
	set modalInsertButton(value){
		this._modalInsertButton = value;
	}
	//modalUpdateButton ID 
	//String
	get modalUpdateButton(){
		return this._modalUpdateButton;
	}
	set modalUpdateButton(value){
		this._modalUpdateButton = value;
	}
	//Provider 
	//realgridProvider
	get dataProvider(){
		return this._dataProvider;
	}
	set dataProvider(value){
		this._dataProvider = value;
	}
	//gridView 
	//realgridGridView
	get gridView(){
		return this._gridView;
	}
	set gridView(value){
		this._gridView = value;
	}
	//searchParams 
	//JSON
	get searchParams(){
		return this._searchParams;
	}
	set searchParams(value){
		this._searchParams = value;
	}
	//selectURL 
	//String
	get selectURL(){
		return this._selectURL;
	}
	set selectURL(value){
		this._selectURL = value;
	}
	//insertAndUpdateURL 
	//String
	get insertAndUpdateURL(){
		return this._insertAndUpdateURL;
	}
	set insertAndUpdateURL(value){
		this._insertAndUpdateURL = value;
	}
	//deleteURL 
	//String
	get deleteURL(){
		return this._deleteURL;
	}
	set deleteURL(value){
		this._deleteURL = value;
	}
	//popUpModalURL 
	//String
	get popUpModalURL(){
		return this._popUpModalURL;
	}
	set popUpModalURL(value){
		this._popUpModalURL = value;
	}
	//modalContentClass 
	//String
	get modalContentClass(){
		return this._modalContentClass;
	}
	set modalContentClass(value){
		this._modalContentClass = value;
	}
	//modalId 
	//String
	get modalId(){
		return this._modalId;
	}
	set modalId(value){
		this._modalId = value;
	}
	//select시 추가할 Parameters 
	//JSON
	get selectAddParams(){
		return this._selectAddParams;
	}
	set selectAddParams(value){
		this._selectAddParams = value;
	}
	//insertAndUpdate시 추가할 Parameters 
	//JSON
	get insertAndUpdateAddParams(){
		return this._insertAndUpdateAddParams;
	}
	set insertAndUpdateAddParams(value){
		this._insertAndUpdateAddParams = value;
	}
	//delect시 추가할 Parameters 
	//JSON
	get deleteAddParams(){
		return this._deleteAddParams;
	}
	set deleteAddParams(value){
		this._deleteAddParams = value;
	}
	//popUpModal시 추가할 Parameters 
	//JSON
	get popUpModalAddParams(){
		return this._popUpModalAddParams;
	}
	set popUpModalAddParams(value){
		this._popUpModalAddParams = value;
	}
}

class Pages{
	//페이지명
	//String
	get page(){
		return this._page;
	}
	set page(value){
		this._page = value;
	}
	//총 Row수
	//int
	get totalRowCount(){
		return this._totalRowCount;
	}
	set totalRowCount(value){
		this._totalRowCount = value;
	}
	//현재 페이지의 넘버
	//int
	get currentPage(){
		return this._currentPage;
	}
	set currentPage(value){
		this._currentPage = value;
	}
	//한 페이지에 나타낼 데이터 Row 수
	//int
	get dataRowPerPage(){
		return this._dataRowPerPage;
	}
	set dataRowPerPage(value){
		this._dataRowPerPage = value;
	}
	// 한 화면에 나타낼 페이지 수
	//int
	get pageCount(){
		return this._pageCount;
	}
	set pageCount(value){
		this._pageCount = value;
	}
}
