<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>all vulnerabilities</title>
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
.style5 {
	font-size: 16px;
	color: #FF3333;
	font-weight: bold;
}
.style6 {
	font-size: 16px;
	font-weight: bold;
	color: #3333CC;
}
.style8 {font-size: 12}
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
          <h2><span>All Vulnerabilities   </span></h2>
          <div class="clr"></div>
          <p align="justify">
	
	<table width="615" border="3" align="left"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
         
          <%@ include file="connect.jsp" %>
          <%@ page import="java.util.*" %>
		  <%
	  
String s1,s2,s3,s4,s5,s11,s12,s13;
int i=0,m=0,j=0,n=0;
try 
{
	String sql="select id from documents where ownername='"+owner+"' "; 
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(sql);
	while ( rs.next() )
	{
		i=rs.getInt(1);
		
		String sql1="select * from transactions where doc_id='"+i+"' and status='downloaded'";
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(sql1);
		while(rs1.next())
		{
			s1=rs1.getString(2);//username
			s2=rs1.getString(3);//sk
			s3=rs1.getString(4);//doc id	
			s4=rs1.getString(5);//filename
			s5=rs1.getString(6);//transaction date
			
			
	
			if(m==0){
			%>
			<tr>
				<td height="37" colspan="5"><div align="center" class="style6">Download Details</div></td>
			</tr>
			 <tr>
				<td  width="100" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Username</strong></td>
			   <td  width="147" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Secret Key</strong></td>
				<td  width="180" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Filename</strong></td>
				<td  width="185" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Downloaded Date</strong></td>
             </tr>
			<%}m=1;%>
          <tr>
			<td  width="100" height="56" align="center" valign="middle"><span class="style8"><a href="o_userdetails.jsp?uname=<%=s1%>"><%out.println(s1);%></a></span></td>
			<td  width="147" height="56" align="center" valign="middle"><span class="style8"><%out.println(s2);%></span></td>
            <td  width="180" height="56" align="center" valign="middle" ><a href="o_docdetails1.jsp?id=<%=i%>&doc_type=<%="download"%>" class="style8">
              <%out.println(s4);%></a></td>
            <td  width="185" height="56" align="center" valign="middle"><span class="style8">
              <%out.println(s5);%>
            </span></td>
            </tr>
          <%
					}
				}
			%>
			</table>
			<table width="615" border="3" align="left"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
			<%	
			
			String sql2="select id from documents where ownername='"+owner+"' "; 
			Statement st2=connection.createStatement();
			ResultSet rs2=st2.executeQuery(sql2);
			while(rs2.next())
			{
			j=rs2.getInt(1);	
				String sql3="select * from attackers where doc_id='"+j+"'";
				Statement st3=connection.createStatement();
				ResultSet rs3=st3.executeQuery(sql3);
				while(rs3.next())
				{
					s11=rs3.getString(2);//username
					s12=rs3.getString(4);//filename
					s13=rs3.getString(5);//attacked date	
					
					if(n==0)
					{
							%>
			<tr>
				<td height="37" colspan="5"><div align="center" class="style6">Attacked Details</div></td>
			</tr>
			 <tr>
				<td  width="100" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Username</strong></td>
				<td  width="180" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Filename</strong></td>
				<td  width="185" height="35" align="center" valign="middle" style="color: #2c83b0;"><strong>Attacked Date</strong></td>
             </tr>
			<%}n=1;%>
          <tr>
			<td  width="100" height="56" align="center" valign="middle"><span class="style8"><%out.println(s11);%></span></td>
            <td  width="180" height="56" align="center" valign="middle" ><a href="o_docdetails1.jsp?id=<%=j%>&doc_type=<%="attack"%>" class="style8">
              <%out.println(s12);%></a></td>
            <td  width="185" height="56" align="center" valign="middle"><span class="style8">
              <%out.println(s13);%>
            </span></td>
            </tr>
          <%
				
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
