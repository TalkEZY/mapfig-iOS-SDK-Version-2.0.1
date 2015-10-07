//
//  main.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

var api:MfMapFigApplication = MfMapFigApplication(studioURL: "https:/studio.mapfig.com", apiKey: "Za40iR62wtzc8HWs4TgJhNSI8_wRcqMa")



var mapName: String = "My Map"
var mapHeight: Int = 450
var mapWidth: Int = 950
var mapZoom: Int = 4
var mapCenter:MfPoint = MfPoint(x: 48.856614, y: 2.3522219); // Latitude, Longitude
/*
* -- Alternative Way --
* var mapCenter:MfPoint = MfPoint(x: 0, y:0);
*       *
*       * get the Latitude/Longitude in array by providing the Address.
*       *
*      mapCenter.setLatLng("United States of America"); // Sets the Point(Lat,Lng)
*/

var map = MfMap(name: mapName, height: mapHeight, width: mapWidth, zoom: mapZoom, center: mapCenter);

/* These are not required unless you want to change something.
* the Default value is set weather or not you write them here.
*/

map.setLayerId(1);  // Default 1 or change it to the account owner's layer ID
map.setGroupId(0);  // Default 0 or change it to the account owner's layer group ID
map.setPassword("");  // Default NONE or change it to the Desire Password to protact the Map
map.setUseCluster(false);  // Default false
map.setOverlayEnable(false);  // Default false
map.setOverlayTitle("");  // Default NONE
map.setOverlayContent("");  // Default NONE
map.setOverlayBlurb("");  // Default NONE
map.setLegendEnable(false);  // Default false
map.setLegendContent("HTML content here");  // Default NONE
map.setProjectId(0);    // Default 0 or change it to the account owner's project ID
map.setShowSidebar(true);  // Default true
map.setShowExport(false);  // Default false
map.setShowMeasure(false);  // Default false
map.setShowMinimap(false);  // Default false
map.setShowSearch(false);  // Default false
map.setShowFilelayer(false);  // Default false // shows local file upload button
map.setShowSvg(false);  // Default false
map.setShowStaticSidebar(false);  // Default false
map.setStaticSidebarContent("");  // Default NONE

/* Add Image Overlay */
var name = "Overlay Title goes here"; // will not be displayed

var upperRightCornor = MfPoint(x: 0.0, y: 0.0); // Upper Right Cornor Of Overlay Image
upperRightCornor.setLatLng("Canada");

var bottomLeftCornor = MfPoint(x: 0.0, y: 0.0); // Bottom Left Cornor Of image
bottomLeftCornor.setLatLng("United State Of America");

var imageUrl = "http://www.YOUR_IMAGE_URL.com/PATH.JPG";
var popupContent = "<h3>Image Overlay Content here<h3>";

var imageOverlay1 = MfImageOverlay(name: name, upperRightCornor: upperRightCornor, bottomLeftCornor: bottomLeftCornor, imageURL: imageUrl, popupContent: popupContent); // Create the overlay

map.addImageOverlay(imageOverlay1); // Add as many overlays as you want

//map.dropAllImageOverlays(); // If you want to delete all image overlays
/* End Map options */



/* Create First Marker */
var marker1:MfMarker = MfMarker(latitude: 48.856614, longitude: 2.3522219000000177);
/* Properties */
marker1.setLocation("Paris, France");
marker1.setDescription("<p>This is where you can write the <strong>HTML</strong> code too</p>");
/* Advance Properties */
marker1.setShowGetDirection(false);
marker1.setShowInfoBox(false);
marker1.setShowLocationOnPopup(true);
marker1.setHideLabel(true);
/* Styling */
marker1.setMarkerStyle(""); // Default NONE, available options are (user,cog,leaf,home,.....)
// Complete list can be found here http://fortawesome.github.io/Font-Awesome/icons/
marker1.setMarkerColor(""); // Default NONE, available options are
// (Red,Blue,Green,Purple,Orange,Darkred,Lightred,Beige,Darkblue,Darkpurple,White,
//  Pink,Lightblue,Lightgreen,Gray,Black,cadetblue,Brown,Lightgray)




/* Create Second Marker */
var marker2:MfMarker = MfMarker(latitude: 0, longitude: 0);
/*
* set the Latitude/Longitude by providing the Address.
*/
marker2.setLatLng("Germany");


/* Properties */
//marker2.setLocation("Germany"); // Here Default location is Set as
// "Paris, France". but you can still change it to your desired.
// Just uncomment the link and Set the Value
marker2.setDescription("<p>This is where you can write the <strong>HTML</strong> code too</p>");
/* Advance Properties */
marker2.setShowGetDirection(false);
marker2.setShowInfoBox(false);
marker2.setShowLocationOnPopup(true);
marker2.setHideLabel(true);
/* Styling */
marker2.setMarkerStyle("home"); // Default NONE, available options are (user,cog,leaf,home,.....)
// Complete list can be found here http://fortawesome.github.io/Font-Awesome/icons/
marker2.setMarkerColor("red"); // Default NONE, available options are
// (Red,Blue,Green,Purple,Orange,Darkred,Lightred,Beige,Darkblue,Darkpurple,White,
//  Pink,Lightblue,Lightgreen,Gray,Black,cadetblue,Brown,Lightgray)


/* Add Markers to the Map */
map.addShape(marker1);
map.addShape(marker2);


// Save the map and get the MapID if successfully saved
var response: NSDictionary = api.save(map);


// TODO with Response.
println(response);
