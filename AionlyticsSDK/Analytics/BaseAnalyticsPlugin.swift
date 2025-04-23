//
//  BaseAionlyticsPlugin.swift
//  AionlyticsSDK
//
//  Created by Admin on 18/04/2025.
//

import Foundation


public class BaseAnalyticsPlugin: AnalyticsPlugin {
    
    public func start(httpMetrics: AnalyticsHttpMetric) { }
    
    public func start(trace name: String) { }
    
    public func stop(trace name: String) { }
    
    public func track(event: AnalyticsEvent, params: any AnalyticsParams) { }
    
    public func name() -> String {
        fatalError("Must Override BaseAionlyticsPlugin Name")
    }
    
    public func log(_ string: String) {
        
        #if DEBUG
        print("[AIONLYTICS] \(name()) >> \(string)")
        #endif
        
        
        //MARK: If Analytics logging is enabled
        NSLog("[AIONLYTICS] \(name()) >> \(string)")
    }
    
}
