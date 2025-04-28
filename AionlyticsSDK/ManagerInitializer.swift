//
//  ManagerInitializer.swift
//  AionlyticsSDK
//
//  Created by Admin on 28/04/2025.
//

import Foundation

internal class ManagerInitializer {
    
    /**
     Defined your-Managers inside SDK
     - AnalyticsManager
     */
    //MARK: Managers
    internal var analyticsManager: AnalyticsManager!
    
    /**
     Defined your-plugins inside SDK
     - Firebase  plugin
     */
    //MARK: Plugins
    private let firebase = FirebaseAnalyticsPlugin()
    
    init(environment:Environment, appContext:AppContext?) {
        self.analyticsManager = AnalyticsManager()
    }
    
    /**
     Register your-plugins inside SDK
     - Analytics  plugins
     */
    //MARK: Register Analytics
    func reigsterPlugins() {
        self.registerAnalytics()
    }
    
    
    //MARK: Analytics
    private func registerAnalytics() {
        analyticsManager.register(plugin: firebase)
    }
}
