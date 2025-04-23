//
//  AionlyticsPlugin.swift
//  AionlyticsSDK
//
//  Created by Admin on 18/04/2025.
//

public protocol AnalyticsPlugin {
    func start(httpMetrics: AnalyticsHttpMetric)
    func start(trace name: String)
    func stop(trace name: String)
    func track(event: AnalyticsEvent, params: AnalyticsParams)
}
