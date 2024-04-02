function addCheck() {
	if(frm.id.value.leght==0) {
		alert("참가번호가 입력되지 않았습니다.");
		return false;
	}
	return true;
}

function res() {
	document.frm.reset();
}