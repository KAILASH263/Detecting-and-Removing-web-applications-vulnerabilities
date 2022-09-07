<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>all users list</title>
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
          <h2><span>User Profile Details  </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
          
          <table width="590" border="1.5" align="left"  cellpadding="0" cellspacing="0"  >
	
<%@ include file="connect.jsp" %>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>

					<%
						String id = request.getParameter("mid");
			
						
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						try 
						{
						   	String query="select * from user where id='"+id+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(8);
								s6=rs.getString(11);

					%>
					<tr>
					<td width="197" rowspan="8"><div class="style7" style="margin:10px 13px 10px 13px;" >
				 <input  name="image" type="image" src="profile_pic.jsp?id=<%=i%>&type=<%="user"%>" style="width:170px; height:200px;"/></div></td>
					</tr>
					
					<tr>
					  <td  width="188" valign="middle" height="42" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Name</strong></div></td>
	  <td  width="197" valign="middle" height="42" ><div align="left" class="style11" style="margin-left:20px;"><%out.println(s1);%></div></td>
					</tr>
					<tr>
					  <td  width="188" valign="middle" height="43" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>E-Mail</strong></div></td>
					  <td  width="197" valign="middle" height="43" ><div align="left" class="style11" style="margin-left:20px;"><%out.println(s2);%></div></td>
					</tr>
					<tr>
					  <td  width="188" valign="middle" height="44" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Mobile</strong></div></td>
					  <td  width="197" valign="middle" height="44"><div align="left" class="style11" style="margin-left:20px;"><%out.println(s3);%></div></td>
					</tr>
					<tr>
<td  width="188" align="left" valign="middle" height="39" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Date Of Birth</strong></div> </td>                    	
<td  width="197" align="left" valign="middle" height="39"><div align="left" class="style11" style="margin-left:20px;"><%out.println(s4);%></div></td>
					</tr>
					<tr>
					  <td  width="188" align="left" valign="middle" height="40" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Status</strong></div></td>
					  <td  width="197" align="left" valign="middle" height="40"><div align="left" class="style11" style="margin-left:20px;"><%out.println(s6);%></div></td>
					</tr>
					<tr>
					  <td  width="188" align="left" valign="middle" height="59" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Address</strong></div></td>
					  <td  width="197" align="left" valign="middle" height="59"><div align="left" class="style11" style="margin-left:20px;"><%out.println(s5);%></div></td>
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
     <div align="right">
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p>&nbsp;</p>
       <p><a href="allusers.jsp">Back</a></p>
     </div>
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
