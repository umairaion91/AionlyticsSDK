//
//  MainEvent.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation

public enum MainScreen: AnalyticsScreen {
    
    case POBLogin
    case COBLogin
    
    public var rawValue: String {
        switch self {
            case .POBLogin:
                return "POBLogin_screen"
            case .COBLogin:
                return "COBLogin_screen"
        }
    }
}

public enum Screen: AnalyticsScreen {
    
    case forgotPassword
    
    public var rawValue: String {
        switch self {
            case .forgotPassword:
                return "ForgotPassword_screen"
        }
    }
}

public enum MainClick: AionlyticsAction {
    
    case POBLogin
    case COBLogin
    
    public var rawValue: String {
        switch self {
        case .POBLogin:
            return "POBLogin_click"
        case .COBLogin:
            return "COBLogin_click"
        }
    }
}

public enum LoginAction: AionlyticsAction {
    
    case start
    case success
    case fail
    case complete
    
    public var rawValue: String {
        switch self {
        case .start:
            return "login_start"
        case .success:
            return "login_sucess"
        case .fail:
            return "login_fail"
        case .complete:
            return "login_complete"
        }
    }
    
}
