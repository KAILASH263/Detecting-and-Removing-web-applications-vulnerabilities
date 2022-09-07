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
.style4 {color: #0099FF; font-weight: bold; }
.style5 {
	color: #FF0000;
	font-size: 16px;
}
-->
</style>

<script type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
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
          <h2><span>Upload Document Details </span></h2>
          <div class="clr"></div>
          <p align="justify">
		  <%String msg=(String)application.getAttribute("msg"); 
		  if(msg!=null)
		  {
		  %>
		  <h3><span class="style5"> <%=msg%></span></h3>
		  <%
		  }
		  application.removeAttribute("msg");
		  %>
		  
		 <form action="o_upload1.jsp" method="post" name="form1">
              
			      <table width="552" height="234">
                    <tr>
                      <td height="44" align="left" valign="middle"><span class="style4">Document Name </span></td>
                      <td width="395"><input id="dname" name="dname" type="text" /></td>
                    </tr>
                    <tr>
                      <td height="44" align="left" valign="middle"><span class="style4">Document Use</span></td>
                      <td><input id="dname" name="duse" type="text" /></td>
                    </tr>
                    <tr>
                      <td height="44" align="left" valign="middle"><span class="style4">Select Document </span></td>
                      <td><input name="file" type="file" id="file"  onchange="loadFileAsText()" size="29"></td>
                    </tr>
                    
                    <tr>
                      <td width="145" height="44" align="left" valign="middle"><span class="style4">Description</span></td>
                      <td><label>
                          <textarea name="content" id="textarea" cols="50" rows="20"></textarea>
                      </label></td>
                    </tr>
                    <tr>
                      <td height="44" align="left" valign="middle"><p>&nbsp;
                        </p>
                        <p>&nbsp;</p></td>
                      <td align="center" valign="middle"><div align="right">
                        <p>&nbsp;</p>
                 
                          <input name="submit" type="submit" value="Encrypt" />
                       
                      </div></td>
                    </tr>
                  </table>
		  </form>
		 
		 </p>
		 <div align="right"><a href="ownermain.jsp">Back</a></div>
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
