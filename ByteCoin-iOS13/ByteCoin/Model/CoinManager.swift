//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateData(_ CoinDataManager: CoinManager, coinData : CoinModel)
    func  didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C0BED9B6-D2FB-4FE9-8C80-9BF6955C1C93"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinManagerDelegate?
    
    // function to gather price data for the selected row
    func getCoinPrice(for currency: String) {
        // create the final url
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        // perform the API request
        performRequest(urlString: url)
        
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
                    if let coin = self.parseJSON(safeData) {
                        // we want to send it back to the weather model view controller and use all the labels etc to update the UI
                        // MODO 1: usiamo delegate per rendere codice generico, così dichiaro il mio viewcontroller come il delegato e dovrò mettere quel metodo e dire che fare con i dati parsati dal JSON
                        // primo parametro è self perchè è ogg WeatherManager stesso
                        print(coin.conversionRate)
                        self.delegate?.didUpdateData(self, coinData: coin)
                        
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
        
        
        // JSON parsing function
        func parseJSON(_ coinData: Data) -> CoinModel? {
            let decoder = JSONDecoder()
            // n.b. this is expecting a type not an object, so we can write this way in the first parameter + we have to implement a try catch because it can throw an error, so we implement a do{try ..} catch {} structure
            do {
                let decodedData = try decoder.decode(CoinData.self, from: coinData)
                // now we have a swift object that we can use and see its properties
                //print(decodedData.name)
                //print(decodedData.main.temp)
                // print(decodedData.weather[0].description)
                // catch the icon id
                let conversionRateFromJson = decodedData.rate
                let coinNameFromJson = decodedData.asset_id_quote
                
                // now we create a weatherModel object with these attributes
                let coin = CoinModel(coinName : coinNameFromJson, conversionRate: conversionRateFromJson)
                
                return coin
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
