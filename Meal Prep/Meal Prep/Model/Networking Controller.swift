//
//  Networking Controller.swift
//  Meal Prep
//
//  Created by Jicell on 10/6/22.
//

import Foundation

class NetworkController {
    // MARK: - Private keys
    
    private static let baseURL = "https://www.themealdb.com/api/json/v1/1"
    private static let kSearch = "search.php"
    private static let queryF = "f"
    private static let queryA = "a"
    private static let kMeals = "meals"
    
    static func fetchMeals(for food: Meal, completion: @escaping ([Meal]?) -> Void) {
        // get URL
        guard let baseUrl = URL(string: baseURL) else {return}
        let searchUrl = baseUrl.appendingPathComponent(kSearch)
        var urlComponents = URLComponents(url: searchUrl, resolvingAgainstBaseURL: true)
        
        // add query components
        let keyQuery = URLQueryItem(name: queryF, value: queryA)
        urlComponents?.queryItems = [keyQuery]
        
        guard let finalURL = urlComponents?.url else {return}
        
        // perform the data task
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                print("There's an error", error.localizedDescription)
            }
            if let data = data {
                do {
                    guard let topLevelDictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String:Any], let mealsArray = topLevelDictionary[kMeals] as? [[String:Any]] else {
                        completion(nil)
                        return
                    }
                    var tempArray: [Meal] = []
                    for mealDict in mealsArray {
                        if let meal = Meal(topLevelDictionary: mealDict) {
                            tempArray.append(meal)
                        }
                    }
                    completion(tempArray)
                }
            }
        }.resume()
        
    }
    
    static func fetchMeals(completionHandler: @escaping([Meal]?) -> Void) {
        
        // get URL
        guard let baseUrl = URL(string: baseURL) else {return}
        let searchUrl = baseUrl.appendingPathComponent(kSearch)
        var urlComponents = URLComponents(url: searchUrl, resolvingAgainstBaseURL: true)
        
        // add query components
        let keyQuery = URLQueryItem(name: queryF, value: queryA)
        urlComponents?.queryItems = [keyQuery]
        
        guard let finalURL = urlComponents?.url else {return}
        
        // perform the data task
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                print("There's an error", error.localizedDescription)
            }
            if let data = data {
                do {
                    guard let topLevelDictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String:Any], let mealsArray = topLevelDictionary[kMeals] as? [[String:Any]] else {
                        completionHandler(nil)
                        return
                    }
                    var tempArray: [Meal] = []
                    for mealDict in mealsArray {
                        if let meal = Meal(topLevelDictionary: mealDict) {
                            tempArray.append(meal)
                        }
                    }
                    completionHandler(tempArray)
                }
            }
        }.resume()
        
    }
    
    
    
}
