//
//  AnalyticsManager.swift
//  AionlyticsSDK
//
//  Created by Admin on 18/04/2025.
//

import Foundation

public class AnalyticsManager {
    
    //MARK: All Your Plugins
    /// Firebase, OneSignal, custom Event Loger Plugins
    private var plugins = [AnalyticsPlugin]()
    
    //MARK:  Register the plugin for analytics
    public func register(plugin: AnalyticsPlugin) {
        plugins.append(plugin)
    }
    
    //MARK: Start analytics plugins
    internal func start() -> AnalyticsHttpMetric {
        let metric = AnalyticsHttpMetric(request: "Request to intialise")
        self.start(httpMetric: metric)
        return metric
    }
    
    //MARK: Start HTTP Metrics for analytics plugins
    internal func start(httpMetric: AnalyticsHttpMetric) {
        for plugin in plugins {
            plugin.start(httpMetrics: httpMetric)
        }
    }
    
    //MARK: Start Trace Name for analytics plugins
    public func start(trace name: String) {
        for plugin in plugins {
            plugin.start(trace: name)
        }
    }
    
    //MARK: Stop Trace Name for analytics plugins
    public func stop(trace name: String) {
        for plugin in plugins {
            plugin.stop(trace: name)
        }
    }
    
    //MARK: Track events for analytics plugins
    public func track(event: AnalyticsEvent, params: AnalyticsParams) {
        for plugin in plugins {
            plugin.track(event: event, params: params)
        }
    }
}
