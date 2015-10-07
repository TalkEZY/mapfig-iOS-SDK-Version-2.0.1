//
//  MfMapFigApplication.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

class MfMapFigApplication {
    
    private var studioURL: String = ""
    private var apiKey: String = ""
    
    init(studioURL: String, apiKey: String) {
        self.studioURL = studioURL
        self.apiKey = apiKey
    }
    
    func save(map: MfMap) -> NSDictionary {
        var dataArray:NSDictionary = map.getWholeDataArray()
        
        var error: NSError?
        let data = NSJSONSerialization.dataWithJSONObject(dataArray, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
        
        if let data = data {
            let json = NSString(data: data, encoding: NSUTF8StringEncoding)
            if let json = json {
                var jsonMap = json
                var queryString:String = "apikey="+apiKey+"&map="+(jsonMap as String)
                
                var httpClient = MfHttpClient(url: self.studioURL+"/api/sdk/map/save.php")
                return httpClient.sendPOST(queryString)
            }
            else {
                fatalError("Invalid Data Passed")
            }
        }
        else {
            fatalError("Invalid data passed")
        }
    }
    
    func update(map: MfMap) -> NSDictionary {
        var dataArray:NSDictionary = map.getWholeDataArray()
        
        var error: NSError?
        let data = NSJSONSerialization.dataWithJSONObject(dataArray, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
        
        if let data = data {
            let json = NSString(data: data, encoding: NSUTF8StringEncoding)
            if let json = json {
                var jsonMap = json
                var queryString:String = "apikey="+apiKey+"&map="+(jsonMap as String)
                
                var httpClient = MfHttpClient(url: self.studioURL+"/api/sdk/map/update.php")
                return httpClient.sendPOST(queryString)
            }
            else {
                fatalError("Invalid Data Passed")
            }
        }
        else {
            fatalError("Invalid data passed")
        }
    }
    
    
    func get(id: Int) -> MfMap? {
        
        var queryString: String = "apikey="+apiKey+"&id="+String(id);
        var client: MfHttpClient = MfHttpClient(url: self.studioURL+"/api/sdk/map/get.php");
        
        var response: NSDictionary = client.sendPOST(queryString);
        
        
        if let item: AnyObject = response["success"] {
            var test:Bool = item as! Bool
            
            if test == true {
                
                if let message: AnyObject = response["message"] {
                    let jsonStr: String = response["message"] as! String;
                    
                    var data = jsonStr.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)
                    var localError: NSError?
                    var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &localError)
                    
                    if json == nil {
                        return nil
                    }
                    
                    var name: AnyObject = json;
                    
                    
                    if let item: AnyObject = json {
                        var tempStr: String;
                        
                        var id = item["id"] as! Int
                        let name = item["name"] as! String
                        
                        tempStr = item["height"] as! String
                        let height = tempStr.toInt()
                        
                        tempStr = item["width"] as! String
                        let width = tempStr.toInt()
                        
                        tempStr = item["zoom"] as! String
                        let zoom = tempStr.toInt()
                        
                        let x = item["centerLatitude"] as! Double
                        let y = item["centerLongitude"] as! Double
                        let p = MfPoint(x: x, y: y)
                        
                        var map:MfMap = MfMap(name: name, height: height!, width: width!, zoom: zoom!, center: p)
                        map.setId(item["id"] as! Int);
                        
                        tempStr = item["layerId"] as! String
                        let layerId = tempStr.toInt()
                        tempStr = item["groupId"] as! String
                        let groupId = tempStr.toInt()
                        tempStr = item["projectId"] as! String
                        let projectId = tempStr.toInt()
                        
                        map.setLayerId(layerId!)
                        map.setGroupId(groupId!)
                        map.setButtonStyle(item["buttonStyle"] as! String)
                        map.setPassword(item["password"] as! String)
                        map.setUseCluster(item["useCluster"] as! Bool)
                        map.setOverlayEnable(item["overlayEnable"] as! Bool)
                        map.setOverlayTitle(item["overlayTitle"] as! String)
                        map.setOverlayContent(item["overlayContent"] as! String)
                        map.setOverlayBlurb(item["overlayBlurb"] as! String)
                        map.setLegendEnable(item["legendEnable"] as! Bool)
                        map.setLegendContent(item["legendContent"] as! String)
                        map.setProjectId(projectId!)
                        map.setShowSidebar(item["showSidebar"] as! Bool)
                        map.setShowExport(item["showExport"] as! Bool)
                        map.setShowMeasure(item["showMeasure"] as! Bool)
                        map.setShowMinimap(item["showMinimap"] as! Bool)
                        map.setShowSearch(item["showSearch"] as! Bool)
                        map.setShowFilelayer(item["showFilelayer"] as! Bool)
                        map.setShowSvg(item["showSvg"] as! Bool)
                        map.setShowStaticSidebar(item["showStaticSidebar"] as! Bool)
                        map.setStaticSidebarContent(item["staticSidebarContent"] as! String)
                        
                        
                        let jsonMarkers = item["markers"] as! NSArray
                        for dataObject : AnyObject in jsonMarkers {
                            if let data = dataObject as? NSDictionary {
                                let x = data["latitude"] as! Double
                                let y = data["longitude"] as! Double
                                var markerObject = MfMarker(latitude: x, longitude: y)
                                
                                markerObject.setLocation(data["location"] as! String)
                                markerObject.setDescription(data["description"] as! String)
                                markerObject.setHideLabel(data["hideLabel"] as! Bool)
                                markerObject.setShowGetDirection(data["showGetDirection"] as! Bool)
                                markerObject.setShowInfoBox(data["showInfoBox"] as! Bool)
                                markerObject.setShowLocationOnPopup(data["showLocationOnPopup"] as! Bool)
                                markerObject.setMarkerColor(data["markerColor"] as! String)
                                markerObject.setMarkerStyle(data["markerStyle"] as! String)
                                
                                map.addShape(markerObject)
                            }
                        }
                        
                        
                        
                        let jsonStr: String = item["imageOverlays"] as! String;
                        
                        var jsonIO = jsonStr.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)
                        var localError: NSError?
                        var jsonImageOverlays: AnyObject! = NSJSONSerialization.JSONObjectWithData(jsonIO!, options: NSJSONReadingOptions.MutableContainers, error: &localError)
                        
                        if jsonImageOverlays == nil {
                            return nil
                        }
                        
                        
                        var jsonImageArray = jsonImageOverlays as! NSArray;
                        for dataObj : AnyObject in jsonImageArray {
                            if let data = dataObj as? NSDictionary {
                                
                                var name: String = data["name"] as! String
                                var src: String = data["src"] as! String
                                var popupcontent: String = data["popupcontent"] as! String
                                
                                
                                
                                let jsonStr1: String = data["bounds"] as! String;
                                
                                var jsonRes = jsonStr1.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)
                                var localError: NSError?
                                var bounds: AnyObject! = NSJSONSerialization.JSONObjectWithData(jsonRes!, options: NSJSONReadingOptions.MutableContainers, error: &localError)
                                
                                if bounds == nil {
                                    return nil
                                }
                                
                                var boundsArray = bounds as! NSArray;
                                
                                var boundA: AnyObject = boundsArray[0]
                                var boundB: AnyObject = boundsArray[1]
                                
                                var p1 = MfPoint(x: (boundA[0] as! Double), y: (boundA[1] as! Double));
                                var p2 = MfPoint(x: (boundB[0] as! Double), y: (boundB[1] as! Double));
                                
                                let ioObject = MfImageOverlay(name: name, upperRightCornor: p1, bottomLeftCornor: p2, imageURL: src, popupContent: popupcontent);
                                
                                map.addImageOverlay(ioObject);
                            }
                        }
                        
                        return map
                        
                    }
                    
                    return nil
                }
            }
            else {
                return nil
            }
            
        }
        else {
            return nil
        }
        
        return nil
    }
    
    func getGDALData(gdal: MfGdal) -> NSDictionary {
        var httpClient = MfHttpClient(url: self.studioURL+"/api/sdk/gdal/get.php")
        
        var queryString: String = "apikey="+apiKey+"&request="+gdal.getRequest()+"&options="+gdal.getOptions()+"&sourceFileURL="+gdal.getSourceFileURL()+"&targetFileExtension="+gdal.getTargetFileExtension();
        
        return httpClient.sendPOST(queryString)
    }
    
}