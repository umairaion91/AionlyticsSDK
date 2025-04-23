//
//  AionlyticsSDK.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation

internal class ManagerInitializer {
    
    internal var analyticsManager: AnalyticsManager!
    
    init() {
        self.analyticsManager = AnalyticsManager()
    }
}

public class AnalyticsSDK {
    
    public static let shared = AnalyticsSDK()
    
    private var managerInitiliazer: ManagerInitializer!
    
    private init () {
        self.managerInitiliazer = ManagerInitializer()
    }
    
    public func start() {
        let firebase = FirebaseAnalyticsPlugin()
        managerInitiliazer.analyticsManager.register(plugin: firebase)
    }
}

public extension AnalyticsSDK {
    
    var manager: AnalyticsManager {
        return managerInitiliazer.analyticsManager
    }
}


