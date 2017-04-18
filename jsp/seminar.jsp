<%@page import = "java.sql.*,java.util.*"%>
<html>
<head>
	<title>Seminar</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con = DriverManager.getConnection("jdbc:oracle:thin:seminar_hall_booking/seminar@localhost:1521:xe");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("Select * from seminar_hall");
while(rs.next()){
out.println(rs.getString(1));	
}
con.close();%>
</body>
</html>