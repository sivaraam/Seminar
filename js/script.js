var curr_highlight = "day1";

function loadDates() {
    var i,text;
	var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
	var newDate = new Date();
	text = "";
	for (i = 1; i <= 5; i++) {
		text += "<input type=\"button\" id=\"day"+i+"\" class=\"form-item date-button\" value = \""+(newDate.getDate()+i-1)+" "+day[(newDate.getDay()+(i-1))%7]+"\"/>";
	}
	document.getElementById("date-buttons").innerHTML = text;
}
