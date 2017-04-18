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
int count=1,i=1;
Integer period;
HashMap <Integer,String> map = new HashMap<Integer,String>();
String name;
out.println("<td> Status </td>");
while(rs.next()){
	period = rs.getInt(2);
	map.put(period,rs.getString(1));
	for(;i<=8;i++)
	{
		if(i==period)
		{
			out.println("<td>"+map.get(period)+"</td>");
			i++;
			break;
		}
		else
			out.println("<td>Available</td>");
	}
}
for(;i<=8;i++)
	out.println("<td>Available</td>");
%>



