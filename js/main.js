var curr_date = "date-1";
var curr_val = "cse";
var  month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
var hours = [];
var hallValue,dateValue;
var newDate = new Date();

function displaySchedule() {
	dateValue = $(document.getElementById(curr_date)).val();
	hallValue = $(document.getElementById(curr_hall)).val();
	$.post("jsp/display.jsp", { dat : dateValue.slice(0,2), mnth : month[newDate.getMonth()] , yr : newDate.getFullYear()-2000 , hall : hallValue } ,
	function(data,status){
		var index = data.indexOf("stop");
		var contents_table1 = data.slice(0,index);
		var contents_table2 = data.slice(index+4,-1);
		document.getElementById("status-table-1").rows[1].innerHTML = contents_table1;
		document.getElementById("status-table-2").rows[1].innerHTML = contents_table2;
		document.getElementById("button-container").style.display = "block";
		document.getElementById("status-table-container").style.display = "block";
		check();
	});
}

function check(){
	$(':checkbox').change(function () {
    if ($(this).prop("checked")) {
		hours.push($(this).val());
    }
	else {
		for(var i = 0;i < hours.length;i++) {
			if($(this).val()==hours[i]) {
				hours.splice(i,1);
				break;
			}
		}
	}
	});
}

function book(e) {
	dateValue = $(document.getElementById(curr_date)).val();
	hallValue = $(document.getElementById(curr_hall)).val();
	var h=hours.length;
	if(h==0) {
		confirm("Please select an hour");
	}
	else {
		var staff_id = prompt("Enter the your id:");
		for(var i = 0 ;i < h ; i++) {
		    $.post("jsp/book.jsp", { arr: hours[i], dat: dateValue.slice(0,2),
			mnth: month[newDate.getMonth()] , yr: newDate.getFullYear()-2000 , hall: hallValue,
			sid: staff_id} ,
			function(data,status){
				alert(data);
			});
		}
		alert("ENd");
	}
	hours=[];
 }
 
function date_change(e) {
	curr_date = e.target.getAttribute("id");
}

function hall_change(e) {
	curr_hall = e.target.getAttribute("id");
	displaySchedule();

}

function registerEvents() {
	document.getElementById("halls-select").addEventListener("change",hall_change,false);
	for(var i = 1;i <= 5; i++) {
		document.getElementById("date-"+i).addEventListener("change",date_change,false);
		document.getElementById("hall-"+i).addEventListener("change",hall_change,false);
	}	
	document.getElementById("hall-6").addEventListener("change",hall_change,false);
	document.getElementById("hall-7").addEventListener("change",hall_change,false);
	document.getElementById("book").addEventListener("click",book,false);
}

function loadDates() {
	for (var i = 1; i <= 5; i++) {
		day_index = (newDate.getDay() + (i-1)) % 7;
		curr_date = (newDate.getDate() + (i-1)) + " " + day[day_index];
		document.getElementById("date-"+i).setAttribute("value",curr_date);
		document.getElementById("date-label-"+i).innerHTML = curr_date;
	}
}

function parseDate(date) {
	if(date < 10)
	{
		date = '0'+date;
	}
	return date;
}
