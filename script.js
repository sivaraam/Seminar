var curr_highlight = "day1";

function highlight(e)
{
	document.getElementById(curr_highlight).setAttribute("style","background-color:none");
	e.target.setAttribute( "style", "background-color:lightgrey" );
	curr_highlight = e.target.getAttribute("id");
}

function registerEvents()
{
	for ( var number = 1; number <= 7; number += 1 )
	{
		document.getElementById("day"+number).addEventListener("click",highlight,false);
	}
}

window.addEventListener( "load", registerEvents, false );
