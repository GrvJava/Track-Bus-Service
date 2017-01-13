<%@ page import="java.sql.*" %>
<%@ page import="com.ibm.dao.*" %>
<% response.setIntHeader("REFRESH",30); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>OnlineFolio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/mootools.js"></script>

   
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var chicago = new google.maps.LatLng(41.850033, -87.6500523);
  var mapOptions = {
    zoom: 6,
    center: chicago
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
  calcRoute();
}

function calcRoute() {

  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
  var waypoint=document.getElementById('waypoints').value;
  
  var waypts = [];
  var checkboxArray = document.getElementById('waypoints');
  
 
      waypts.push({
          location:waypoint,
          stopover:true});
  

  var request = {
      origin: start,
      destination: end,
      waypoints: waypts,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      var route = response.routes[0];
      var summaryPanel = document.getElementById('directions_panel');
      summaryPanel.innerHTML = '';
      // For each route, display summary information.
      for (var i = 0; i < route.legs.length; i++) {
        var routeSegment = i + 1;
        summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + '</b><br>';
        summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
      }
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
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
      <div id="map-canvas" style="float:left;width:50%;height:80%;margin-top:100px;margin-left:100px;"></div>
    <div id="control_panel" style="float:right;width:30%;text-align:left;padding-top:20px;margin-top:70px;">
    <div style="margin:20px;border-width:2px;">
    <b>Bus Service Number</b>
    <%
        Statement st=BusConnect.Connect();
        Statement st1=BusConnect.Connect();
        ResultSet rs=st.executeQuery("select * from busdetails");
        
        out.println("<form method='post' action='waypointSample.jsp'>");
        out.println("<table border='0'><tr><td>");
        out.println("<select name='busservice'>");
        while(rs.next())
        {
        out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
        }
        out.println("</select></td><td>");
        out.println("<input type='submit' value='view'>");
        out.println("</td></tr></table>");
        out.println("</form>");
        String busservice=request.getParameter("busservice");
        ResultSet rs1=st1.executeQuery("select * from busdetails where busservice='"+busservice+"'");
        //out.println("<form method='post' action='UpdateData'>");
        out.println("<table border='0'>");
        while(rs1.next())
        {
        
        out.println("<tr><td><b>BusService</td><td>"+rs1.getString(1)+"<input type='hidden' name='service' value='"+rs1.getString(1)+"'/></td></tr>");
        out.println("<tr><td><b>SEQ</td><td>"+rs1.getString(2)+"</td></tr>");
        out.println("<tr><td><b>STATION</td><td>"+rs1.getString(3)+"<input type='hidden'  name='station' value='"+rs1.getString(3)+"'></td></tr>");
        out.println("<tr><td><b>LATITUDE</td><td>"+rs1.getString(4)+"<input type='hidden' name='lati' value='"+rs1.getString(4)+"'></td></tr>");
        out.println("<tr><td><b>LONGITUDE</td><td>"+rs1.getString(5)+"<input type='hidden' name='longi' value='"+rs1.getString(5)+"'></td></tr>");
        out.println("<tr><td><b>CURRENT LOCATION</td><td>"+rs1.getString(6)+"<input type='hidden'  name='curl' value='"+rs1.getString(6)+"'></td></tr>");
        out.println("<tr><td><b>DESTINATION</td><td>"+rs1.getString(7)+"<input type='hidden'  name='des' value='"+rs1.getString(7)+"'></td></tr>");
        
        session.setAttribute("bus",rs1.getString(1));
        session.setAttribute("start",rs1.getString(3));
        session.setAttribute("end",rs1.getString(7));
        session.setAttribute("waypoints",rs1.getString(6));
        
        }
        out.println("</table><br>");
        
        if(session.getAttribute("bus")!=null)
        {
        String Bus=(String)session.getAttribute("bus");
        String A=(String)session.getAttribute("start");
        String B=(String)session.getAttribute("end");
        String C=(String)session.getAttribute("waypoints");
        out.println("<font color='green'><b>Bus Service:    "+Bus+"<input type='hidden'  name='station' value='"+Bus+"'><br>");
        out.println("<font color='green'><b>Start:    "+A+"<input type='hidden' id='start' name='station' value='"+A+"'><br>");
        out.println("<font color='green'><b>End:    "+B+"<input type='hidden' id='end' name='station' value='"+B+"'><br>");
        out.println("<font color='green'><b>Current Loaction:    "+C+"<input type='hidden' id='waypoints' name='station' value='"+C+"'><br>");
        }
        out.println("<input type='submit' onclick='calcRoute();'>");
       // out.println("</form>");
        
       
        
        
    
    %>
    <br>
     
    </div>
    <div id="directions_panel" style="margin:20px;background-color:#FFEE77;"></div>
    </div>
	
	
	</h1>
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
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<script type="text/javascript" src="scripts/toggle.js"></script>
</body>
</html>
