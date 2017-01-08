<%@page import="java.util.*,java.text.SimpleDateFormat"%>
<html>
<head>
<style>
.button {
    background-color: #FFFFFF;
    border: none;
    width: 20px;
    color: blue;
    padding: 5px 18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
	border-radius:5px;
}
.button:hover 	
{
	background-color:yellow;
}
</style>
  <script type="text/javascript">
  function selectt(a)
  {
    var k=document.getElementById("datese");
	k.value= a;
  }
  </script>
  </head>
<body>
<form name="a" method="" action="/Ganesh/hello1.jsp">
<h2>
<center> <font face=Helvetica> SEMINAR HALL </font> </center>
</h2>
<select> value="select"> -- SELECT --</option>
<option value="cse"> CSE </option>
<option value="ece"> ECE </option>
<option value="eee"> EEE </option>
<option value="mech"> MECH </option>
<option value="ice"> ICE </option>
<option value="it"> IT </option>
<option value="mba"> MBA </option>
<option value="civil"> CIVIL </option>
</select>
<br>
<h2> Date </h2>
<% SimpleDateFormat sdf = new SimpleDateFormat("dd");
String s = new String(sdf.format(new Date()));
String s1 = new String(sdf.format(new Date().getTime()+ 24*60*60*1000));
String s2 = new String(sdf.format(new Date().getTime()+ 2*24*60*60*1000));
String s3 = new String(sdf.format(new Date().getTime()+ 3*24*60*60*1000));
String s4 = new String(sdf.format(new Date().getTime()+ 4*24*60*60*1000));
String s5 = new String(sdf.format(new Date().getTime()+ 5*24*60*60*1000));
String s6 = new String(sdf.format(new Date().getTime()+ 6*24*60*60*1000));%>
<input type="text" id="datese" name="abc">
<input type="button" id="today" class="button" value="<%=s%>" onclick="selectt('<%=s%>')">
<input type="button" id="today" class="button" value="<%=s1%>" onclick="selectt('<%=s1%>')">
<input type="button" id="today" class="button" value="<%=s2%>" onclick="selectt('<%=s2%>')">
<input type="button" id="today" class="button" value="<%=s3%>" onclick="selectt('<%=s3%>')">
<input type="button" id="today" class="button" value="<%=s4%>" onclick="selectt('<%=s4%>')">
<input type="button" id="today" class="button" value="<%=s5%>" onclick="selectt('<%=s5%>')">
<input type="button" id="today" class="button" value="<%=s6%>" onclick="selectt('<%=s6%>')">
<br>
<!--
<select>
<option value="dat"> <%=s%></option>
<option value="dat"> <%=s1%></option>
<option value="dat"> <%=s2%></option>
<option value="dat"> <%=s3%></option>
<option value="dat"> <%=s4%></option>
<option value="dat"> <%=s5%></option>
<option value="dat"> <%=s6%></option>
</select>
-->
<br>
<h2> Hour </h2>
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
</select>
<input type="submit" value="submit" >
</form> 
</body>
</html>