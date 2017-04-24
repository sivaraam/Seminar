<%@page import = "java.sql.*,java.util.*"%>
<%
String dat = request.getParameter("dat");
String month = request.getParameter("mnth");
String yr = request.getParameter("yr");
String hall = request.getParameter("hall");
String parsedDate = dat+"-"+month+"-"+yr;
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con = DriverManager.getConnection("jdbc:oracle:thin:seminar_hall_booking/seminar@localhost:1521:xe");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select staff_name , period from bookings b inner join staff_details s on s.staff_id = b.staff_id where dt = '"+parsedDate+"' and hall_number in (select hall_number from seminar_hall where branch='"+hall+"') order by period");
int period,i=1;
String s="<td><br />Status</td>";
while(rs.next()) {
    period = rs.getInt(2);
    for(;i<=8;i++) {
        if(i==period)
        {
            s+="<td> Booked by "+rs.getString(1)+"</td>";
            i++;
            break;
        }
        else
            s+="<td class=text><input TYPE=checkbox value="+i+" /><br />Book now</td>";
        if(i==4)
            s+="stop";
    }
    if(i==5)
	    s+="stop";
}
for(;i<=8;i++) {
    s+="<td class=text><input TYPE=checkbox value="+i+" /> <br />Book now</td>";
    if(i==4)
        s+="stop";
}
out.println(s);
%>


