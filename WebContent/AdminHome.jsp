<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>OnlineFolio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script>
</head>
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
    <h1 id="title">
	<%
            if(session.getAttribute("admin")==null)
            {
                response.sendRedirect("http://localhost:8080/SRTC/AdminLogin.jsp");   
               
            }   
      out.println("<font color='green'><h3>welcome <font color='red'><h4>   "+session.getAttribute("admin"));
      
      out.println("<div style='float:right'><a href='logout.jsp' style='color:black;'><img src='images/demo/logout.jpg'></a></div>");
    %>
	<center>
	<div style='margin-top:100px;'>
	<a href="UpdateDataAdmin.jsp"><img src="images/demo/bus.jpg" height="100px;" width="100px;" /></a><h1 style="color:#3300FF;">Update Bus Details<br />
	<a href="UploadDataAdmin.jsp"><img src="images/demo/database.jpg" height="100px;" width="100px;" /></a><h1 style="color:#3300FF;">Update Bus Database
	</center>
	<a href="waypointjsp.jsp" style="float:right;color:black;"><h1><b>TRACK BUS</b></h1></a>
	</div>
	
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
    <p class="fl_left"><a href="#"></a></p>
    <p class="fl_right"><a href="http://www.os-templates.com/" title="Free Website Templates"></a></p>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<script type="text/javascript" src="scripts/toggle.js"></script>
</body>
</html>
