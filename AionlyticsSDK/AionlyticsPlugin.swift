//
//  AionlyticsPlugin.swift
//  AionlyticsSDK
//
//  Created by Admin on 18/04/2025.
//

public protocol AionlyticsPlugin {
    func start(httpMetrics: AionlyticsHttpMetric)
    func start(trace name: String)
    func stop(trace name: String)
    func track(event: AionlyticsEvent, params: AionlyticsParams)
}

public protocol AionlyticsScreen { }
public protocol AionlyticsAction { }
public protocol AionlyticsError { }

public enum AionlyticsEvent {
    case screen(_ with: AionlyticsScreen)
    case action(_ with: AionlyticsAction)
    case click(_ with: AionlyticsAction)
    case error(_ with: AionlyticsError)
}

public protocol AionlyticsParam {
    func desc() -> String
}

public extension AionlyticsParam where Self: RawRepresentable {
    func desc() -> String  {
        return self.rawValue as! String
    }
}

public protocol AionlyticsParams {
    var params: [String: Any] { get set}
}

public extension AionlyticsParams {
    func extract<T>(_ key: AionlyticsParam) -> T? {
        return params[key.desc()] as? T
    }
}
