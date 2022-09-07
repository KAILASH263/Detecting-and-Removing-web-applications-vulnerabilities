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
.style10 {
	font-size: 14px;
	color: #FF0033;
}
-->
</style>

<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}
</script>

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
          <h2><span>Download File     </span></h2>
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
		  String fname=request.getParameter("fname");
		  String id=request.getParameter("id");
		  String key1=request.getParameter("key");
		  String sk=(String)application.getAttribute("sk");
		
		 
		  
		  SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
	
			Date now = new Date();
	
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
		  
		try
		{  
		  String sql="select sk from sk_request where username='"+user+"'";
		  Statement st=connection.createStatement();
		  ResultSet rs=st.executeQuery(sql);
		  if(rs.next())
		  {
		  		String sk1=rs.getString(1);
				if(sk1.equals(sk))
				{
					String sql1="select content from a_documents where (id='"+id+"' and fname='"+fname+"')";
					Statement st1=connection.createStatement();
					ResultSet rs1=st1.executeQuery(sql1);
					if(rs1.next())
					{
						String content=rs1.getString(1); 
						
				//Content decryption
				String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
				Key key = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.DECRYPT_MODE, key);
				String d_content = new String(Base64.decode(content.getBytes()));
					
					
		   %>
        
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
			<td><button onClick="saveTextAsFile()">Download</button></td>
		 </tr>
       
		
         <%
		 	
		 	String status="Downloaded";
		 	String sql2="insert into transactions(username,sk,doc_id,fname,dt,status)values('"+user+"','"+sk+"','"+id+"','"+fname+"','"+dt+"','"+status+"')";
			Statement st2=connection.createStatement();
			st2.executeUpdate(sql2);
			
					}
		 		}
				else
				{
					String status="worng secret key";
					String sql3="insert into transactions(username,sk,doc_id,fname,dt,status)values('"+user+"','"+sk+"','"+id+"','"+fname+"','"+dt+"','"+status+"')";
			Statement st3=connection.createStatement();
			st3.executeUpdate(sql3);
					%>
						<h3 class="style10">Secret Key Mismatched</h3>
					<%
				}
			}
			else
			{
				%>
					<h3 class="style10">Sorry You are not requested Secret Key <br /> Wrong Secret Key</h3>
				<%
			}
		
			
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
       <p><a href="u_searchresults.jsp?key=<%=key1%>">Back</a></p>
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
