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
          <h2><span>Verify Documents  </span></h2>
          <div class="clr"></div>
          <p align="justify">
	
	<table width="648" align="left"  cellpadding="0" cellspacing="0">
<%@ include file="connect.jsp" %>
	
		<%
	
	String s1,s2,s3,s4,s5,s7,s6;
	int i=0,j=0,m=0,total=0;
	try 
	{
	ArrayList al=new ArrayList();
	
	String sql="select id,fname,content,dsign,dname from documents where ownername='"+owner+"'"; 
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
		i=rs.getInt(1);
		s1=rs.getString(2);//filename
		s2=rs.getString(3);//file content
		s5=rs.getString(4);//digital sign
		s6=rs.getString(5);//doc name
	
		
		if(m==0){
		%>
		
			  <tr>
				
			<td  width="159" height="33" align="center" valign="middle" style="color: #2c83b0;"><div align="center"><strong>Image</strong></div></td>
		    <td  width="150" height="33" align="center" valign="middle" style="color: #2c83b0;"><div align="center"><strong>Document Name </strong></div></td>
				<td  width="174" height="33" align="center" valign="middle" style="color: #2c83b0;"><div align="center"><strong>File Name </strong></div></td>
			    
			    <td  width="163" align="center" valign="middle" style="color: #2c83b0;"><div align="center"><strong>Operation</strong></div></td>
			  </tr>
				  <%}m=2;%>
			  <tr>
			  
			    <td width="159" align="center" valign="middle"><input  name="image" type="image" style="width:70px; height:70px;" src="profile_pic.jsp?id=<%=i%>&type=<%="document"%>" align="middle"/></td>
			    <td width="150" align="center" valign="middle"><div align="center"><%out.println(s6);%></div></td>
			    <td  width="174" align="center" valign="middle"><div align="center"><%out.println(s1);%></div></td>
				<td  width="163" align="center" valign="middle"><div align="center"><a href="o_recovery.jsp?id=<%=i%>" class="style12">Verify</a></div></td>
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
          <p><a href="ownermain.jsp" class="style4">Back</a></p>
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
