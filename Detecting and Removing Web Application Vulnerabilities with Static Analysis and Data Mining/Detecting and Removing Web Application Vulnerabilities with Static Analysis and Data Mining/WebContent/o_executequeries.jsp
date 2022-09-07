<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>execute sql queries</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style3 {font-size: 14px}
.style4 {
	font-size: 15px;
	font-weight: bold;
}
.style7 {
	color: #FF0000;
	font-size: 16px;
	font-weight: bold;
}
.style8 {color: #FF6633}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1 class="style1">Detecting and Removing Web Application Vulnerabilities with Static Analysis and Data Mining</h1>
      </div>
    </div>
  </div>
  <div class="menu_nav">
    <div class="menu_nav_resize">
	<%String owner=(String)application.getAttribute("owner");%>
      <ul>
        <li><a href="ownermain.jsp">Home</a></li>
        <li><a href="#"><%=owner%></a></li>
        <li><a href="ownerlogin.jsp">logout</a></li>
      </ul>
    </div>
  </div>
 <!-- <div class="hbg">
    <div class="hbg_resize"> <img src="images/hbg_bg.jpg" width="970" height="215" alt="" /> </div>
  </div>-->
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Execute SQL Queries   </span></h2>
          <div class="clr"></div>
          <p align="justify">
 <%@page import="java.util.*,java.lang.*,java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
	String acc_type=null;
	String sql3="select acc_type from owner where username='"+owner+"'";
	Statement st3=connection.createStatement();
	ResultSet rs3=st3.executeQuery(sql3);
	if(rs3.next())
	{
		acc_type=rs3.getString(1);
	}
	if((acc_type!=null)&&(acc_type.equalsIgnoreCase("Active")))
	{
%>
	
		<form action="o_executequeries.jsp" method="post">
			
		    <div align="left">
			    <textarea rows="15%" cols="100%" name="query"></textarea>
		      <input type="submit" value="Execute" />
	        </div>
		</form>
		</p>
	
<table border="1" align="left"  cellpadding="0" cellspacing="0" >

<%
	String sql=request.getParameter("query");
	String q_type=null;
	if(sql!=null){
	 String q_key=sql.toLowerCase().substring(0,2);
	 if(q_key.equalsIgnoreCase("in"))
	 {
	 	q_type="insert";
	 }
	 else if(q_key.equalsIgnoreCase("de"))
	 {
	 	q_type="delete";
	 }
	 else if(q_key.equalsIgnoreCase("se"))
	 {
	 	q_type="select";
	 }
	 else if(q_key.equalsIgnoreCase("up"))
	 {
	 	q_type="update";
	 }
		}
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt=strDate+" "+strTime;
		
	try
	{
	
		ArrayList<String> colnames=new ArrayList<String>();
		if(sql!=null)
		{
			if(q_type.equalsIgnoreCase("select"))
			{
				int count=0;	
				ResultSet rs=null;
				Statement st=connection.createStatement();
				rs=st.executeQuery(sql);
				if(rs!=null)
				{
					ResultSetMetaData rsmd=rs.getMetaData();
					int i=0;
					%>
						<tr bgcolor="#CCCCCC">
					<%
					while(i<rsmd.getColumnCount())
					{
						i++;
						%>	
						
						<td width="50" height="37" valign="middle" style="color:#333333"><strong>
						<%=rsmd.getColumnName(i)%></strong></td>
						
						<%
						colnames.add(rsmd.getColumnName(i));
					}
					%></tr><%
					
					while(rs.next())
					{
						%><tr><%
						for(int j=0;j<colnames.size();j++)
						{
							%>
							<td valign="middle" style="color:#333333"><%=rs.getString(colnames.get(j))%></td>		
							<%	
						}
						%></tr><%
					count=count+1;
					}
					
				}out.print(count+" row(s) returned");
			}
			else if(q_type.equalsIgnoreCase("update"))
			{
				Statement st=connection.createStatement();
				int x=st.executeUpdate(sql);
					
				if(x>0)
				{
					out.print("<br> "+x+" row updated");
				
				}
		
			}
			else if(q_type.equalsIgnoreCase("delete"))
			{
				Statement st=connection.createStatement();
				int x=st.executeUpdate(sql);
				if(x>0)
				{
					out.print("<br> "+x+" row deleted");
				}
								
			}
			else if(q_type.equalsIgnoreCase("insert"))
			{
				Statement st=connection.createStatement();
				int x=st.executeUpdate(sql);
				if(x>0)
				{
					out.print("<br>"+x + " row inserted");
				}
				
			}
		}
	}
		catch(Exception e)
	{
					String action="Block";
					String sql1="insert into sql_injection(username,q_type,query,dt,action)values('"+owner+"','"+q_type+"','"+sql+"','"+dt+"','"+action+"')";
					Statement st1=connection.createStatement();
					st1.executeUpdate(sql1);
			out.print("<big><strong>SQL Injection Occured</strong></big><br><br>");
			out.print(e);
	}
		%>
       </table>
    <%}
	else if((acc_type!=null)&&(acc_type.equalsIgnoreCase("Blocked")))
	{
		%>
		<h3 class="style7">Sorry Your Account Is Blocked.<br />Please Send unblock Request</h3>
		<form action="o_unblockreq.jsp?oname=<%=owner%>&type=<%="query"%>" method="post">
		<input type="submit" value="Send Request" />
		</form>
		<%
		String msg=(String)application.getAttribute("msg");
		if(msg!=null)
		{
			%>
			<h4><span class="style8 style3"> <%=msg%> </span></h4>
			<%
		}application.removeAttribute("msg");
	}
	%>
   		</div>

      <div class="clr1">
        <div align="right" class="clr style3">
          <p><a href="ownermain.jsp" class="style4">Back</a></p>
        </div>
      </div>
    </div>
  </div>
 
  <div class="footer"></div>
</div>
</body>
</html>
