//
//  Enviornment.swift
//  AionlyticsSDK
//
//  Created by Admin on 23/04/2025.
//

import Foundation

public enum Environment:String, Decodable {
    case Production = "prd"
    case Stage = "stg"
    case Test = "tst"
    case Development = "dev"
}
