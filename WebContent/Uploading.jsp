<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ibm.dao.*" %>
<% String email="abc@gmail.com"; %>
<% String saveFile=""; %>
<% String file1=""; %>
<% String date1=""; %>
<% int count=1; %>
<% String name=""; %>
<% String description=""; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>OnlineFolio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script></head>
<body id="top">
<div class="wrapper col1">
  <div class="accordion">
    <div id="socialise">
      <ul>
        <li><a href="#"><img src="images/linkedin.gif" alt="" /><span>Linked In</span></a></li>
        <li><a href="#"><img src="images/skype.gif" alt="" /><span>Skype</span></a></li>
        <li><a href="#"><img src="images/facebook.gif" alt="" /><span>Facebook</span></a></li>
        <li><a href="#"><img src="images/rss.gif" alt="" /><span>FeedBurner</span></a></li>
        <li class="last"><a href="#"><img src="images/twitter.gif" alt="" /><span>Twitter</span></a></li>
      </ul>
      <br class="clear" />
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="header">
    <p class="toggler"><a href="#socialise">Open &amp; Close SocialBar</a></p>
    <div id="logo" style="width:900px;">
      <h1><a href="#">State Road Transport Corporation</a></h1>
      <p>&nbsp;</p>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="intro"></div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div class="overview">
  
    
      <br />
	  <br />
	  <br />
	  <br />
	  <div style="margin-left:300px;">
	  <%
//++++++++++++++++++++++++++++=Task1

File file = new File("E:\\pic");
if (!file.exists()) {
	if (file.mkdir()) {
		out.println("Directory is created!");
	} else {
		System.out.println("Failed to create directory!");
	}
}

//++++++++++++++++++++++++++=Task2



String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
          DataInputStream in = new DataInputStream(request.getInputStream());
          
          int formDataLength = request.getContentLength();
          byte dataBytes[] = new byte[formDataLength];
          int byteRead = 0;
          int totalBytesRead = 0;
          while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
                  }
          String filex = new String(dataBytes);
         
          saveFile = filex.substring(filex.indexOf("filename=\"") + 10);
          saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
          saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
          int lastIndex = contentType.lastIndexOf("=");
          String boundary = contentType.substring(lastIndex + 1,contentType.length());
          int pos;
          pos = filex.indexOf("filename=\"");
          pos = filex.indexOf("\n", pos) + 1;
          pos = filex.indexOf("\n", pos) + 1;
          pos = filex.indexOf("\n", pos) + 1;
          int boundaryLocation = filex.indexOf(boundary, pos) - 4;
          int startPos = ((filex.substring(0, pos)).getBytes()).length;
          int endPos = ((filex.substring(0, boundaryLocation))
.getBytes()).length;
       
          FileOutputStream fileOut = new FileOutputStream("E:\\pic\\"+saveFile); 
          fileOut.write(dataBytes, startPos, (endPos - startPos));
          fileOut.flush();
          fileOut.close();
          

          }


//+++++++++++++++++++++++++++++++++++TASK3

        String path="E:\\pic\\common.txt";
		String  strLine="";
		FileInputStream fstream = new FileInputStream(path);
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));

try
	{		
	   out.println("<h2>List Updated successfull </h2>");
	   Statement st=BusConnect.Connect();
		int c=1;
		
		ArrayList A=new ArrayList();
		ArrayList B=new ArrayList();
		ArrayList C=new ArrayList();
		ArrayList D=new ArrayList();
		ArrayList E=new ArrayList();
		ArrayList F=new ArrayList();
		ArrayList G=new ArrayList();
		
		
		while((strLine=br.readLine())!=null)
		{
			
			 
			 
			 StringTokenizer tokenizer = new StringTokenizer(strLine," ");
				while(tokenizer.hasMoreTokens())
				{
					A.add(tokenizer.nextToken());
					B.add(tokenizer.nextToken());
					C.add(tokenizer.nextToken());
					D.add(tokenizer.nextToken());
					E.add(tokenizer.nextToken());
					F.add(tokenizer.nextToken());
					G.add(tokenizer.nextToken());
					
				}
			 
			 }
		
		 for(int i=0;i<A.size();i++)
	        {
				String a=A.get(i).toString();
				String b=B.get(i).toString();
				String c1=C.get(i).toString();
				String d=D.get(i).toString();
				String e=E.get(i).toString();
				String f=F.get(i).toString();
				String g=G.get(i).toString();
				
				st.executeUpdate("insert into BUSDETAILS values('"+a+"','"+b+"','"+c1+"','"+d+"','"+e+"','"+f+"','"+g+"')");
          }
		 
		 
		 ResultSet rs=st.executeQuery("select * from busdetails");
		 out.println("<table border='1'>");
		 out.println("<tr><th>BUSSERVICE</th><th>SEQ</th><th>STATION</th><th>LATITUDE</th><th>LONGITUDE</th><th>CURLocation</th><th>DESTINATION</th></tr>");
		 while(rs.next())
		 {
		 out.println("<tr>");
		 out.println("<td>"+rs.getString(1)+"</td>");
		 out.println("<td>"+rs.getString(2)+"</td>");
		 out.println("<td>"+rs.getString(3)+"</td>");
		 out.println("<td>"+rs.getString(4)+"</td>");
		 out.println("<td>"+rs.getString(5)+"</td>");
		 out.println("<td>"+rs.getString(6)+"</td>");
		 out.println("<td>"+rs.getString(7)+"</td>");
		 out.println("</tr>");
		 }
		 out.println("</table>");
		 

      out.println("<br><br><br><a href='UploadDataAdmin.jsp' style='color:blue;''>back</a>");
//++++++++++++++++++++++++++++++++Task4
}
catch(Exception e)
{
	out.println(e);
}
%>
   	  
	  </div>
	  
	  <br />
	  <br />
	  <br />
	  <br />
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
    <div class="box1">
      <h2>Uttarakhand Transport Corporation has received following awards from Association of State Road Transport Undertakings (A Govt of India body) for its performance and improvement in various parameters.</h2>
      <p><strong>2008-2009</strong></p>
      <p>&bull; Award for Vehicle Productivity - Highest Performance (Hill Service)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
  &bull; Award for Vehicle Productivity - Maximum Improvement (Hill Service)<br />
  &bull; Award for Tyre Performance - Highest Tyre Performance (Hill Service)<br />
  &bull; Award for Fuel Efficiency Highest KMPL (Hill Service)<br />
  &bull; Award for Fuel Efficiency Maximum Improvement KMPL (Hill Service)</p>
    </div>
    <div class="box contactdetails">
      <h2>Following restaurants are authorised by UTC on different Highways for basic amanities and refreshment during the journey.</h2>
      <ul>
        <li>
          <p>1.Swami Tourist Dhaba, Garh Mukteswar</p>
          <p>2.Mela Restaurant, Gajrola</p>
          <p>3.Swami Shidhi Vinayak Enterprizes(Bikanerwala), Gajrola</p>
          <p>4.Swami Invitation Restaurant, Garh Mukteswar</p>
        </li>
      </ul>
    </div>
    <div class="box flickrbox">
      <h2>Our Bus</h2>
      <div class="wrap">
        <div class="fix"></div>
        <div class="flickr_badge_image" id="flickr_badge_image1"><a href="#"><img src="images/demo/1.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image2"><a href="#"><img src="images/demo/2.jpg" alt="" height="50px" width="50px" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image3"><a href="#"><img src="images/demo/3.jpg" alt="" height="50px" width="50px" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image4"><a href="#"><img src="images/demo/4.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image5"><a href="#"><img src="images/demo/5.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image6"><a href="#"><img src="images/demo/1.jpg" alt="" height="50px" width="50px"/></a></div>
        <div class="fix"></div>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left"> <a href="#"></a></p>
    <p class="fl_right"><a href="http://www.os-templates.com/" title="Free Website Templates"></a></p>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<script type="text/javascript" src="scripts/toggle.js"></script>
</body>
</html>
