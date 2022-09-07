<%@ page import="java.sql.*,java.util.Random" %>
<%@ page import="java.sql.*,java.util.Random,java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException, java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>
<html><title>search request conform</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		int id = Integer.parseInt(request.getParameter("id"));
		
   		try {
	   	
	   		
			KeyPairGenerator kg=KeyPairGenerator.getInstance("RSA");
			Cipher encoder=Cipher.getInstance("RSA");
			KeyPair kp=kg.generateKeyPair();
			Key pubKey=kp.getPublic();
			byte[] pub=pubKey.getEncoded();
			String sk=String.valueOf(pub);
				
       		Statement st1 = connection.createStatement();
       		String query1 ="update sk_request set sk='"+sk+"' where id="+id+" ";
	   		st1.executeUpdate (query1);
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		response.sendRedirect("allskrequests.jsp");  
	%>
</body>
</html>