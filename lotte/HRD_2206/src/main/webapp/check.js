function addModify() {
	alert("선수의 정보수정이 완료되었습니다");
	document.frm.submit();
}

function addCheck() {
	if(document.frm.pname.value.length == 0) {
		alert("선수이름이 입력되지 않았습니다.");
		document.frm.pname.focus();
		return false;
	}
	else if(document.frm.pposition.value == "") {
		alert("선수포지션이 입력되지 않았습니다.");
		document.frm.pposition.focus();
		return false;
	}
	else if(document.frm.pdate.value.length == 0) {
		alert("선수등록일이 입력되지 않았습니다.");
		document.frm.pdate.focus();
		return false;
	}
	else if(document.frm.pgrade[0].checked==false && 
	   document.frm.pgrade[1].checked==false &&
	   document.frm.pgrade[2].checked==false &&
	   document.frm.pgrade[3].checked==false)
	{
		alert("선수등급이 입력되지 않았습니다.");
		return false;
	}
	else {
		alert("선수등록이 완료되었습니다");
		document.frm.submit();
		return true;
	}
}

function cancel() {
	alert("선수의 정보수정을 취소합니다.");
	document.location = "p_list.jsp";
}