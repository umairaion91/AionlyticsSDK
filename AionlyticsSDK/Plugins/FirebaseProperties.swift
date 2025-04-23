//
//  FirebaseProperties.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation


public enum FirebaseProperties: String, AnalyticsParam {
    case countryISO    = "location_country"
    case language      = "app_language"
    case timestamp     = "date_time"
    case deviceType    = "device_type"
    case deviceUID     = "device_uuid"
}
