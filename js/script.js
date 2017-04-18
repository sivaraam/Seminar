var curr_highlight = "day1";
var  month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
var newDate = new Date();
function highlight(e)
{
	document.getElementById(curr_highlight).setAttribute("style","background-color:none");
	e.target.setAttribute( "style", "background-color:lightgrey" );
	curr_highlight = e.target.getAttribute("id");
	callJSP();
}

function callJSP() {
	var value = $(document.getElementById(curr_highlight)).val();
	var hallValue = $("#hall").val();
	$.post("jsp/seminar.jsp", { dat : value.slice(0,2), mnth : month[newDate.getMonth()] , yr : newDate.getFullYear()-2000 , hall : hallValue } ,
	function(data,status){
		document.getElementById("status-table").rows[1].innerHTML=data;
		$("table").show();
	});
}

function call(e) {
	callJSP();
}

function registerEvents() {
	document.getElementById("hall").addEventListener("change",call,false);
	$("table").hide();
}

function loadDates() {
    var i,text;
	text = "";
	for (i = 1; i <= 5; i++) {
    day_index = (newDate.getDay() + (i-1)) % 7;
    curr_date = (newDate.getDate() + (i-1)) + " " + day[day_index];
		text += "<input type=\"radio\" name=\"date\" id=\"day"+i+"\" class=\"\" value = \""+curr_date+"\">"+curr_date+"</input>";
	}
	document.getElementById("date-buttons").innerHTML = text;
}

function parseDate(date) {
	if(date < 10)
	{
		date = '0'+date;
	}
	return date;
}
