<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>search documents</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style9 {
	font-size: 14px;
	font-weight: bold;
	color: #6699FF;
}
.style11 {
	color: #FF3333;
	font-size: 14px;
}
.style12 {
	color: #339966;
	font-size: 14px;
}
.style14 {color: #FF3300}
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
	<%String user=(String)application.getAttribute("user");%>
      <ul>
        <li><a href="usermain.jsp">Home</a></li>
        <li><a href="#"><%=user%></a></li>
        <li><a href="userlogin.jsp">logout</a></li>
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
          <h2><span>Search Files    </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
		  <%@ include file="connect.jsp" %>
		 <%
		  String status=request.getParameter("status");
		  String sql6="select acc_status from user where username='"+user+"' and acc_status='Active'";
		Statement st6=connection.createStatement();
		ResultSet rs6=st6.executeQuery(sql6);
		if ( rs6.next() )
		{
		  
		  if((status!=null)&&(status.equalsIgnoreCase("Block")))
		  {
		   %>
          <table width="485" height="100">
          <form action="u_skverification.jsp" method="post">
		    <p>&nbsp;</p>
		<tr>
				<td width="227"><span class="style9">Enter Secret Key : </span></td>
				<td width="225"><input name="sk" type="text"  /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		 </tr>
          </form>
		  
		</table>
		<%}
		else  if((status!=null)&&(status.equalsIgnoreCase("Blocked")))
		{
			%>
				<p><a href="u_unblockreq.jsp?uname=<%=user%>&type=<%="search"%>" class="style12">Click here To Send Unblock Request</a></p>
			<%
		}
		else
		{
			%>
					  <table width="485" height="100">
					  <form action="u_skverification.jsp" method="post">
						<p>&nbsp;</p>
					<tr>
							<td width="227"><span class="style9">Enter Secret Key : </span></td>
							<td width="225"><input name="sk" type="text"  /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Submit" /></td>
					 </tr>
					  </form>
					  
					</table>
					<%
		}
		}
		else
		{
			%>
				<h3 class="style14">Your Account is blocked</h3>
				<br />
				<p><a href="u_unblockreq.jsp?uname=<%=user%>&type=<%="search"%>" class="style12">Click here To Send Unblock Request</a></p>
			<%
		}
		 String msg=(String)application.getAttribute("msg");
		  if(msg!=null)
		  {
		  %>
	  	  <h3><span class="style11"> <%=msg%></span></h3>
		  <%
		  }
		  application.removeAttribute("msg");
		%>
		  </p>
         
        </div>
     <div align="right">
       <p><a href="usermain.jsp">Back</a></p>
     </div>
      </div>
	  
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="usermain.jsp">Home</a></li>
            <li><a href="userlogin.jsp">Logout</a></li>
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
