<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>attacked documents</title>
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
.style6 {
	font-size: 16px;
	color: #FF3333;
	font-weight: bold;
}
.style7 {
	font-size: 16px;
	color: #009933;
}
.style8 {
	font-size: 16px;
	color: #FF0033;
}
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
  <div class="hbg">
    <div class="hbg_resize"> <img src="images/hbg_bg.jpg" width="970" height="215" alt="" /> </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Attacked Documents  </span></h2>
          <div class="clr"></div>
          <p align="justify">
	
	<table width="648" align="left"  cellpadding="0" cellspacing="0">
<%@ include file="connect.jsp" %>
	
		<%
	String id=request.getParameter("id");
	String s1,s2,s3,s4,s5,s7,s6;
	int i=0,j=0,m=0,total=0;
	try 
	{
	
		String msg=(String)application.getAttribute("msg");
		if(msg!=null)
		{
		%>
			<h3><span class="style6"> <%=msg%></span></h3>
		<%
		}
		application.removeAttribute("msg");
	
	String sql="select dsign,content from documents where id='"+id+"'"; 
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(sql);
	if(rs.next())
	{
		
		s1=rs.getString(1);//digital sign
		s3=rs.getString(2);//content
		
			String sql1="select dsign from a_documents where id="+id+""; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(sql1);
			if(rs1.next())
			{
				s2=rs1.getString(1);//digital sign
				
					if(s1.equals(s2))
					{
						%>
						<h3 class="style7">Your Document is Safe</h3>
						<%
					}
					else
					{
					%>
						<h3 class="style8">Your Document is Attacked</h3>
						<br />
						<h4><a href="recovery.jsp?id=<%=id%>">Click Here to Recover</a></h4>
					<%
					}
			}
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
       
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="ownermain.jsp">Home</a></li>
            <li><a href="ownerlogin.jsp">Logout</a></li>
          </ul>
        </div>
       
      </div>
      <div class="clr1">
        <div align="right" class="clr style3">
          <p>&nbsp;</p>
          <p><a href="o_verify.jsp" class="style4">Back</a></p>
        </div>
      </div>
    </div>
  </div>
  <!--<div class="fbg">
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
  </div>-->
  <div class="footer"></div>
</div>
</body>
</html>
