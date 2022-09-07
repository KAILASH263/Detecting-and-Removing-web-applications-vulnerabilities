<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>

<html><title>block owners</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		String oname =request.getParameter("oname");
		
   		try {
	   	
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
			
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt=strDate+ " "+strTime;

			String action="Blocked";
				
         	String query1 ="update sql_injection set action='"+action+"' where username='"+oname+"' ";
			Statement st1 = connection.createStatement();
	   		int x=st1.executeUpdate(query1);
			
			String query ="update owner set acc_type='"+action+"' where username='"+oname+"' ";
			Statement st = connection.createStatement();
	   		int y=st.executeUpdate(query);
			
			String query2 ="insert into blockedowners(username,dt)values('"+oname+"','"+dt+"') ";
			Statement st2 = connection.createStatement();
	   		int z=st2.executeUpdate(query2);
			
			if((x>0)&&(y>0)&&(z>0))
			{
				
				response.sendRedirect("allsql_injections.jsp");  
			}
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e);
   		}
   		
	%>
</body>
</html>