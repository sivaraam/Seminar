var curr_highlight = "day1";
var  month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
var hours = [];
var hallValue;
var newDate = new Date();
function callJSP() {
	var value = $(document.getElementById(curr_highlight)).val();
	hallValue = $("#halls").val();
	$.post("jsp/seminar.jsp", { dat : value.slice(0,2), mnth : month[newDate.getMonth()] , yr : newDate.getFullYear()-2000 , hall : hallValue } ,
	function(data,status){
		document.getElementById("status-table").rows[1].innerHTML=data;
		$("table").show();
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
	callJSP();
}

function hall_change(e) {
	callJSP();
}

function registerEvents() {
	
	$("table").hide();
	document.getElementById("halls").addEventListener("change",hall_change,false);
	for(var i = 1;i <= 5; i++) {
		document.getElementById("day"+i).addEventListener("change",date_change,false);
	}
	document.getElementById("Book").addEventListener("click",book,false);
}

function loadDates() {
	date_buttons_html = "";
	for (var i = 1; i <= 5; i++) {
		day_index = (newDate.getDay() + (i-1)) % 7;
		curr_date = (newDate.getDate() + (i-1)) + " " + day[day_index];
		date_buttons_html += "<input type=\"radio\" name=\"date\" id=\"day"+i+"\" class=\"\" value = \""+curr_date+"\">"+curr_date+"</input>";
	}
	document.getElementById("date-buttons").innerHTML = date_buttons_html;
}

function parseDate(date) {
	if(date < 10)
	{
		date = '0'+date;
	}
	return date;
}
