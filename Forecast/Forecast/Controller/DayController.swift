//
//  DayController.swift
//  Forecast
//
//  Created by iMac Pro on 2/21/23.
//

import Foundation

class DayController {
    
    static func fetchDays(completion: @escaping ([Day]?) -> Void) {
        guard let baseURL = URL(string: Constants.DayURL.baseURL) else { completion(nil); return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let cityQuery = URLQueryItem(name: Constants.DayKeys.cityKey, value: Constants.DayKeys.cityValue)
        let unitsQuery = URLQueryItem(name: Constants.DayKeys.unitsKey, value: Constants.DayKeys.unitsValue)
        let apiQuery = URLQueryItem(name: Constants.DayKeys.apiKeyKey, value: Constants.DayKeys.apiKeyValue)
        urlComponents?.queryItems = [cityQuery, unitsQuery, apiQuery]
        
        guard let finalURL = urlComponents?.url else { completion(nil); return }
        print("Final URL: \(finalURL)")
        
        
        
    }
} //: CLASS
