<%@page import = "java.sql.*,java.util.*"%>
<%
	String hall = request.getParameter("hall");
	String hours = request.getParameter("arr");
	String dat = request.getParameter("dat");
	String month = request.getParameter("mnth");
	String yr = request.getParameter("yr");
	String staff_id = request.getParameter("sid");
	String parsedDate = dat+"-"+month+"-"+yr;
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:seminar_hall_booking/seminar@localhost:1521:xe");	
	Statement stmt = con.createStatement();	
	stmt.executeUpdate("insert into chumma values('"+hours+"','"+hall+"','"+parsedDate+"')");
	out.println("Booked");
%>


