<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ibm.dao.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service</title>
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
  var chicago = new google.maps.LatLng(28.6100, 77.2300);
  var mapOptions = {
    zoom:7,
    center: chicago
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
}

function calcRoute() {
  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
  var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="panel">
    <b>Start: </b>
    
    <%
        Statement st=BusConnect.Connect();
        Statement st1=BusConnect.Connect();
        ResultSet rs=st.executeQuery("select * from busdetails");
        ResultSet rs1=st1.executeQuery("select * from busdetails");
        
        out.println("<select id='start' onchange='calcRoute();'>");
        while(rs.next())
        {
        out.println("<option value='"+rs.getString(3)+"'>"+rs.getString(3)+"</option>");
        }
        out.println("</select>");
        out.println("<b>End: </b>");
        out.println("<select id='end' onchange='calcRoute();'>");
        while(rs1.next())
        {
        	out.println("<option value='"+rs1.getString(3)+"'>"+rs1.getString(3)+"</option>");
        }
        out.println("</select>");
        
        
    
    %>
    </div>
    <div id="map-canvas"></div>
  </body>
</html>