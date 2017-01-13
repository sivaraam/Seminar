<%@page import="java.util.*,java.text.SimpleDateFormat"%>
<html>
<head>
<style>
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
.sub
{
	font-size:20px;
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
</select><br><br><br><br>
<input type="submit" value="submit" class="sub" >
</center>
</form> 
</body>
</html>