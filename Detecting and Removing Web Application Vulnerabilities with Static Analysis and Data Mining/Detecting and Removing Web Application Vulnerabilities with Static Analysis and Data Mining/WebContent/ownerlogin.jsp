<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>owner login page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style2 {
	font-size: 14px;
	font-weight: bold;
}
.style3 {font-size: 14px}
.style6 {color: #3366FF}
.style7 {color: #FF0000}
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
        <li><a href="userlogin.jsp">User</a></li>
		<li class="active"><a href="ownerlogin.jsp">Data Owner</a></li>
		<li><a href="o_register.jsp">Owner Register</a></li>
        <li><a href="adminlogin.jsp">Admin</a></li>
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
          <h2><span>Welcome To Data Owner Login</span></h2>
          <div class="clr"></div>
          <p align="justify"><strong>Note : 
		   </strong>
            <span class="style7">*=Required</span>
          <form action="authentication.jsp?type=<%="owner"%>" method="post">
<table width="68%">
				 
				  <tr>
                    <td width="123" height="52"><span class="style2"><span class="style6">User Name</span> <span class="style7">*</span></span></td>
                    <td width="239"><input id="name" name="userid" type="text" /></td>
                  </tr>
                  <tr>
                    <td height="44"><span class="style2"><span class="style6">Password</span> <span class="style7">*</span></span></td>
                    <td><input type="password" id="password" name="pass" class="text" /></td>
                  </tr>
                  <tr>
                    <td height="51"><span class="style3"></span></td>
                    <td><input name="imageField" type="submit"  id="imageField" value="Login" />
                        <input name="Reset" type="reset" value="Reset" />
                      New Data Owner?<a href="o_register.jsp">Register </a> </td>
                  </tr>
         </table>
      </form>
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
            <li><a href="userlogin.jsp">User</a></li>
            <li><a href="adminlogin.jsp">Admin</a></li>
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
