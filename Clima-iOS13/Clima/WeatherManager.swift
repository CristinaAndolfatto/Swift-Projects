//
//  WeatherManager.swift
//  Clima
//
//  Created by Cristina Andolfatto on 30/12/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

// here we define the protocol for the WeatherManager delegate che accoglierà i dati parsati e deve implementare metodo didUpdateWeather che deve fare quello che vuole con i dati
// N.B. per convenzione, il protocollo va dichiarato nella stessa classe che lo usa!!
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather : WeatherModel)
    func  didFailWithError(error: Error)
}

struct WeatherManager {
    
    // the property of this will be the API call string
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=1ba41e04070ec73beb7e27765abc7fbf&units=metric"
    
    // creariamo questa variabile, così la classe che si dichiara una weatherManager delegate,, avrà implementazione del metodo didUpdateWeather e ci farà quel che vuole con i dati che abbiamo parsato, questo per rendere codice riutilizzabile anche in altri progetti
    // lo mettiamo optional, così se c'è una classe che si setta come delegato, allora saremo in grado di catcharla
    var delegate: WeatherManagerDelegate?
    
    // we also create a function to create the API request by adding the city name to be added at the end 
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        
        // perform the API request
        performRequest(urlString: urlString)
    }
    
    // another fetchWeather but with different  input parameters
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        
        // perform the API request
        performRequest(urlString: urlString)
    }
    
    // create a function that pass the url created with fetchWeather to the web server
    func performRequest(urlString: String) {
        // this function makes the networking procedure
        
        // STEP 1: create a url (with coalescing wrapping)
        if let url = URL(string: urlString) {
            
            // STEP 2: create a URLSession with default configuration (is like a simple browser)
            let session = URLSession(configuration: .default)
            
            // STEP 3: Give the session a task
            
            // this function assign the task and then execute the completion handler, so when the task is finished ill perform these operation, we leave it as it is so it returns void so nothing, just execute
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // updated
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    // se c'è ststo un qualche errore, tipo perso connessione o altro, diciamo al delegate hei, c'è stato errore, esegui la tua implementazione del metodo didError bla bla
                    self.delegate?.didFailWithError(error: error!)
                    //print(error!)
                    return // top and do not do anything else!!
                }
                // otherwise, if no errors and data is not nil, we want to see the content of a data
                if let safeData = data {
                    // JSON response
                    let dataString = String(data: safeData, encoding: .utf8)
                    // parse the JSON response
                    // we add self because we want to use the method of this struct weather manager
                    if let weather = self.parseJSON(safeData) {
                        // we want to send it back to the weather model view controller and use all the labels etc to update the UI
                        // MODO 1: usiamo delegate per rendere codice generico, così dichiaro il mio viewcontroller come il delegato e dovrò mettere quel metodo e dire che fare con i dati parsati dal JSON
                        // primo parametro è self perchè è ogg WeatherManager stesso
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                        // MODO 2
                        // quindi creiamo oggetto viewController, e lì ci mettiamo metodo per aggiornare la UI con quello che abbiamo parsato con self.parseJSON
                        //let weatherVC = WeatherViewController()
                        // then we use il metodo che abbiamo creato in Viewcontroller che usa l'oggetto weather che arriva dal parsing del JSON per fare update delle labels nella UI
                        //weatherVC.didUpdateWeather(weather: weather)
                    }
                    
                }
            }
            
            // STEP 4: Start the task
            // n.b. we use resume() because the task cannot be ended but only suspended so when they begins they are in a suspended state so to start you have to resume it
            task.resume()
            
        }
        
        
    }
    
    /* moved this into the session.dataTask() method */
    /*
     // create a function for completionHandler with the same inputs
     func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
     if error != nil {
     print(error)
     return // top and do not do anything else!!
     }
     // otherwise, if no errors and data is not nil, we want to see the content of a data
     if let safeData = data {
     let dataString = String(data: safeData, encoding: .utf8)
     print(dataString)
     }
     
     } */
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        // n.b. this is expecting a type not an object, so we can write this way in the first parameter + we have to implement a try catch because it can throw an error, so we implement a do{try ..} catch {} structure
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            // now we have a swift object that we can use and see its properties
            //print(decodedData.name)
            //print(decodedData.main.temp)
            // print(decodedData.weather[0].description)
            // catch the icon id
            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            
            // now we create a weatherModel object with these attributes
            let weather = WeatherModel(conditionId: id, cityName: cityName, temperature: temperature)
            return weather
            // now we can use the getWeatherId computed variable of the weatherModel struct
            //print(weather.conditionName)
            //print(weather.temperatureString)
            
        }
        catch{
            delegate?.didFailWithError(error: error)
                return nil;
            }
    }
   
    
}



