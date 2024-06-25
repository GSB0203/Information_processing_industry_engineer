let ccno;

function addCheck() {
	
}

function res() {
	
}

function get(c_name) {
	document.frm.c_no.value = c_name;
	ccno = c_name;
}

function make(class_name) {
	if(ccno < 20000) document.frm.tuition.value = class_name * 1000;
	else document.frm.tuition.value = class_name * 1000 / 2;
}