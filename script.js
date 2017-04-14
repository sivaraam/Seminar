var curr_highlight = "day1";

function highlight(e)
{
	document.getElementById(curr_highlight).setAttribute("style","background-color:none");
	e.target.setAttribute( "style", "background-color:lightgrey" );
	curr_highlight = e.target.getAttribute("id");
}

function registerEvents()
{
	for ( var number = 1; number <= 5; number += 1 )
	{
		document.getElementById("day"+number).addEventListener("click",highlight,false);
	}
}
function loadDates() {
   	    var i,text;
	    var day = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
	    var newDate = new Date();  
	    text = "";
	    for (i = 1; i <= 5; i++) {
	   	  text += "<input type=\"button\" id=\"day"+i+"\" class=\"content button\" value = \""+(newDate.getDate()+i-1)+" "+day[(newDate.getDay()+(i-1))%7]+"\"/>";
	    }
	    document.getElementById("date").innerHTML = text;
		registerEvents();
    }
//window.addEventListener("load", registerEvents, false );
