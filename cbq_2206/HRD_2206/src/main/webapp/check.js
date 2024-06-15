function addCheckList() {
	if(document.frm.number.value.length == 0) {
		alert("차량번호가 입력되지 않았습니다!");
		document.frm.number.focus();
		return false;
	}
	window.location = "result.jsp";
	return true;
}

function backHome() {
	window.location = "index.jsp";
}