<%@ include file="connect.jsp" %>
<html><title>unblock users</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		String uname =request.getParameter("uname");
   		try {
	   	
         	String query1 ="update blockedusers set attempts=0,status='Block' where username='"+uname+"' ";
			Statement st1 = connection.createStatement();
	   		st1.executeUpdate (query1);
			
			String query ="update user set acc_status='Active' where username='"+uname+"' ";
			Statement st = connection.createStatement();
	   		st.executeUpdate (query);
			
			String query2 ="update u_unblockreq set status='Unblocked' where username='"+uname+"' ";
			Statement st2 = connection.createStatement();
	   		st2.executeUpdate (query2);
			
			response.sendRedirect("allusers_unblockreq.jsp");  
			
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		
	%>
</body>
</html>