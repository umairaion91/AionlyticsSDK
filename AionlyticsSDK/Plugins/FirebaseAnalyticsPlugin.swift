//
//  FirebaseAnalyticsPlugin.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation

public class FirebaseAnalyticsPlugin: BaseAnalyticsPlugin {
    
    //private var traces = [String: FirebasePerformance.Trace]()
    
    private var traces = [String: String]()
    
    override init() { }
    
    override public func name() -> String { "Firebase" }
    
    public override func start(httpMetrics: AnalyticsHttpMetric) {
        //guard let url = URL(string: httpMetric.url) else { return }
        //guard let metric = HTTPMetric(url: url, httpMethod: HTTPMetric.from(httpMetric.method)) else { return }
        //metric.start()
        //httpMetric.register(listener: metric)
    }
    
    public override func start(trace name: String) {
        //traces[name] = Performance.startTrace(name: name)
        log(String(format: "Starting trace: %@ ", name))
    }
    
    public override func stop(trace name: String) {
        guard traces[name] != nil else { return }
        //traces[name]?.stop()
        traces.removeValue(forKey: name)
        log(String(format: "Stopping trace: %@ ", name))
    }
    
    public override func track(event: AnalyticsEvent, params: AnalyticsParams) {
        
        switch event {
        
        // SCREEN
        case .screen(let name):
            
            // MainScreen
            switch name as? MainScreen {
            case .POBLogin:
                sendScreenEvent("viewing_POBLogin_screen")
                logEvent("viewing_POBLogin_screen")
            case .COBLogin:
                sendScreenEvent("viewing_COBLogin_screen")
                logEvent("viewing_COBLogin_screen")
            case .none:
                break
            }
            
            // Screen
            switch name as? Screen {
            case .forgotPassword:
                sendScreenEvent("viewing_forgotpassword_screen")
                logEvent("viewing_forgotpassword_screen")
                
            default:
                if let screenName = (name as? Screen)?.rawValue {
                    let screenName: String = String(format: "viewing_%@_screen", screenName)
                    sendScreenEvent(screenName)
                    logEvent(screenName)
                }
            }

        // CLICK
        case .click(let name):
            switch name as? MainClick {
            case .POBLogin:
                logEvent("on_click_login_cta")
            default:
                break
            }
            
        // ACTION
        case .action(let name):
            // Login
            switch name as? LoginAction {
            case .start:
                let parameters: [String: Any] = getAllProperties(param: params.params)
                logEvent("user_attempts_login")
                logEvent("login_start", parameters: parameters)
            case .success:
                let parameters: [String: Any] = getAllProperties(param: params.params)
                logEvent("user_succesfully_logs_in")
                logEvent("user_login_success")
                logEvent("login_success", parameters: parameters)
            case .fail:
                let parameters: [String: Any] = getAllProperties(param: params.params)
                logEvent("user_succesfully_logs_in")
                logEvent("user_login_success")
                logEvent("login_success", parameters: parameters)
            case .complete:
                let parameters: [String: Any] = getAllProperties(param: params.params)
                logEvent("user_succesfully_logs_in")
                logEvent("user_login_success")
                logEvent("login_success", parameters: parameters)
            case .none:
                return
            }
        // ERROR
        case .error(_):
            return
        }
    }
    
    private func sendScreenEvent(_ screenName: String) {
        let screen = screenName.replacingOccurrences(of: "([^a-zA-Z0-9_.])", with: "_", options: .regularExpression).lowercased()
        //Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: screen])
        log(String(format: "Set ScreenName: %@", screen))
    }
    
    
    private func logEvent(_ event: String, parameters: [String: Any]? = nil) {
        //Analytics.logEvent(event, parameters: parameters)
        log(String(format: "Event: %@ | Params: %@", event, parameters ?? "[:]"))
    }
    
    private func getAllProperties(param: [String: Any]) -> [String: Any] {
        var properties: [String: Any] = [:]
        properties = param
        properties[MainParam.language.rawValue] =  ""
        properties[MainParam.timestamp.rawValue] =  Date()
        properties[MainParam.countryISO.rawValue]  = ""
        properties[MainParam.deviceType.rawValue] =  ""
        properties[MainParam.deviceUID.rawValue] = ""
        return properties
    }
    
}
