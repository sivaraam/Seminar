var curr_highlight = "date-1";
var  month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
var hours = [];
var hallValue;
var curr_val;
var newDate = new Date();
function callJSP() {
	var value = $(document.getElementById(curr_highlight)).val();
	hallValue = $(document.getElementById(curr_hall)).val();
	alert(value + hallValue);
	$.post("jsp/seminar.jsp", { dat : value.slice(0,2), mnth : month[newDate.getMonth()] , yr : newDate.getFullYear()-2000 , hall : hallValue } ,
	function(data,status){
		alert(data);
		var index = data.indexOf("stop");
		var str1 = data.slice(0,index);
		var str2 = data.slice(index+4,-1);
		alert(str2);
		document.getElementById("status-table-1").rows[1].innerHTML=str1;
		document.getElementById("status-table-2").rows[1].innerHTML=str2;
		document.getElementById("button-container").style.display = "block";
		document.getElementById("status-table-container").style.display = "block";
		//$("table").show();
		check();
	});
}
function check(){
	$(':checkbox').change(function () {
    if ($(this).prop("checked")) {
		hours.push($(this).val());
    }
	});
}
function book(e)
 {
	hallValue = $("#halls").val();
	var val=$(document.getElementById(curr_highlight)).val();
	var h=hours.length;
	if(h==0) {
		alert("Please select an hour");
	}
	else {
		alert(hours.length);
		for ( var k = 0 ; k < h ; k++) {
		$.post("jsp/sem.jsp",{ arr : hours[k],hall:hallValue,dat:val.slice(0,2),mnth:month[newDate.getMonth()],yr: newDate.getFullYear()-2000 },
			function(data,status) { 
			alert(data);
			});
		}
	}
 }
function date_change(e) {
	curr_highlight = e.target.getAttribute("id");
}

function hall_change(e) {
	curr_hall = e.target.getAttribute("id");
	alert($(document.getElementById(curr_hall)).val());
	alert("hall_change");
	callJSP();

}

function registerEvents() {
	document.getElementById("halls-select").addEventListener("change",hall_change,false);
	alert("sfdsdfa");
	for(var i = 1;i <= 5; i++) {
		document.getElementById("date-"+i).addEventListener("change",date_change,false);
		document.getElementById("hall-"+i).addEventListener("change",hall_change,false);
	}	
	//document.getElementById("book").addEventListener("click",book,false);
}

function loadDates() {
	for (var i = 1; i <= 5; i++) {
		day_index = (newDate.getDay() + (i-1)) % 7;
		curr_date = (newDate.getDate() + (i-1)) + " " + day[day_index];
		document.getElementById("date-"+i).setAttribute("value",curr_date);
		document.getElementById("date-label-"+i).innerHTML = curr_date;
	}
	registerEvents();
}

function parseDate(date) {
	if(date < 10)
	{
		date = '0'+date;
	}
	return date;
}
