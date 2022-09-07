<title>Adding  product  posts</title>
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
					String owner=(String)application.getAttribute("owner");
					ArrayList list = new ArrayList();
					ServletContext context = getServletContext();
					String dirName =context.getRealPath("Gallery\\");
					String paramname=null;
					String file=null;
					String a=null,b=null,d=null,image=null;
					String ee[]=null;
					String checkBok=" ";
					int ff=0;
					String bin = "";
					String fname=null;
					String dname=null;     
					String duse=null;
					String content=null;
					String dsign=null;
					
					
					FileInputStream fs=null;
					File file1 = null;	
				
					try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
						Enumeration params = multi.getParameterNames();
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
														
							if(paramname.equalsIgnoreCase("dname"))
							{
								dname=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("duse"))
							{
								duse=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("content"))
							{
								content=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("dsign"))
							{
								dsign=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("fname"))
							{
								fname=multi.getParameter(paramname);
							}						
							if(paramname.equalsIgnoreCase("pic"))
							{
								image=multi.getParameter(paramname);
							}
						
						}
							
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath("Gallery\\"+image);
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
								while ((i = fis.read()) != -1)
								 {
									if (i != -1) 
									{
										//System.out.println(i);
										String hex = Integer.toHexString(i);
										// session.put("hex",hex);
										sb1.append(hex);
										// sb1.append(",");
									
										String binFragment = "";
										int iHex;
			 
										for(int i1= 0; i1 < hex.length(); i1++)
										{
											iHex = Integer.parseInt(""+hex.charAt(i1),16);
											binFragment = Integer.toBinaryString(iHex);
			
											while(binFragment.length() < 4)
											{
												binFragment = "0" + binFragment;
											}
											bin += binFragment;
										
										}
									}	
								}
							}		
						}
						FileInputStream fs1 = null;
				
						int lyke=0;
						
						 
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt=strDate+ " "+strTime;
					         		
					 
					 PreparedStatement ps=connection.prepareStatement("insert into documents(ownername,dname,duse,fname,content,dsign,dt,image) values(?,?,?,?,?,?,?,?)");
						ps.setString(1,owner);
						ps.setString(2,dname);
						ps.setString(3,duse);
						ps.setString(4,fname);
						ps.setString(5,content);
						ps.setString(6,dsign);
						ps.setString(7,dt);
						ps.setBinaryStream(8, (InputStream)fs, (int)(file1.length()));	
					
						int x=ps.executeUpdate();
						if(x>0)
						{
							PreparedStatement ps1=connection.prepareStatement("insert into a_documents(ownername,dname,duse,fname,content,dsign,dt,image) values(?,?,?,?,?,?,?,?)");
						ps1.setString(1,owner);
						ps1.setString(2,dname);
						ps1.setString(3,duse);
						ps1.setString(4,fname);
						ps1.setString(5,content);
						ps1.setString(6,dsign);
						ps1.setString(7,dt);
						ps1.setBinaryStream(8, (InputStream)fs, (int)(file1.length()));	
					
						ps1.executeUpdate(); 
						
							String msg="Document uploaded Successfully";
							application.setAttribute("msg",msg);
							response.sendRedirect("o_upload.jsp");

				 	  }
			   
		}
					catch (Exception e) 
					{
						out.println(e.getMessage());
						e.printStackTrace();
					}
				%>
