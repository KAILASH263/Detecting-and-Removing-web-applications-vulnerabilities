 <%@page import="java.util.*,java.lang.*,java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<html><title>block owners</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		String oname =request.getParameter("oname");
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt=strDate+" "+strTime;
		
   		try {
	   		String type=request.getParameter("type");
			String sql="select * from unblockreq where username='"+oname+"' and status='Unblock'";
			Statement st= connection.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
					String msg="Unblock Request Already sent <br> Please Wait...";
					application.setAttribute("msg",msg);
					
					if(type.equalsIgnoreCase("query"))
					{
						response.sendRedirect("o_executequeries.jsp");  
					}
					else if(type.equalsIgnoreCase("login"))
					{
						response.sendRedirect("o_unblock.jsp");  
					}	
			}
			else
			{	
				String status="Unblock";
				String query1 ="insert into unblockreq (username,dt,status)values('"+oname+"','"+dt+"','"+status+"')";
				Statement st1 = connection.createStatement();
				int x=st1.executeUpdate (query1);
				if(x>0)
				{
					String msg="Unblock Request has been sent";
					application.setAttribute("msg",msg);
					if(type.equalsIgnoreCase("query"))
					{
						response.sendRedirect("o_executequeries.jsp");  
					}
					else if(type.equalsIgnoreCase("login"))
					{
						response.sendRedirect("o_unblock.jsp");  
					} 
				}
			}
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		
	%>
</body>
</html>