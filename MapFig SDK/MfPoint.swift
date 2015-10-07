//
//  MfPoint.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

class MfPoint {
    
    private var x: Double
    private var y: Double
    
    init(x:Double, y:Double) {
        self.x = x
        self.y = y
    }
    
    func getX() -> Double {
        return self.x
    }
    
    func getY() -> Double {
        return self.y
    }
    
    func setLatLng(address: String) {
        let geo = MfGeoLocation()
        let p = geo.get(address)
        
        self.x = p.getX()
        self.y = p.getY()
    }
}