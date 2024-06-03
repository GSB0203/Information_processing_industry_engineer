function addCheck() {
   if(frm.id.value.length == 0) {
      alert("참가번호가 입력되지 않았습니다!");
      frm.id.focus();
      return false;
   }
   if(frm.name.value.length == 0) {
      alert("참가자명이 입력되지 않았습니다!");
      frm.name.focus();
      return false;
   }
   if(frm.birth1.value.length == 0 && frm.birth2.value.length == 0 && frm.birth3.value.length == 0) {
      alert("생년월일이 입력되지 않았습니다!");
      frm.birth1.focus();
      return false;
   }
   if(frm.gender.value.length == 0) {
      alert("성별이 선택되지 않았습니다!");
      return false;
   }
   if(frm.talent.value.length == 0) {
      alert("특기가 선택되지 않았습니다!");
      return false;
   }
   if(frm.agency.value.length == 0) {
      alert("소속사가 입력되지 않았습니다!");
      frm.agency.focus();
      return false;
   }
   else
   alert("참가신정이 정상적으로 등록되었습니다!");
   document.frm.submit();
   return true;
}

function res() {
   alert("정보를 지우고 처음부터 다시 입력합니다.");
   document.frm.reset();
}