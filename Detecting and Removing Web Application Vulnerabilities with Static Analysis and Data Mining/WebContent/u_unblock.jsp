<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>unblock request page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style7 {color: #FF0000}
.style8 {
	color: #009933;
	font-size: 14px;
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
      <ul>
        <li><a href="index.html">Home</a></li>
		<li class="active"><a href="userlogin.jsp">User</a></li>
		
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
          <h2><span>Send Unblock Requests </span></h2>
          <div class="clr"></div>
          <p align="justify">
          <%String user=(String)application.getAttribute("user"); %>
          <h3 class="style7">Sorry Your Account Is Blocked.<br />Please Send unblock Request</h3>
		<form action="u_unblockreq.jsp?uname=<%=user%>&type=<%="login"%>" method="post">
		<input type="submit" value="Send Request" />
      </form>
	  <%
	  String msg=(String)application.getAttribute("msg");
		if(msg!=null)
		{
			%>
			<h4><span class="  style8"> <%=msg%> </span></h4>
			<%
		}
		application.removeAttribute("msg");
		%>
		  </p>
        </div>
        <div class="article">
          <h2><span>Introducion</span></h2>
          <div class="clr"></div>
          <img src="images/img.jpg" width="605" height="146" alt="" />
          <p align="justify">The project explores an approach for automatically protecting
            web applications while keeping the programmer in the loop.
            The approach consists in analyzing the web application source
            code searching for input validation vulnerabilities and inserting
          fixes in the same code to correct these flaws.In this project we explore the use of a novel combination of methods
          to detect this type of vulnerabilities: static analysis and data
          mining. Static analysis is an effective mechanisms to find
          vulnerabilities in source code, but tends to report many false
          positives (non-vulnerabilities) due to its undecidability .<br />
          </p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="index.html">Home</a></li>
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
