//
//  Constants.swift
//  Forecast
//
//  Created by iMac Pro on 2/21/23.
//

import Foundation

struct Constants {
    
//    REFERENCE:
//    https://api.weatherbit.io/v2.0/forecast/daily?city=Highland+Village,TX&units=I&key=fff2218d88514062ad8aa6cb02375e1e
    struct DayURL {
        static let baseURL      = "https://api.weatherbit.io/v2.0/forecast/daily"
    }
    
    struct DayKeys {
        static let cityKey      = "city"
        static let cityValue    = "Highland+Village,TX"
        
        static let apiKeyKey    = "key"
        static let apiKeyValue  = "fff2218d88514062ad8aa6cb02375e1e"
        
        static let unitsKey     = "units"
        static let unitsValue   = "I"
    }
}
