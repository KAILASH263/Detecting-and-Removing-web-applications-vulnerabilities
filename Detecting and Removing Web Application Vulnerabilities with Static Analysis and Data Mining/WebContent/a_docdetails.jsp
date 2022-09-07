<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>document details</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
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
          <h2><span> Documents Details </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
		  <table width="739" border="1" align="left"  cellpadding="0" cellspacing="0">
        
<%@ include file="connect.jsp" %>
<%
						String id = request.getParameter("id");
						String vtype=request.getParameter("vtype");
						
						String s1,s2,s3,s4,s5,s6;
						int i=0;
						try 
						{
						   	String query="select * from documents where id='"+id+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if(rs.next())
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(3);
								s3=rs.getString(4);
								s4=rs.getString(5);
								s5=rs.getString(6);//encrpty content
								s6=rs.getString(8);
			

					%>
					<tr>
					<td width="196" rowspan="8"><div class="style7" style="margin:10px 13px 10px 13px;" >
				 <input  name="image" type="image" src="profile_pic.jsp?id=<%=i%>&type=<%="document"%>" style="width:170px; height:200px;"/></div></td>
					</tr>
					
					<tr>
					  <td  width="191" valign="middle" height="42" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Owner Name</strong></div></td>
	  <td  width="340" valign="middle" height="42" ><div align="left" class="style11" style="margin-left:20px;"><%out.println(s1);%></div></td>
					</tr>
					<tr>
					  <td  width="191" valign="middle" height="42" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Document Name</strong></div></td>
	  <td  width="340" valign="middle" height="42" ><div align="left" class="style11" style="margin-left:20px;"><%out.println(s2);%></div></td>
					</tr>
					<tr>
					  <td  width="191" valign="middle" height="43" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Document Use</strong></div></td>
					  <td  width="340" valign="middle" height="43" ><div align="left" class="style11" style="margin-left:20px;"><%out.println(s3);%></div></td>
					</tr>
					<tr>
					  <td  width="191" valign="middle" height="44" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>File Name</strong></div></td>
					  <td  width="340" valign="middle" height="44"><div align="left" class="style11" style="margin-left:20px;"><%out.println(s4);%></div></td>
					</tr>
					<tr>
<td  width="191" align="left" valign="middle" height="39" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Encrypted Description </strong></div> </td>                    	
<td><textarea rows="8" cols="45"> <%out.println(s5);%></textarea></td>
					</tr>
					<tr>
					  <td  width="191" align="left" valign="middle" height="40" style="color: #00CC99;"><div align="left" class="style8 style7 style14" style="margin-left:20px;"><strong>Uploded Date</strong></div></td>
					  <td  width="340" align="left" valign="middle" height="40"><div align="left" class="style11" style="margin-left:20px;"><%out.println(s6);%></div></td>
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
		<%if(vtype.equalsIgnoreCase("all")){%>
        <div align="right">
          <p>&nbsp;</p>
          <p><a href="alldocuments.jsp">Back</a> </p>
        </div>
		<%}
		else
		{
		%> <div align="right">
         	 <p>&nbsp;</p>
         	 <p><a href="alldownloads.jsp">Back</a> </p>
      	 	 </div>
		<%
		}
		%>
      </div>
      <!--<div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="adminmain.jsp">Home</a></li>
            <li><a href="adminlogin.jsp">Logout</a></li>
          </ul>
        </div>
       
      </div>-->
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
