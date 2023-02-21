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
        
        URLSession.shared.dataTask(with: finalURL) { dayData, response, error in
            if let error = error {
                print("Error in Request: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response Status Code: \(response.statusCode)")
            }
            
            guard let data = dayData else { completion(nil); return }
            do {
                if let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any], let cityName = topLevel["city_name"] as? String, let daysArray = topLevel["data"] as? [[String : Any]] {
                    
                    let day = daysArray.compactMap { Day(dayDictionary: $0, cityName: cityName) }
                    completion(day)
                }
            } catch {
                completion(nil)
                return
            }
        }.resume()
    }
} //: CLASS
