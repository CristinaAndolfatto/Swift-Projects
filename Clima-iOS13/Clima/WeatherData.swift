//
//  WeatherData.swift
//  Clima
//
//  Created by Cristina Andolfatto on 07/01/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

// This file describes how the WeatherData are organized in the JSON response we retrieve from OpenWeatherAPI
// N.B. we have to say that it is decodable

struct WeatherData: Decodable {
    // tell the compiler the properties of the JSON response
    
    // name of the city
    let name: String
    
    // main structure che abbiamo definito sotto
    let main: Main
    
    // array of weather struct
    let weather: [Weather]
    
    
    
}

// main - top level -> sarà oggetto con delle proprietà quindi mi serve altra struct che deve essere essere decodable + dovrà avere le stesse identiche proprietà del JSON + dovrò aggiungere questa struct alle proprietà del weatherData
struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
    
}


