//
//  GeoLocation.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

class MfGeoLocation {
    
    func get(address: String) -> MfPoint {
        let urlPath: String = "http://maps.google.com/maps/api/geocode/json?address="+address+"&sensor=false"
        
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse? >= nil
        var error: NSErrorPointer = nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError
        //println(response)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        //println("Synchronous \(jsonResult)")
        
        var latitude : Double  = 0
        var longitude : Double = 0
        
        if let item: AnyObject = jsonResult["status"] {
            var test:String = item as! String
            if "OK" == test {
                
                if let item: AnyObject = jsonResult["results"] {
                    if let item: AnyObject = item[0] {
                        if let item: AnyObject = item["geometry"] {
                            if let item: AnyObject = item["location"] {
                                if let lat: AnyObject = item["lat"] {
                                    let lng = item["lng"]
                                    
                                    latitude = lat as! Double
                                    longitude = lng as! Double
                                }
                            }
                        }
                    }
                }
                
            }
        }
        
        let p = MfPoint(x: latitude, y: longitude)
        
        return p
    }
    
}