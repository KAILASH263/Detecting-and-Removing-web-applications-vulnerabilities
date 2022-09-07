<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>owner registration page</title>
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
	color: #009999;
	font-weight: bold;
}
.style9 {color: #009999}
.style11 {color: #FF0000; font-size: 14px; }
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
		<li><a href="ownerlogin.jsp">Data Owner</a></li>
		 <li class="active"><a href="o_register.jsp">Owner Register</a></li>
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
          <h2><span>Welcome To Owner Registration Form </span></h2>
          <div class="clr"></div>
          <p align="justify"><strong>Note :</strong><span class="style7">*=Required</span>
    
		  	<%String msg=(String)application.getAttribute("msg");
			if(msg!=null)
			{
			%>
		  <h3><span class="style11"> <%=msg%></span></h3>
			<%
			}
			application.removeAttribute("msg");
			%>
        <form action="o_insertdata.jsp" method="post" id="" enctype="multipart/form-data">
					  <table width="485">
					    <tr>
                          <td width="200" height="43"><span class="style8">User Name <span class="style7">*</span></span></td>
                          <td width="273"><input id="name" name="userid" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Password <span class="style7">*</span></span></td>
                          <td><input type="password" id="password" name="pass" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Email Address <span class="style7">*</span></span></td>
                          <td><input id="email" name="email" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Mobile Number <span class="style7">*</span></span></td>
                          <td><input id="mobile" name="mobile" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Date of Birth <span class="style7">*</span></span></td>
                          <td><input id="dob" name="dob" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Select Gender <span class="style7">*</span></span></td>
                          <td><select id="s1" name="gender" style="width:170px;" class="text">
                            <option>--Select--</option>
                            <option>MALE</option>
                            <option>FEMALE</option>
                          </select></td>
                        </tr>
                        <tr>
                          <td height="65"><span class="style8">Address <span class="style7">*</span></span></td>
                          <td><textarea id="address" name="address" rows="3" cols="21"></textarea></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Enter Pincode <span class="style7">*</span></span></td>
                          <td><input id="pincode" name="pincode" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style8">Select Profile Picture <span class="style7">*</span></span></td>
                          <td><input type="file" id="pic" name="pic" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="43" rowspan="3"><span class="style9"></span></td>
                          <td align="left" valign="middle"> <p>&nbsp;</p>
                           
                              <input name="submit" type="submit" value="REGISTER" />
                            <div align="right">
                            <p align="right"><a href="ownerlogin.jsp" class="style4">Back</a></p>
                          </div></td>
                        </tr>
            </table>
        </form>
		  </p>
        </div>
      <!--  <div class="article">
          <img src="images/img.jpg" width="605" height="146" alt="" />
        </div>-->
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="index.html">Home</a></li>
            <li><a href="userlogin.jsp">User</a></li>
            <li><a href="ownerlogin.jsp">Data Owner</a> </li>
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
