//
//  AnalyticsHttpMetric.swift
//  AionlyticsSDK
//
//  Created by Admin on 18/04/2025.
//

import Foundation
import Network

public protocol AnalyticsHttpMetricListner {
    func complete(httpMetric: AnalyticsHttpMetric)
}

public class AnalyticsHttpMetric {
    
    public let url: String
    public let method: String // HTTP Method
    public var statusCode: Int = 0
    public var durration: Float = 0.0
    
    private var startTime: Date
    private var listeners = [AnalyticsHttpMetricListner]()
    
    //DataRequest
    internal convenience init(request: String) {
        self.init(url: request, method: request)
    }
    
    internal func complete(response: String) {
        
    }
    
    public init(url: String, method: String) {
        self.url = url
        self.method = method
        self.startTime = Date()
    }
    
    
    public func complete(statusCode: Int) {
        self.statusCode = statusCode
        self.durration = Float(Date().timeIntervalSince(startTime))
        
        while listeners.isEmpty == false {
            listeners.popLast()?.complete(httpMetric: self)
        }
    }
    
    public func register(listener: AnalyticsHttpMetricListner) {
        listeners.append(listener)
    }
}
