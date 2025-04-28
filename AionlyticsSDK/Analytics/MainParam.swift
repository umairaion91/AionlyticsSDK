//
//  MainParam.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//


public enum MainParam: String, AnalyticsParam {
    case countryISO    = "location_country"
    case language      = "app_language"
    case timestamp     = "date_time"
    case deviceType    = "device_type"
    case deviceUID     = "device_uuid"
}

/**
 Usage: You can always Wrap the Main params as below
 
 public class Params: MainParams  {
 
     public convenience init(_ key: Param, value: Any) {
         self.init()
         set(key, value: value)
     }
     
     public func set(_ key: Param, value: Any) {
         super.set(key, value: value)
     }
 }
 
 Declaration:  let parameters = Params()
 parameters.set(FirebaseProperties.Name, value: Screen.Name.rawValue)
 AnalyticsEvent.click(action).track(parameters)
*/
open class MainParams: AnalyticsParams {
    
    public convenience init(_ key: MainParam, value: Any) {
        self.init()
        set(key, value: value)
    }
    
    public init() {
        self.params = [String:Any]()
    }
    
    public func set(_ key: MainParam, value: Any) {
        params[key.desc()] = value
    }
    
    public func set(_ key: AnalyticsParam, value: Any) {
        params[key.desc()] = value
    }
    
    public var params:[String:Any]
}

public protocol AnalyticsParam {
    func desc() -> String
}

public extension AnalyticsParam where Self: RawRepresentable {
    func desc() -> String  {
        return self.rawValue as! String
    }
}

public protocol AnalyticsParams {
    var params: [String: Any] { get set}
}

public extension AnalyticsParams {
    func extract<T>(_ key: AnalyticsParam) -> T? {
        return params[key.desc()] as? T
    }
}
