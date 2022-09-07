<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<title>document  recovery</title>

<%
	try{
			String owner=(String)application.getAttribute("owner");
			String id=request.getParameter("id");
			String dsign="",content="";
			
			String s1="",s2="",s3="",s4="",s5="",s6="";
			
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
			
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt=strDate+" "+strTime;
			
			String sql3="select content,dsign from documents where id='"+id+"'";
			Statement st3=connection.createStatement();
			ResultSet rs3=st3.executeQuery(sql3);
			if(rs3.next())
			{
				 content=rs3.getString(1);
				 dsign=rs3.getString(2);
			}
			
			String sql1="select dname,fname,dsign from a_documents where id='"+id+"'";
			Statement st1=connection.createStatement();
			ResultSet rs=st1.executeQuery(sql1);
			if(rs.next())
			{
				s1=rs.getString(1);
				s2=rs.getString(2);
				s3=rs.getString(3);
				
				String sql2="insert into recovery (owner,doc_id,dname,fname,old_dsign,new_dsign,dt)values('"+owner+"','"+id+"','"+s1+"','"+s2+"','"+s3+"','"+dsign+"','"+dt+"')";
				Statement st2=connection.createStatement();
				st2.executeUpdate(sql2);
			}
		
			String sql="update a_documents set content='"+content+"',dsign='"+dsign+"' where id='"+id+"'";
			Statement st=connection.createStatement();
			int x=st.executeUpdate(sql);
			if(x>0)
			{
				String msg="Document Recovered Successfully";
				application.setAttribute("msg",msg);
				response.sendRedirect("o_recovery.jsp?id="+id+"");
			}
			else
			{
				String msg="Document Not Recovered";
				application.setAttribute("msg",msg);
				response.sendRedirect("o_recovery.jsp?id="+id+"");
			}
	
		
		connection.close();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
