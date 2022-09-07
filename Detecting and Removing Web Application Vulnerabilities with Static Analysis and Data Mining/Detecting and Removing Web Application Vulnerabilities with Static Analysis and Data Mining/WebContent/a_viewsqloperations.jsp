<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>all sql injected operations</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style3 {font-size: 14px}
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
	<%String admin=(String)application.getAttribute("admin");%>
      <ul>
        <li><a href="adminmain.jsp">Home</a></li>
        <li><a href="#"><%=admin%></a></li>
        <li><a href="adminlogin.jsp">logout</a></li>
      </ul>
    </div>
  </div>
  <div class="hbg">
    <div class="hbg_resize"> <img src="images/hbg_bg.jpg" width="970" height="215" alt="" /> </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>All SQL Injected Vulnerabilities   </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
		  <table width="605" border="1.5" align="left"  cellpadding="0" cellspacing="0">
        
<%@ include file="connect.jsp" %>
<%
String s1,s2,s3,s4;
int i=0,m=0;
try 
{
	String oname=request.getParameter("oname");
	String query="select * from sql_injection where username='"+oname+"' "; 
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(query);
	while( rs.next() )
	{
		s1=rs.getString(3);
		s2=rs.getString(4);
		s3=rs.getString(5);
		
		
		if(m==0){
			%>
			
			  <tr>
            <td  width="85" height="37" align="center" valign="middle" style="color: #2c83b0;"><div align="center" class="style3 style9"><strong>Operation </strong></div></td>
            <td  width="364" height="37" align="center" valign="middle" style="color: #2c83b0;"><div align="center" class="style3 style9"><strong>View Query </strong></div></td>
            <td   width="148" height="37" align="center" valign="middle" style="color: #2c83b0;"><div align="center" class="style3 style9"><strong>Date</strong></div></td>
          </tr>
			<%}m=1;%>
          <tr>
		 
			<td  width="85" height="29" align="center" valign="middle" ><%out.println(s1);%></td>
			<td  width="364" height="29" align="center" valign="middle"><div align="left">
			  <%out.println(s2);%>
			  </div></td>
			 <td  width="148" height="29" align="center" valign="middle"><%out.println(s3);%></td>
			</tr>	
          <%
				}
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
        </table>
		  
		  </p>
         
        </div>
        <div align="right"><a href="allsql_injections.jsp">Back
        </a> </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="adminmain.jsp">Home</a></li>
            <li><a href="adminlogin.jsp">Logout</a></li>
          </ul>
        </div>
       
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Image Gallery</h2>
        <a href="#" class="nobg"><img src="images/pix1.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix2.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix3.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix4.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix5.jpg" width="92" height="92" alt="" class="ad" /></a> <a href="#" class="nobg"><img src="images/pix6.jpg" width="92" height="92" alt="" class="ad" /></a>
        <div class="clr"></div>
      </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
        <img src="images/white.jpg" width="93" height="92" alt="" />
        <p>&nbsp;</p>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
        <img src="images/white.jpg" width="64" height="64" alt="" />
        <p>&nbsp;</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
</body>
</html>
