//
//  BaseAionlyticsPlugin.swift
//  AionlyticsSDK
//
//  Created by Admin on 18/04/2025.
//

import Foundation


public class BaseAionlyticsPlugin: AionlyticsPlugin {
    
    public func start(httpMetrics: AionlyticsHttpMetric) { }
    
    public func start(trace name: String) { }
    
    public func stop(trace name: String) { }
    
    public func track(event: AionlyticsEvent, params: any AionlyticsParams) { }
    
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
