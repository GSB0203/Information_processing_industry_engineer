function addCheckList() {
	if(document.frm.number.value.length == 0) {
		alert("차량번호가 입력되지 않았습니다!");
		document.frm.number.focus();
		return false;
	}
	window.location = "result.jsp";
	return true;
}

function addCheckInsert() {
	if(document.frm.number.value.length == 0) {
		alert("차량번호가 입력되지 않았습니다.");
		document.frm.number.focus();
		return false;
	}
	else if(document.frm.name.value.length == 0) {
		alert("소유자 이름이 입력되지 않았습니다.");
		document.frm.name.focus();
		return false;
		}
	else if(document.frm.location.value.length == 0) {
		alert("주차위치가 입력되지 않았습니다.");
		document.frm.location.focus();
		return false;
		}
	else if(document.frm.time.value.length == 0) {
		alert("입차시간이 입력되지 않았습니다.");
		document.frm.time.focus();
		return false;
	}
	else {
		alert("입차가 완료되었습니다!");
		return true;
	}
}

function res() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
	document.frm.number.focus();
	}