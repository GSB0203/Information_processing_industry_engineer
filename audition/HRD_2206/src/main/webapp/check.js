function addCheck() {
	if(frm.id.value.length==0) {
		alert("참가번호가 입력되지 않았습니다!");
		frm.id.focus();
		return false;
	}
	else if(frm.name.value.length==0) {
		alert("참가명이 입력되지 않았습니다!");
		frm.name.focus();
		return false;
	}
	else if(frm.year.value.length==0) {
		alert("생년월일 입력되지 않았습니다!");
		frm.year.focus();
		return false;
		}
	else if(frm.month.value.length==0) {
		alert("생년월일 입력되지 않았습니다!");
		frm.month.focus();
		return false;
		}
		
	else if(frm.day.value.length==0) {
		alert("생년월일 입력되지 않았습니다!");
		frm.day.focus();
		return false;
		}
		
	else if(frm.gender[0].checked==false && 
			frm.gender[1].checked==false) {
		alert("성별이 선택되지 않았습니다!");
		frm.gender.focus();
		return false;
	}
	else if(frm.talent.value==0) {
		alert("특기가 선택되지 않았습니다!");
		frm.talent.focus();
		return false;
	}
	else if(frm.agency.value.length==0) {
		alert("소속사가 입력되지 않았습니다.");
		frm.agency.focus();
		return false;
	}
	else 
		alert("참가신청이 정상적으로 등록되었습니다!");
		document.frm.submit();
		
	return true;
}

function res() {
	alert("정보를 지우고 다시 입력합니다!");
	document.frm.reset();
}