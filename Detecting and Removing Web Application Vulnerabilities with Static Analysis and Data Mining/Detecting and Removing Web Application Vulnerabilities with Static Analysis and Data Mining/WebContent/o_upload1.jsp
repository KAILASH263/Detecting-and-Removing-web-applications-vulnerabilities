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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>upload documents</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 30px}
.style2 {
	color: #0099FF;
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
          <h2><span>Upload Document Image </span></h2>
          <div class="clr"></div>
          <p align="justify">
		 <form action="insertdocs.jsp" method="post" name="form1" enctype="multipart/form-data">
		  <%
		
				String dname=request.getParameter("dname");
				String duse=request.getParameter("duse");
				String file=request.getParameter("file");
				String content=request.getParameter("content");
				
				//Content encryption
				String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
				Key key = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.ENCRYPT_MODE, key);
				String e_content = new String(Base64.encode(content.getBytes()));
				
					//generating digital sign
				String filename="filename.txt";
				PrintStream p = new PrintStream(new FileOutputStream("C:/Tomcat 5.0/"+filename));  //E:/DataLineage/
				p.print(new String(content));
				
				MessageDigest md = MessageDigest.getInstance("SHA1");
				FileInputStream fis11 = new FileInputStream("C:/Tomcat 5.0/"+filename);        //E:/DataLineage/
				DigestInputStream dis1 = new DigestInputStream(fis11, md);
				BufferedInputStream bis1 = new BufferedInputStream(dis1);
	 
				//Read the bis so SHA1 is auto calculated at dis
				while (true) {
					int b1 = bis1.read();
					if (b1 == -1)
						break;
				}
	 
				BigInteger bi1 = new BigInteger(md.digest());
				String spl1 = bi1.toString();
				
				String h1 = bi1.toString(16);	
					
					%>
              
			      <table width="494" height="211">
                    <tr>
                   	  <td width="136" height="58" align="left" valign="middle"><span class="style2">Docment Name</span></td>
					  <td width="346">
							  <input id="dname" name="dname" type="text" value="<%=dname%>"/>
							  <input id="duse" name="duse" type="hidden" value="<%=duse%>"/>
							 <input id="fname" name="fname" type="hidden" value="<%=file%>"/>
							  <input id="dsign" name="dsign" type="hidden" value="<%=h1%>"/>
					  </td>
                    </tr>
					<tr>
						   <td width="136" height="58" align="left" valign="middle"><span class="style2">Encrypted Content</span></td>
						   <td><textarea name="content" rows="10" cols="40"><%=e_content%></textarea></td>
					</tr>
                    <tr>
                      <td height="53" align="left" valign="middle"><span class="style2">Select Image </span></td>
                      <td><input name="pic" type="file" id="file"  size="29"></td>
                    </tr>
                    
                    <tr>
                      <td height="44" align="left" valign="middle"><p>&nbsp;
                        </p>
                        <p>&nbsp;</p></td>
                      <td align="center" valign="middle"><div align="right">

                          <div align="left">
                              <input name="submit" type="submit" value="Upload" />
                              
                        </div>
                      </div></td>
                    </tr>
                  </table>
		  </form>
		 
		 </p>
		 <div align="right"><a href="o_upload.jsp">Back</a></div>
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
