//
//  MfHttpClient.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation


class MfHttpClient {
    
    private var url:String = ""
    
    init(url: String) {
        self.url = url;
    }
    
    func sendPOST(parameter: String) -> NSDictionary {
        
        let urlPath: String = self.url
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request1.HTTPMethod = "POST"
        var stringPost=parameter // Key and Value
        
        let data = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
        
        request1.timeoutInterval = 60
        request1.HTTPBody=data
        request1.HTTPShouldHandleCookies=false
        
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse? >= nil
        var error: NSErrorPointer = nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        
        var err: NSError
        //println(response)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        //println("Synchronous \(jsonResult)")
        
        return jsonResult
    }
}