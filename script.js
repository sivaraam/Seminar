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
function callJSP()
{
	var value = $(document.getElementById(curr_highlight)).val();
	var hallValue = $("#hall").val();
	$.post("seminar.jsp", { dat : value.slice(0,2), mnth : month[newDate.getMonth()] , yr : newDate.getFullYear()-2000 , hall : hallValue } , 
	function(data,status){
		document.getElementById("tab").rows[1].innerHTML=data;
		$("table").show();
	});	
}
/*function callJSP()
{
	var value = $(document.getElementById(curr_highlight)).val();
	var hallValue = $("#hall").val();
	$.ajax({
		type: "POST",
        url: "seminar",
        data: { dat : value.slice(0,2), mnth : month[newDate.getMonth()] , yr : newDate.getFullYear()-2000 , hall : hallValue },
        success:function(result){
            document.getElementById("tab").rows[1].innerHTML=data;
		$("table").show();
		}
	});	
}*/
function call(e)
{
	callJSP();
}
function registerEvents()
{
	for ( var number = 1; number <= 5; number += 1 )
	{
		document.getElementById("day"+number).addEventListener("click",highlight,false);
	}
	document.getElementById("day1").setAttribute("style","background-color:lightgrey");
	document.getElementById("hall").addEventListener("change",call,false);
	$("table").hide();	
}
function loadDates() {
    var i,text;
	text = "";
	for (i = 1; i <= 5; i++) {
		text += "<input type=\"button\" id=\"day"+i+"\" class=\"content button\" value = \""+parseDate((newDate.getDate()+i-1))+" "+day[(newDate.getDay()+(i-1))%7]+"\"/>";
	}
	document.getElementById("date").innerHTML = text;
	registerEvents();
}
function parseDate(date)
{
	if(date < 10)
	{
		date = '0'+date;
	}
	return date;
}
