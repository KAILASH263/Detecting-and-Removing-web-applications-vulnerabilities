<%@ include file="connect.jsp" %>
<html><title>block owners</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		String oname =request.getParameter("oname");
		
   		try {
	   	
		
				
         	String query1 ="update sql_injection set action='Block' where username='"+oname+"' ";
			Statement st1 = connection.createStatement();
	   		st1.executeUpdate (query1);
			
			String query ="update owner set acc_type='Active' where username='"+oname+"' ";
			Statement st = connection.createStatement();
	   		st.executeUpdate (query);
			
			String query2 ="update unblockreq set status='Unblocked' where username='"+oname+"' ";
			Statement st2 = connection.createStatement();
	   		st2.executeUpdate (query2);
			
			response.sendRedirect("allunblockreq.jsp");  
			
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		
	%>
</body>
</html>