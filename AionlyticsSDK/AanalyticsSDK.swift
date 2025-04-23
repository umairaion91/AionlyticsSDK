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
    
    //MARK: Plugins
    private let firebase = FirebaseAnalyticsPlugin()
    // private let mixPanel = MixplanelAnalyticsPlugin()
    // private let oneSignal = OneSignalAnalyticsPlugin()
    // private let customLogger = CustomLoggerPlugin()
    
    private init () {
        self.managerInitiliazer = ManagerInitializer()
    }
    
    public func start() {
        managerInitiliazer.analyticsManager.register(plugin: firebase)
        //managerInitiliazer.analyticsManager.register(plugin: mixPanel)
        //managerInitiliazer.analyticsManager.register(plugin: oneSignal)
        //managerInitiliazer.analyticsManager.register(plugin: customLogger)
    }
    
    public func stop() {
        managerInitiliazer.analyticsManager.stop(trace: "firebase")
    }
}

public extension AnalyticsSDK {
    
    var manager: AnalyticsManager {
        return managerInitiliazer.analyticsManager
    }
}


