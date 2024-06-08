function addCheck() {
	if(frm.no.value.length==0) {
		alert("접종이력번호가 입력되지 않았습니다!");
		frm.no.focus();
		return false;
	}
	else if(frm.id.value.length==0) {
		alert("아이디가 입력되지 않았습니다.");
		frm.id.focus();
		return false;
	}
	else if(frm.code.value==0) {
		alert("백신코드가 입력되지 않았습니다.");
		frm.code.focus();
		return false;
	}
	else if(frm.date.value.length==0) {
		alert("접종일자가 입력되지 않았습니다.");
		frm.date.focus();
		return false;
	}
	else if(frm.round.value.length==0) {
		alert("접종회차가 입력되지 않았습니다.");
		frm.round.focus();
		return false;
	}
	else if(frm.result.value==0) {
		alert("접종결과가 입력되지 않았습니다.");
		frm.result.focus();
		return false;
	}
	else if(frm.agency.value.length==0) {
		alert("기관코드가 입력되지 않았습니다.");
		frm.agency.focus();
		return false;
	}
	else {
		alert("예방접종이력정보가 정상적으로 등록되었습니다.!");
		document.frm.submit();
	}
	return true;
}

function res() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
}