function addCheckList() {
	if(document.frm.number.value.length == 0) {
		alert("차량번호가 입력되지 않았습니다!");
		document.frm.number.focus();
		return false;
	}
	window.location = "l_action.jsp";
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
	else if(document.frm.location.value == "") {
		alert("주차위치가 선택되지 않았습니다.");
		frm.location.focus();
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

function addCheckDelete() {
	if(document.frm.number.value == "") {
		alert("차량번호가 입력되지 않았습니다.");
		return false;
	}
	else if(document.frm.time.value.length == 0) {
		alert("입차시간이 입력되지 않았습니다.");
		document.frm.time.focus();
		return false;
	}
	else {
		alert("출차가 완료되었습니다!");
		return true;
	}
}

function get_name(number) {

	if (number == "11가1111"){
		frm.owner.value = "박선수";
	}
	else if (number == "22가1111"){
		frm.owner.value = "백선수";
	}
	else if (frm.number.value.indexOf("33가1111") != -1){
		frm.owner.value = "채선수";
	}
	else if (frm.number.value.indexOf("44가1111") != -1){
		frm.owner.value = "임선수";
	}
	else if (frm.number.value.indexOf("55가1111") != -1){
		frm.owner.value = "한선수";
	}
	else {
		alert("oh")
	}
}

function res() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
	document.frm.number.focus();
}