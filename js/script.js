var curr_highlight = "day1";

function loadDates() {
    var i,text;
	var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
	var newDate = new Date();
	text = "";
	for (i = 1; i <= 5; i++) {
    day_index = (newDate.getDay() + (i-1)) % 7;
    curr_date = (newDate.getDate() + (i-1)) + " " + day[day_index];
		text += "<input type=\"radio\" name=\"date\" id=\"day"+i+"\" class=\"\" value = \""+curr_date+"\">"+curr_date+"</input>";
	}
	document.getElementById("date-buttons").innerHTML = text;
}
