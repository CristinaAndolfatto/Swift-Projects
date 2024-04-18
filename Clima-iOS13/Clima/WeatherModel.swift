//
//  WeatherModel.swift
//  Clima
//
//  Created by Cristina Andolfatto on 27/01/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

// this class will represent the weather data model

struct WeatherModel {
    // this id will represent the id that will be used for the weather icon in the  app
    let conditionId: Int
    // this will be  the city name
    let cityName: String
    // this will be  the temperature
    let temperature: Double
    
    // this  will be  the string of  the temperature
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    // this will be  the weather based on theid
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
        
    }
    
    
    /* this  is the old method we  transformed into  a variable
    // method  to  re-try the  image of the weather based on the weather id
    // it will take in input a weather data object and will return the associated weather string
    func getConditionName(weatherdata: WeatherModel) -> String {
        switch weatherdata.conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
     */
    
    
    
    
}
