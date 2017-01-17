<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> Seminar hall registration </title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <script type="text/javascript" src="script.js"> </script>
 </head>

 <body>
 <h2> Seminar hall Registration </h2>
  <form name="a" method="POST" action="seminar_home.jsp">
   <table class="form">
    <tr valign=top>
     <td class="title"> Date </td>
     <td class="content">
      <% SimpleDateFormat sdf = new SimpleDateFormat("dd EEE");
      String[] s = new String[15];
      for(int i = 0; i < 5; i+=1)
      {
       s[i] = new String(sdf.format(new Date().getTime()+ i*24*60*60*1000));
      }
      for(int i = 0;i < 5; i+=1)
      {%>

         <input type="button" id="day<%=i+1%>" class="button" value='<%=s[i]%>'> 

      <%}%>
     </td>
    </tr>

    <tr valign=top>
     <td class="title"> Hall </th>
     <td class="content">
      <select> 
       <option value="cse">  CSE </option>
       <option value="ece">  ECE </option>
       <option value="eee">  EEE </option>
       <option value="it">   IT </option>
       <option value="ice">  ICE </option>
       <option value="mech"> MECH </option>
       <option value="mba">  MBA </option>
      </select>
     </td>
    </tr>

    <tr valign=top>
     <td class="content" colspan=2>
      <table class="status" >
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
        </tr>
       </thead>

       <tbody class="status" id="status">
       </tbody>
      </table>
     </td>
    </tr>

    <tr valign=top>
     <td class="title"> Class </td>
     <td class="contents">
      <div id="classes"> </div>
     </td>
    </tr>		     

    <tr valign=top>
     <td class="submit" colspan=2>
      <input class="submit" type="submit" value="Register" >
     </td>
    </tr>
   </table>
  </form> 
 </body>
</html>

