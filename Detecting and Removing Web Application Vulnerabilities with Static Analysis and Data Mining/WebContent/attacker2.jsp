<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>download document</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style9 {
	font-size: 14px;
	font-weight: bold;
	color: #6699FF;
}
.style11 {
	font-size: 14px;
	font-weight: bold;
	color: #FF0066;
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

    </div>
  </div>
  <div class="hbg">
    <div class="hbg_resize"> <img src="images/hbg_bg.jpg" width="970" height="215" alt="" /> </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span> File Content    </span></h2>
          <p>&nbsp;</p>
          <p align="justify">
          <table width="485" height="100">
		  
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@page
	import="java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
		  <%

		  String id=request.getParameter("id");
		  String key=request.getParameter("key");
 
		try
		{  
		  
				String sql1="select id,fname,content from a_documents where id='"+id+"'";
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(sql1);
				if(rs1.next())
				{
					int i=rs1.getInt(1);
					String fname=rs1.getString(2);
					String content=rs1.getString(3); 
						
				//Content decryption
				String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
				Key key1 = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.DECRYPT_MODE, key1);
				String d_content = new String(Base64.decode(content.getBytes()));
					
					
		   %>
        	<form action="attacker_editdoc.jsp?id=<%=i%>&key=<%=key%>" method="post">
		    <p>&nbsp;	        </p>
		    <tr>
		      <td><span class="style9">File Name : </span></td>
		      <td><input type="text" id="text" name="text" value="<%=fname%>"  class="text" /></td>
		      </tr>
		    <tr>
				<td width="227"><span class="style9">File Description : </span></td>
				<td width="225"><textarea id="textarea" name="textarea" cols="45" rows="10"><%=d_content%></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Attack" /></td>
		 </tr>
       </form>
		
         <%
			}
			String msg=(String)application.getAttribute("msg");
			if(msg!=null)
			{
			%>
			<h3><span class="style11"> <%=msg%> </span></h3>
			<%
			}application.removeAttribute("msg");
			connection.close();
			}
			 catch (Exception e) 
			 {
			out.println(e.getMessage());
		}
			
			%>
		  </table>
		  </p>
        </div>
     <div align="right">
       <p><a href="attacker1.jsp?key=<%=key%>">Back</a></p>
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
