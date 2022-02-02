//
//  Day.swift
//  Forecast
//
//  Created by Karl Pfister on 1/31/22.
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
 
    init?(dayDictionary:[String:Any], cityName: String ) {
        
        guard let temp = dayDictionary["temp"] as? Double,
        let highTemp = dayDictionary["high_temp"] as? Double,
        let lowTemp = dayDictionary["low_temp"] as? Double,
        let validData = dayDictionary["valid_date"] as? String,
        // We need to parse one additional level for the remaining values
        let weatherDict = dayDictionary["weather"] as? [String:Any],
        // Now we have access to the remaining values
        let description = weatherDict["description"] as? String,
        let iconString = weatherDict["icon"] as? String else {return nil}
        
        self.temp = temp
        self.highTemp = highTemp
        self.lowTemp = lowTemp
        self.validDate = validData
        self.description = description
        self.iconString = iconString
        self.cityName = cityName
    }
}
/**
 
 "data": [
 {
 "moonrise_ts": 1643640122,
 "wind_cdir": "SW",
 "rh": 56,
 "pres": 871.6,
 "high_temp": 43.6,
 "sunset_ts": 1643676258,
 "ozone": 312.2,
 "moon_phase": 0.00239657,
 "wind_gust_spd": 8.5,
 "snow_depth": 0,
 "clouds": 31,
 "ts": 1643612460,
 "sunrise_ts": 1643639943,
 "app_min_temp": 10.7,
 "wind_spd": 5.4,
 "pop": 0,
 "wind_cdir_full": "southwest",
 "slp": 1023.2,
 "moon_phase_lunation": 0.99,
 "valid_date": "2022-01-31",
 "app_max_temp": 42.4,
 "vis": 17.2,
 "dewpt": 17.9,
 "snow": 0,
 "uv": 0.4,
 "weather": {
 "icon": "c02d",
 "code": 802,
 "description": "Scattered clouds"
 },
 "wind_dir": 236,
 "max_dhi": null,
 "clouds_hi": 22,
 "precip": 0,
 "low_temp": 17.8,
 "max_temp": 43.6,
 "moonset_ts": 1643674105,
 "datetime": "2022-01-31",
 "temp": 31,
 "min_temp": 22,
 "clouds_mid": 9,
 "clouds_low": 7
 */

