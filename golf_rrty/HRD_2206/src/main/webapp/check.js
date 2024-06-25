var ccno;

function findNum(cname) {
	document.frm.cno.value = cname;
	ccno = cname;
}

function findTuition(money) {
	if(ccno >= 20000) frm.tuition.value = money * 1000 / 2;
	else frm.tuition.value = money * 1000;
}

function addCheck() {
	if(frm.month.value.length == 0) {
		alert("수강월이 입력되지 않았습니다.");
		frm.month.focus();
		return false;
	}
	else if(frm.cname.value.length == 0) {
		alert("회원명이 입력되지 않았습니다.");
		frm.cname.focus();
		return false;
	}
	else if(frm.cno.value.length == 0) {
		alert("회원번호가 입력되지 않았습니다.");
		frm.cno.focus();
		return false;
	}
	else if(frm.location.value.length == 0) {
		alert("강의장소가 입력되지 않았습니다.");
		frm.location.focus();
		return false;
	}
	else if(frm.class_name.value.length == 0) {
		alert("강의명 입력되지 않았습니다.");
		frm.class_name.focus();
		return false;
	}
	else if(frm.tuition.value.length == 0) {
		alert("강의료가 입력되지 않았습니다.");
		frm.tuition.focus();
		return false;
	}
	else {
		alert("수강신청이 정상적으로 완료되었습니다!");
		document.frm.submit();
		return true;
	}
}

function res() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.month.focus();
	document.frm.reset();
}