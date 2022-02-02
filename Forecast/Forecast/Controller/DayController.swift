//
//  DayController.swift
//  Forecast
//
//  Created by Karl Pfister on 1/31/22.
//

import Foundation

class DayContoller {
    private static let baseURLString = "https://api.weatherbit.io/v2.0"
    
    static func fetchDays(completion: @escaping ([Day]?) -> Void) {
        guard let baseURL = URL(string:baseURLString) else {return}
        let forcastURL = baseURL.appendingPathComponent("forecast")
        let dailyURL = forcastURL.appendingPathComponent("daily")
        
        var urlComponents = URLComponents(url: dailyURL, resolvingAgainstBaseURL: true)
        let apiQuery = URLQueryItem(name: "key", value: "8503276d5f49474f953722fa0a8e7ef8")
        let cityQuery = URLQueryItem(name: "city", value:"Salt Lake")
        let unitsQuery = URLQueryItem(name: "units", value: "I")
        urlComponents?.queryItems = [apiQuery,cityQuery,unitsQuery]
        
        guard let finalURL = urlComponents?.url else {return}
        print(finalURL)
        URLSession.shared.dataTask(with: finalURL) { dayData, _, error in
            if let error = error {
                print("There was an error fetching the data. The url is \(finalURL), the error is \(error.localizedDescription)")
                completion(nil)
            }
            
            guard let data = dayData else {
                print("There was an error recieveing the data!")
                completion(nil)
                return
            }
            
            do {
                if let topLevelDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                    
                    let cityName = topLevelDictionary["city_name"] as! String
                    let dataArray = topLevelDictionary["data"] as! [[String:Any]]
                    
                    var tempDayArray: [Day] = []
                    for dayDict in dataArray {
                        guard let day = Day(dayDictionary: dayDict, cityName: cityName) else {return}
                        tempDayArray.append(day)
                    }
                    completion(tempDayArray)
                }
            } catch {
                print("Error in Do/Try/Catch: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
