<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>secret Key response</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style8 {
	color: #FF0033;
	font-size: 16px;
}
.style9 {
	font-size: 14px;
	font-weight: bold;
	color: #6699FF;
}
.style10 {
	color: #339933;
	font-size: 14px;
	font-weight: bold;
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
          <h2><span>View Secret Key Response   </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
          <table width="485" height="88">
          <form action="u_insertreq.jsp?type1=<%="res"%>" method="post">
		    <p>&nbsp;	        </p>
		<tr>
				<td width="227"><span class="style9">Enter Your Login Password : </span></td>
				<td width="225"><input name="pass" type="password"  /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="View" /></td>
		 </tr>
          </form>
		  
		  <%
		  
		  String msg=(String)application.getAttribute("msg");
		  if(msg!=null)
		  {
		  	%>
				<h3><span class="style8"><%=msg%></span> </h3>
			<%
			String sk=request.getParameter("sk");
			if(sk!=null)
			{
			if(!(sk.equalsIgnoreCase("Generate Secret Key"))){%> 
	  		<p><span class="style10"> <%=sk%>	</span></p>
			<%
			}
			}%>
					<%
		  }
		  application.removeAttribute("msg");
		  
		   %>
		  </table>
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
