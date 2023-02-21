//
//  Day.swift
//  Forecast
//
//  Created by iMac Pro on 2/21/23.
//

import Foundation

class Day {
    let cityName: String
    let temp: Double
    let highTemp: Double
    let lowTemp: Double
    let description: String
    let iconString: String
    let validDate: String
    
    enum Keys: String {
        case temp       = "temp"
        case highTemp   = "high_temp"
        case lowTemp    = "low_temp"
        case validDate  = "valid_date"
        
        case weather
        case description
        case icon
    }
    
    init?(dayDictionary: [String: Any], cityName: String) {
        guard let temp = dayDictionary[Keys.temp.rawValue] as? Double,
              let highTemp = dayDictionary[Keys.highTemp.rawValue] as? Double,
              let lowTemp = dayDictionary[Keys.lowTemp.rawValue] as? Double,
              let validDate = dayDictionary[Keys.validDate.rawValue] as? String,
              
              let weatherDict = dayDictionary[Keys.weather.rawValue] as? [String : Any],
              let description = weatherDict[Keys.description.rawValue] as? String,
              let iconString = weatherDict[Keys.icon.rawValue] as? String else { return nil }
        
        self.temp        = temp
        self.highTemp    = highTemp
        self.lowTemp     = lowTemp
        self.description = description
        self.validDate   = validDate
        self.iconString  = iconString
        self.cityName    = cityName
    }
}
