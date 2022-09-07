<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@page
	import="java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html><title>search request conform</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		String user="Attacker";
		int id = Integer.parseInt(request.getParameter("id"));
		String des=request.getParameter("textarea");
		String fname=request.getParameter("text");
		String key=request.getParameter("key");
		
   		try {
	   	
				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
				SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
	
				Date now = new Date();
				
				String strDate = sdfDate.format(now);
				String strTime = sdfTime.format(now);
				String dt=strDate+" "+strTime;
			
				//Content encryption
				String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
				Key key1 = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.ENCRYPT_MODE, key1);
				String e_content = new String(Base64.encode(des.getBytes()));
				
					//generating digital sign
				String filename="filename.txt";
				PrintStream p = new PrintStream(new FileOutputStream("C:/Tomcat 5.0/"+filename));  //E:/DataLineage/
				p.print(new String(des));
				
				MessageDigest md = MessageDigest.getInstance("SHA1");
				FileInputStream fis11 = new FileInputStream("C:/Tomcat 5.0/"+filename);        //E:/DataLineage/
				DigestInputStream dis1 = new DigestInputStream(fis11, md);
				BufferedInputStream bis1 = new BufferedInputStream(dis1);
	 
				//Read the bis so SHA1 is auto calculated at dis
				while (true)
				{
					int b1 = bis1.read();
					if (b1 == -1)
						break;
				}
	 
				BigInteger bi1 = new BigInteger(md.digest());
				String spl1 = bi1.toString();
				
				String h1 = bi1.toString(16);	
				
       		Statement st1 = connection.createStatement();
       		String query1 ="update a_documents set content='"+e_content+"',dsign='"+h1+"' where id="+id+" ";
	   		int x=st1.executeUpdate(query1);

			if(x>0)
			{
				String ip=request.getRemoteAddr();
				String host=request.getRemoteHost();
				String sql="insert into attackers(att_name,doc_id,fname,dt,ip,host)values('"+user+"','"+id+"','"+fname+"','"+dt+"','"+ip+"','"+host+"')";
				Statement st=connection.createStatement();
				int y=st.executeUpdate(sql);
				if(y>0)
				{
					String msg="Document Content Edited ";
					application.setAttribute("msg",msg);
					response.sendRedirect("attacker2.jsp?id="+id+"&key="+key+"");  
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