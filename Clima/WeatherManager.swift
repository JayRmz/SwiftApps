//
//  WeatherManager.swift
//  Clima
//
//  Created by Juan Ramírez Blancas on 17/03/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=faa0bdc1e6007779272d2492b5f90ccd&units=metric"
    
    func fetchWeather(city: String) {
        let urlString = "\(weatherURL)&q=\(city)"
        self.preformRequest(urlString: urlString)
    }
    
    func preformRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        } catch {
            print(error)
        }
        
    }
    
}
    
