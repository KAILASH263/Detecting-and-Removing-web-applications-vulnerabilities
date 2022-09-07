<title>Insert Data</title>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
						 
		String user=(String)application.getAttribute("user");
		String type1=request.getParameter("type1");
		String status="Generate Secret Key";
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt=strDate+ " "+strTime;
					         		
		try
		{	
				if(type1.equalsIgnoreCase("req"))
				{		 
			 			String query1="select * from sk_request  where username='"+user+"'"; 
						Statement st1=connection.createStatement();
						ResultSet rs1=st1.executeQuery(query1);
						if ( rs1.next() )
						{
					   		
							String msg="Secret Key Request Already Sent";
							application.setAttribute("msg",msg);
							response.sendRedirect("u_skrequest.jsp");
					  	}
					   else
					   {
							PreparedStatement ps=connection.prepareStatement("insert into sk_request(username,sk,dt) values(?,?,?)");
							ps.setString(1,user);
							ps.setString(2,status);
							ps.setString(3,dt);	
							
							int x=ps.executeUpdate();
							if(x>0)
							{
								String msg="Secret Key Request is Sent";
								application.setAttribute("msg",msg);
								response.sendRedirect("u_skrequest.jsp");
					  		}
			  			}
				}
				else if(type1.equalsIgnoreCase("res"))
				{		 
			 			String pass=request.getParameter("pass");
						String sql="select * from user where (username='"+user+"' and password='"+pass+"')";
						Statement st=connection.createStatement();
						ResultSet rs=st.executeQuery(sql);
						if(rs.next())
						{
							String query1="select * from sk_request  where username='"+user+"'"; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(query1);
							if ( rs1.next())
							{
								String sk=rs1.getString(3);
								if(sk.equalsIgnoreCase("Generate Secret Key"))
								{
									String msg="Secret Key is not Generated Please wait";
									application.setAttribute("msg",msg);
									response.sendRedirect("u_skresponse.jsp?sk="+sk+"");
								}
								else
								{
									String msg="Your Secret Key is:";
									application.setAttribute("msg",msg);
									response.sendRedirect("u_skresponse.jsp?sk="+sk+"");
								}
							}
							else
							{
								String msg="Sorry you are not requested Secret Key <br> Please Send Request";
								application.setAttribute("msg",msg);
								response.sendRedirect("u_skrequest.jsp");
							
							}
						}
						else
						{
							String msg="Sorry..!! Wrong Password <br> Please Enter Correct Password ";
							application.setAttribute("msg",msg);
							response.sendRedirect("u_skresponse.jsp");
						
						}
				}
				else{}
		connection.close();
		}
				
					catch (Exception e) 
					{
						
						out.print(e);
					}
				%>
