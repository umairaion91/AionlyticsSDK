//
//  AionlyticsSDK.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation

public class AnalyticsSDK {
    
    public static let shared = AnalyticsSDK()
    private var managerInitiliazer: ManagerInitializer!
    private var ready:Bool = false
    private var loadInProgress:Bool = false
    
    
    /**
     Initialiazes the SDK with the given environment
     - parameter environment: Environment to use
     - parameter appContext: Application launch parameters
     */
    
    public func initialize(environment:Environment, appContext:AppContext?) {
        if ready || loadInProgress {
            print("SDK is already initialized")
            return
        }
        self.managerInitiliazer = ManagerInitializer(environment: environment, appContext: appContext)
    }
    
    private init () {
       
    }
    
    public func start() {
        self.managerInitiliazer.reigsterPlugins()
    }
    
    public func stop() {
        
    }
}

public extension AnalyticsSDK {
    
    var manager: AnalyticsManager {
        return managerInitiliazer.analyticsManager
    }
}


