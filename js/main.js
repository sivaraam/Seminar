curr_date = "date-1";
curr_val = "cse";
months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
hours = [];
newDate = new Date();

function displaySchedule() {
	getValues();
	$.post("jsp/display.jsp", { date : dateValue.slice(0,2), month : months[newDate.getMonth()] , 
        year : newDate.getFullYear()-2000 , hall : hallValue } , function(data,status){
			var index = data.indexOf("stop");
			var contents_table1 = data.slice(0,index);
			var contents_table2 = data.slice(index+4,-1);
			document.getElementById("status-table-1").rows[1].innerHTML = contents_table1;
			document.getElementById("status-table-2").rows[1].innerHTML = contents_table2;
			showTableAndButton();
			check();
	});
}

function book(e) {
	getValues();
	var total_checked=hours.length;
	if(total_checked == 0) {
		confirm("Please select an hour");
	}
	else {
		var staff_id = prompt("Enter the your id:");
		for(var i = 0 ;i < total_checked ; i++) {
		    $.post("jsp/book.jsp", { period: hours[i], date: dateValue.slice(0,2),
                month: months[newDate.getMonth()] , year: newDate.getFullYear()-2000 , hall: hallValue,
                staff_id: staff_id} ,function(data,status) {
                    alert(data);
			});
		}
		alert("ENd");
	}
	hours=[];
}
 
function showTableAndButton() {
    document.getElementById("button-container").style.display = "block";
    document.getElementById("status-table-container").style.display = "block";
}

function getValues() {
	dateValue = $(document.getElementById(curr_date)).val();
	hallValue = $(document.getElementById(curr_hall)).val();
}

function check() {
	$(':checkbox').change(function () {
    if ($(this).prop("checked")) {
		hours.push($(this).val());
    }
	else {
		for(var i = 0;i < hours.length;i++) {
			if($(this).val() == hours[i]) {
				hours.splice(i,1);
				break;
			}
		}
	}
	});
}

function date_change(e) {
	curr_date = e.target.getAttribute("id");
}

function hall_change(e) {
	curr_hall = e.target.getAttribute("id");
	displaySchedule();

}

function registerEvents() {
	addListener("halls-select","change",hall_change);
	for(var i = 1;i <= 5; i++) {
		addListener("date-"+i,"change",date_change);
		addListener("hall-"+i,"change",hall_change);
	}	
	addListener("hall-6","change",hall_change);
	addListener("hall-7","change",hall_change);
	addListener("book","click",book);
}

function loadDates() {
	for (var i = 1; i <= 5; i++) {
		day_index = (newDate.getDay() + (i-1)) % 7;
		curr_date = (newDate.getDate() + (i-1)) + " " + days[day_index];
		document.getElementById("date-"+i).setAttribute("value",curr_date);
		document.getElementById("date-label-"+i).innerHTML = curr_date;
	}
}

function addListener(elementName,eventName,callback) {
	document.getElementById(elementName).addEventListener(eventName,callback,false);
}

function parseDate(date) {
	if(date < 10) {
		date = '0'+date;
	}
	return date;
}
