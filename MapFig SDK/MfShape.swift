//
//  MfShape.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

class MfShape {
    
    /* Properties */
    private var location: String = ""
    private var description: String = ""
    
    /* Advance */
    private var showGetDirection: Bool = false
    private var showInfoBox: Bool = false
    private var showLocationOnPopup: Bool = true
    private var hideLabel: Bool = true
    
    /* Styling */
    private var markerStyle: String = ""
    private var markerColor: String = ""
    
    init() {
        
    }
    
    func getLocation() -> String {
        return location;
    }
    func setLocation(location: String) {
        self.location = location;
    }
    func getDescription() -> String {
        return description;
    }
    func setDescription(description: String) {
        self.description = description;
    }
    func getShowGetDirection() -> Bool {
        return showGetDirection;
    }
    func setShowGetDirection(showGetDirection: Bool) {
        self.showGetDirection = showGetDirection;
    }
    func getShowInfoBox() -> Bool {
        return showInfoBox;
    }
    func setShowInfoBox(showInfoBox: Bool) {
        self.showInfoBox = showInfoBox;
    }
    func getShowLocationOnPopup() -> Bool {
        return showLocationOnPopup;
    }
    func setShowLocationOnPopup(showLocationOnPopup: Bool) {
        self.showLocationOnPopup = showLocationOnPopup;
    }
    func getHideLabel() -> Bool {
        return hideLabel;
    }
    func setHideLabel(hideLabel: Bool) {
        self.hideLabel = hideLabel;
    }
    func getMarkerStyle() -> String {
        return markerStyle;
    }
    func setMarkerStyle(markerStyle: String) {
        self.markerStyle = markerStyle;
    }
    func getMarkerColor() -> String {
        return markerColor;
    }
    func setMarkerColor(markerColor: String) {
        self.markerColor = markerColor;
    }
}