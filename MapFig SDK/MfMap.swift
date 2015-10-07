//
//  MfMap.swift
//  MapFig SDK
//
//  Created by Muaaz Khalid on 8/24/15.
//  Copyright (c) 2015 MapFig Inc. All rights reserved.
//

import Foundation


class MfMap {
    
    private var id: Int = 0;
    private var name: String = "";
    private var height: Int = 550;
    private var width: Int = 950;
    private var zoom: Int = 4;
    private var center: MfPoint; //Point of (Latitude,Lonitude)
    
    private var layerId: Int = 1;
    private var groupId: Int = 0;
    private var buttonStyle: String = "default";
    private var password: String = "";
    private var useCluster: Bool = false;
    private var overlayEnable: Bool = false;
    private var overlayTitle: String = "";
    private var overlayBlurb: String = "";
    private var overlayContent: String = "";
    private var legendEnable: Bool = false;
    private var legendContent: String = "";
    private var projectId: Int = 0;
    private var showSidebar: Bool = true;
    private var showExport: Bool = false;
    private var showMeasure: Bool = false;
    private var showMinimap: Bool = false;
    private var showSearch: Bool = false;
    private var showFilelayer: Bool = false;
    private var showSvg: Bool = false;
    private var showStaticSidebar: Bool = false;
    private var staticSidebarContent: String = "";
    
    private var markers = [MfMarker]();
    private var imageOverlays = [MfImageOverlay]();
    
    init(name: String, height: Int, width: Int, zoom: Int, center: MfPoint) {
        self.name = name
        self.height = height
        self.width = width
        self.zoom = zoom
        self.center = center
    }
    
    func addShape(marker: MfMarker) {
        markers.append(marker)
    }
    
    func dropAllShapes() {
        markers = []
    }
    
    func addImageOverlay(imageOverlay: MfImageOverlay) {
        imageOverlays.append(imageOverlay)
    }
    
    func dropAllImageOverlays() {
        imageOverlays = []
    }
    
    func getWholeDataArray() -> NSDictionary {
        
        var Markers = [NSDictionary]();
        for marker in markers {
            Markers.append(marker.getWholeDataArray())
        }
        
        var ImageOverlays = [NSDictionary]();
        for io in imageOverlays {
            ImageOverlays.append(io.getWholeDataArray())
        }
        
        var map = [
            "id": self.id,
            "name": self.name,
            "height" : self.height,
            "width": self.width,
            "zoom": self.zoom,
            "centerLatitude": self.center.getX(),
            "centerLongitude": self.center.getY(),
            "layerId": self.layerId,
            "groupId": self.groupId,
            "buttonStyle": self.buttonStyle,
            "password": self.password,
            "useCluster": self.useCluster,
            "overlayTitle": self.overlayTitle,
            "overlayEnable": self.overlayEnable,
            "overlayContent": self.overlayContent,
            "overlayBlurb": self.overlayBlurb,
            "legendContent": self.legendContent,
            "legendEnable": self.legendEnable,
            "projectId": self.projectId,
            "showExport": self.showExport,
            "showFilelayer": self.showFilelayer,
            "showMeasure": self.showMeasure,
            "showMinimap": self.showMinimap,
            "showSearch": self.showSearch,
            "showSidebar": self.showSidebar,
            "showStaticSidebar": self.showStaticSidebar,
            "showSvg": self.showSvg,
            "staticSidebarContent": self.staticSidebarContent,
            "markers": Markers,
            "imageOverlays" : ImageOverlays
        ]
        
        
        
        return map
    }
    
    
    func getId() -> Int {
        return id;
    }
    
    func setId(id: Int) {
        self.id = id;
    }
    
    func getName() -> String {
        return name;
    }
    
    func setName(name: String) {
        self.name = name;
    }
    
    func getHeight() -> Int {
        return height;
    }
    
    func setHeight(height: Int) {
        self.height = height;
    }
    
    func getWidth() -> Int {
        return width;
    }
    
    func setWidth(width: Int) {
        self.width = width;
    }
    
    func getZoom() -> Int {
        return zoom;
    }
    
    func setZoom(zoom: Int) {
        self.zoom = zoom;
    }
    
    func getCenter() -> MfPoint {
        return center;
    }
    
    func setCenter(center: MfPoint) {
        self.center = center;
    }
    
    func getLayerId() -> Int {
        return layerId;
    }
    
    func setLayerId(layerId: Int) {
        self.layerId = layerId;
    }
    
    func getGroupId() -> Int {
        return groupId;
    }
    
    func setGroupId(groupId: Int) {
        self.groupId = groupId;
    }
    
    func getButtonStyle() -> String {
        return buttonStyle;
    }
    
    func setButtonStyle(buttonStyle: String) {
        self.buttonStyle = buttonStyle;
    }
    
    func getPassword() -> String {
        return password;
    }
    
    func setPassword(password: String) {
        self.password = password;
    }
    
    func getUseCluster() -> Bool {
        return useCluster;
    }
    
    func setUseCluster(useCluster: Bool) {
        self.useCluster = useCluster;
    }
    
    func getOverlayEnable() -> Bool {
        return overlayEnable;
    }
    
    func setOverlayEnable(overlayEnable: Bool) {
        self.overlayEnable = overlayEnable;
    }
    
    func getOverlayTitle() -> String {
        return overlayTitle;
    }
    
    func setOverlayTitle(overlayTitle: String) {
        self.overlayTitle = overlayTitle;
    }
    
    func getOverlayBlurb() -> String {
        return overlayBlurb;
    }
    
    func setOverlayBlurb(overlayBlurb: String) {
        self.overlayBlurb = overlayBlurb;
    }
    
    func getOverlayContent() -> String {
        return overlayContent;
    }
    
    func setOverlayContent(overlayContent: String) {
        self.overlayContent = overlayContent;
    }
    
    func getLegendEnable() -> Bool {
        return legendEnable;
    }
    
    func setLegendEnable(legendEnable: Bool) {
        self.legendEnable = legendEnable;
    }
    
    func getLegendContent() -> String {
        return legendContent;
    }
    
    func setLegendContent(legendContent: String) {
        self.legendContent = legendContent;
    }
    
    func getProjectId() -> Int {
        return projectId;
    }
    
    func setProjectId(projectId: Int) {
        self.projectId = projectId;
    }
    
    func getShowSidebar() -> Bool {
        return showSidebar;
    }
    
    func setShowSidebar(showSidebar: Bool) {
        self.showSidebar = showSidebar;
    }
    
    func getShowExport() -> Bool {
        return showExport;
    }
    
    func setShowExport(showExport: Bool) {
        self.showExport = showExport;
    }
    
    func getShowMeasure() -> Bool {
        return showMeasure;
    }
    
    func setShowMeasure(showMeasure: Bool) {
        self.showMeasure = showMeasure;
    }
    
    func getShowMinimap() -> Bool {
        return showMinimap;
    }
    
    func setShowMinimap(showMinimap: Bool) {
        self.showMinimap = showMinimap;
    }
    
    func getShowSearch() -> Bool {
        return showSearch;
    }
    
    func setShowSearch(showSearch: Bool) {
        self.showSearch = showSearch;
    }
    
    func getShowFilelayer() -> Bool {
        return showFilelayer;
    }
    
    func setShowFilelayer(showFilelayer: Bool) {
        self.showFilelayer = showFilelayer;
    }
    
    func getShowSvg() -> Bool {
        return showSvg;
    }
    
    func setShowSvg(showSvg: Bool) {
        self.showSvg = showSvg;
    }
    
    func getShowStaticSidebar() -> Bool {
        return showStaticSidebar;
    }
    
    func setShowStaticSidebar(showStaticSidebar: Bool) {
        self.showStaticSidebar = showStaticSidebar;
    }
    
    func getStaticSidebarContent() -> String {
        return staticSidebarContent;
    }
    
    func setStaticSidebarContent(staticSidebarContent: String) {
        self.staticSidebarContent = staticSidebarContent;
    }
}