<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>wrong login page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style7 {color: #FF0000}
.style8 {color: #FF0033}
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
        <li class="active"></li>
		 <li></li>
		  <li></li>
        <li></li>
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
          <h2 class="style7">Login Failed...!!! </h2>
          <div class="clr"></div>
          <p align="justify"> 
		  <table width=405 height="267" border=0 align="center" cellpadding=0 cellspacing=0>
<tr>
<td width="405" height="189" align=center valign="middle"><div align="center"><span class="style4 style8">Sorry.</span><span class="style11 style4 style8"><BR>
        <BR>
        <font class=sb3>
          Your login failed.<BR>
            </font></span>
            <span class="style8"></span></span>            </span><TABLE cellSpacing=0 cellPadding=0 border=0 height="7">
    <TR><TD height=7 class="style9 style4 style8"></TD></TR>
    </TABLE>
            <span class="style9 style4 style8"><font class="sb3">This happens due to - Incorrect Username / Incorrect password<BR>
            </font> </span>
  <TABLE cellSpacing=0 cellPadding=0 border=0 width="10">
    <TR>
      <TD width="10" height=9 class="style9 style4 style8"></TD></TR>
    </TABLE>
  <span class="style9 style4 style8"><font class="sb3">In case you have forgotten your password,<BR>
    </font> </span>
  <TABLE cellSpacing=0 cellPadding=0 border=0>
    <TR><TD height=9 class="style9 style4 style8"></TD></TR>
    </TABLE>
  <span class="style9 style4 style8"><font class="sb3">click&nbsp; here to re enter correct&nbsp; username or password on homepage.</font></span><span class="style9"><font class="sb3"><BR>
    </font></span><font class="sb3"><BR>
      <%
String type=(String)application.getAttribute("type");
if(type.equalsIgnoreCase("user")){
%>
      <a href="userlogin.jsp">Click here to go back</a>	<br />	
        <a href="index.html"><span class="">Home Page</span></a>
      </BR>
      <%}
else if(type.equalsIgnoreCase("admin")){
%>
      <a href="adminlogin.jsp">Click here to go back</a><BR>
      <a href="index.html"><span>Home Page</span></a>
      <%}
	  else if(type.equalsIgnoreCase("owner")){
%>
      <a href="ownerlogin.jsp">Click here to go back</a><BR>
      <a href="index.html"><span>Home Page</span></a>
      <%}%>
    </font></div></td>
</tr>
</table>
		  </p>
        </div>
        <div class="article"></div>
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
