//
//  main.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation

var api:MfMapFigApplication = MfMapFigApplication(studioURL: "https:/studio.mapfig.com", apiKey: "Za40iR62wtzc8HWs4TgJhNSI8_wRcqMa")

var map = api.get(491); // it'll return the Map Object. 491 is the user's MapId
println(map!.getWholeDataArray());
