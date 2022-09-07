
<%@ include file="connect.jsp"%>

<%
try
{
String opt=request.getParameter("opt");
ResultSet rs=connection.createStatement().executeQuery("SELECT att_name,fname,count(fname) FROM attackers group by fname,att_name");

%><html>
<head>
<title>image Results</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<body>
<div id="graph">Loading graph...</div>

<div align="center">
    <script type="text/javascript">
var myData=new Array();
var colors=[];

<%
	int i=0;
	
	String s1=null;
	
	while(rs.next())
	{
	 s1=rs.getString(1);
	String s3=rs.getString(2);
	int  s2=rs.getInt(3);
	
	
	
	%>
	
	myData["<%=i%>"]=["<%= s1%>(<%=s3%>)",<%=s2%>];
        
	<%
	i++;}
	%>
	
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.setBarColor('#42aBdB');
	myChart.setBarOpacity(0.8);
	myChart.setSize(500, 400);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
  </script>
   </div>
</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

