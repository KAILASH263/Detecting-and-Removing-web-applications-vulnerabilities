<title>Insert Data</title>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
						 
		String user=(String)application.getAttribute("user");
		String sk=request.getParameter("sk");
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt=strDate+" "+strTime;
					         		
	try
	{	
		String sql6="select acc_status from user where username='"+user+"' and acc_status='Active'";
		Statement st6=connection.createStatement();
		ResultSet rs6=st6.executeQuery(sql6);
		if ( rs6.next() )
		{
					 
		String sql="select * from sk_request  where username='"+user+"' and sk='"+sk+"'"; 
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(sql);
		if ( rs.next() )
		{
			application.setAttribute("sk",sk);
			response.sendRedirect("u_searchdocs.jsp");
		}
		
	   else
	   {
			PreparedStatement ps=connection.prepareStatement("insert into wrong_sk(username,sk,dt) values(?,?,?)");
			ps.setString(1,user);
			ps.setString(2,sk);
			ps.setString(3,dt);	
			
			int x=ps.executeUpdate();
			if(x>0)
			{
				String sql1="select * from blockedusers where username='"+user+"' and status='block'";
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(sql1);
				if(rs1.next())
				{
					int attempts=rs1.getInt(3);
											
					if(attempts<2)
					{
						String sql2="update blockedusers set attempts=attempts+1 where username='"+user+"'";
						Statement stmt2 = connection.createStatement();
						int p=stmt2.executeUpdate(sql2);
						if(p>0)
						{
							String msg="Secret Key Mismatched <br> Please Enter Correct Secret Key";
							application.setAttribute("msg",msg);
							response.sendRedirect("u_skverify.jsp?status=Block");
						}
					}
					else if(attempts<3)
					{
						String sql3="update blockedusers set status='Blocked',attempts=attempts+1 where username='"+user+"' and status!='Blocked'";
						Statement stmt3 = connection.createStatement();
						int y=stmt3.executeUpdate(sql3);
						if(y>0)
						{
							String sql4="update user set acc_status='Blocked' where username='"+user+"'";
							Statement stmt4 = connection.createStatement();
							stmt4.executeUpdate(sql4);
							
							String msg="Secret Key Mismatched <br> 3 times wrong secret key entered  ";
							application.setAttribute("msg",msg);
							response.sendRedirect("u_skverify.jsp?status=Blocked");
						}
					}
				}
			
				else
				{
					
					String sql5="insert into blockedusers(username,attempts,status)values('"+user+"',1,'Block')";
					Statement st5=connection.createStatement();
					int z=st5.executeUpdate(sql5);
					if(z>0)
					{
						String msg="Secret Key Mismatched <br> Please Enter Correct Secret Key";
						application.setAttribute("msg",msg);
						response.sendRedirect("u_skverify.jsp?status=Block");
					}
				}
			}
		}
		}
		else
		{
			String msg="Your Account is Blocked";
			application.setAttribute("msg",msg);
			response.sendRedirect("u_skverify.jsp?status=Blocked");
		}
				
		connection.close();
		}
				
					catch (Exception e) 
					{
						
						out.print(e);
					}
				%>
