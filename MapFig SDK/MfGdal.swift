//
//  MfGdal.swift
//  MapFigSDK
//
//  Created by Muaaz Khalid on 9/16/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

class MfGdal {
    var request: String = "";
    var options: String = "";
    var sourceFileURL: String = "";
    var targetFileExtension: String = "";
    
    init(request: String, options: String, sourceFileURL: String) {
        self.request             = request;
        self.options             = options;
        self.sourceFileURL       = sourceFileURL;
        self.targetFileExtension = "";
    }
    
    init(request: String, options: String, sourceFileURL: String, targetFileExtension: String) {
        self.request             = request;
        self.options             = options;
        self.sourceFileURL       = sourceFileURL;
        self.targetFileExtension = targetFileExtension;
    }
    
    func getRequest() -> String {
        return self.request;
    }
    
    func getOptions() -> String{
        return self.options;
    }
    
    func getSourceFileURL() -> String{
        return self.sourceFileURL;
    }
    
    func getTargetFileExtension() -> String{
        return self.targetFileExtension;
    }
}