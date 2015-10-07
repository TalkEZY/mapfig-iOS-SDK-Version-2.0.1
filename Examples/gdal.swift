//
//  main.swift
//  MapFigSDK
//
//  Created by Muaaz Khalid on 9/16/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

var api:MfMapFigApplication = MfMapFigApplication(studioURL: "YOUR_STUDIO_URL", apiKey: "Za40iR62wtzc8HWs4TgJhNSI8_wRcqMa")

/*
var request: String = "ogr2ogr"; // gdal_translate, ogr2ogr, ogrinfo
var options: String = "-f \"GeoJSON\""; // optional for request = ogrinfo
var sourceFileURL: String = "https://developers.google.com/kml/documentation/KML_Samples.kml";
var targetFileExtension: String = "json"; // (not required for request = ogrinfo)
*/


var request: String = "ogrinfo"; // gdal_translate, ogr2ogr, ogrinfo
var options: String = "";
var sourceFileURL: String = "https://developers.google.com/kml/documentation/KML_Samples.kml";

/* targetFileExtension is optional for ogrinfo
var gdal: MfGdal = MfGdal(request: request, options: options, sourceFileURL: sourceFileURL ,targetFileExtension: targetFileExtension);
*/

var gdal: MfGdal = MfGdal(request: request, options: options, sourceFileURL: sourceFileURL);

var output: NSDictionary = api.getGDALData(gdal); // it'll return the Map Object. 424 is the user's MapId

println(output);