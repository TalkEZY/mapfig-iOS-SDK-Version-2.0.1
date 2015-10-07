//
//  MfMarker.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

class MfMarker: MfShape {
    
    private var latitude: Double = 0
    private var longitude: Double = 0
    
    init(latitude:Double, longitude:Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getLatitude() -> Double {
        return self.latitude;
    }
    
    func getLongitude() -> Double {
        return self.longitude;
    }
    
    func setLatLng(address: String) {
        let geo = MfGeoLocation()
        let p = geo.get(address)
        
        self.latitude = p.getX()
        self.longitude = p.getY()
    }
    
    func getWholeDataArray() -> NSDictionary {
        var data = [
            "latitude" : self.latitude,
            "longitude": self.longitude,
            "location" : self.getLocation(),
            "description": self.getDescription(),
            "showGetDirection": self.getShowGetDirection(),
            "showInfoBox": self.getShowInfoBox(),
            "showLocationOnPopup": self.getShowLocationOnPopup(),
            "hideLabel": self.getHideLabel(),
            "markerStyle": self.getMarkerStyle(),
            "markerColor": self.getMarkerColor()
        ]
        
        return data
    }
}