<%@page import="java.util.*,java.text.SimpleDateFormat"%>
<html>
<head>
<style>
table
{
	border:1px solid black;
	background-color:lightgrey;
	padding:10px;
	border-spacing:0px;
	width:50%;
	border-collapse:collapse;
	text-align:center;
}
th
{
	width:10px;	
}
.button {
    background-color: #FFFFFF;
    border: none;
    width: 20px;
    color: blue;
    padding: 5px 35px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
	border-radius:5px;
	white-space:normal;
}
.button:hover 	
{
	background-color:lightgrey;
}
</style>
  <script type="text/javascript">
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
  </script>
  </head>
<body>
<form name="a" method="" action="/Ganesh/seminar_home.jsp">
<h2>
<center> <font face=Helvetica> SEMINAR HALL </font> </center>
</h2><br><br><br>
<center>
<select> value="select"> -- SELECT --</option>
<option value="cse"> CSE </option>
<option value="ece"> ECE </option>
<option value="eee"> EEE </option>
<option value="mech"> MECH </option>
<option value="ice"> ICE </option>
<option value="it"> IT </option>
<option value="mba"> MBA </option>
</select>
<br>
<h2> Date </h2>
<% SimpleDateFormat sdf = new SimpleDateFormat("dd EEE");
String[] s = new String[15];
for(int i = 0; i < 7; i+=1)
{
	s[i] = new String(sdf.format(new Date().getTime()+ i*24*60*60*1000));
}
for(int i = 0;i < 7; i+=1)
{%>
    <input type="button" id="day<%=i+1%>" class="button" value='<%=s[i]%>'>	
<%}%>
<br>
<div style="background-color:lightgrey;padding:10px;">
<table border=100 width=20px>
<%for(int i = 0;i<8;i+=1)
{%>
<col width="100">
<%}%>
<thead>
<tr>
<th> I </th>
<th> II </th>
<th> III </th>
<th> IV </th>
<th> V </th>
<th> VI </th>
<th> VII </th>
<th> VIII </th>
</tr></thead>
<tbody>
<tr rowspan="2">
<td rowspan="2">a</td>
<td rowspan="2"></td>
<td rowspan="2"></td>
<td rowspan="2"></td>
<td rowspan="2"></td>
<td rowspan="2"></td>
<td rowspan="2"></td>
<td rowspan="2"></td>
</tr>
</table>
</div>
<!--
<h2> Period </h2>
<select>
<option value="sel"> --- </option>
<option value="one"> I </option>
<option value="two"> II </option>
<option value="three"> III </option>
<option value="four"> IV </option>
<option value="five"> V </option>
<option value="six"> VI </option>
<option value="seven"> VII </option>
<option value="eight"> VIII </option>
</select20
-->
<br><br><br><br>
<input type="submit" value="submit" style="font-size:20px" >
</center>
</form> 
</body>
</html>