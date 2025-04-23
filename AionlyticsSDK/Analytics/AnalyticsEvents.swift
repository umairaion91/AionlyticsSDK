//
//  AnalyticsEvents.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation

public protocol AnalyticsScreen { }

public protocol AionlyticsAction { }

public protocol AionlyticsError { }

public enum AnalyticsEvent {
    case screen(_ with: AnalyticsScreen)
    case action(_ with: AionlyticsAction)
    case click(_ with: AionlyticsAction)
    case error(_ with: AionlyticsError)
}
