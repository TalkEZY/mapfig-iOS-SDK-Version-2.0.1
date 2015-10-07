//
//  ImageOverlay.swift
//  MapFigSDK
//
//  Created by Muaaz Khalid on 8/30/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation


class MfImageOverlay {
     
    private var upperRightCornor:MfPoint;
    private var bottomLeftCornor:MfPoint;
    private var imageURL:String         = "";
    private var popupContent:String     = "";
    private var name:String             = "";
    
    init(name: String, upperRightCornor: MfPoint, bottomLeftCornor: MfPoint, imageURL: String, popupContent: String) {
        self.name = name;
        self.upperRightCornor  = upperRightCornor;
        self.bottomLeftCornor = bottomLeftCornor;
        self.imageURL = imageURL;
        self.popupContent = popupContent;
    }
     
    func getUpperRightCornor() -> MfPoint {
        return self.upperRightCornor;
    }
    
    func getName() -> String {
        return self.name;
    }
    
    func getBottomLeftCornor() -> MfPoint {
        return self.bottomLeftCornor;
    }
    
    func getImageURL() -> String {
        return self.imageURL;
    }
    
    func getPopupContent() -> String {
        return self.popupContent;
    }
    
    func getWholeDataArray() -> NSDictionary {
        var x1: String = String(stringInterpolationSegment: self.upperRightCornor.getX());
        var y1: String = String(stringInterpolationSegment: self.upperRightCornor.getY());
        var x2: String = String(stringInterpolationSegment: self.bottomLeftCornor.getX());
        var y2: String = String(stringInterpolationSegment: self.bottomLeftCornor.getY());
        
        var data = [
            "name" : self.name,
            "src"  : self.imageURL,
            "bounds" : "[["+x1+", "+y1+"],["+x2+", "+y2+"]]",
            "popupcontent": self.popupContent
        ];
        
        return data
    }
}