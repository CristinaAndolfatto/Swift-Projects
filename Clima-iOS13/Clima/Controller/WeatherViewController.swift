//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func navigatorButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    // create and initialize a new WeatherManager struct
    // (simply struct name + () )
    var weatherManager = WeatherManager()
    
    // var that  manage gps data -> per questo però, nella viewDidLoad, come prima cosa dobbiamo chiedere permesso a utente per utiluzzare dati GPS
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set the delegate of the textfield on the current view controller
        searchTextField.delegate = self
        // settiamo il fatto che questa view è la delegate del weatherManager, che è quello che fa parsing del JSON
        // per questo motivo sotto dobbiamo implementare il metodo didUpdateWeather
        weatherManager.delegate = self
        
        //  prima di tutto, mostriamo  popup  che chiede AUTORIZZAZIONE per dati GPS
        locationManager.requestWhenInUseAuthorization()
        // settiamo come delegate della location la view corrente -> quando nella view corrente viene chiamata la requestLocation funzione, il suo delegato (che è la classe stessa) verrà chiamato ed eseguirà il metodo che il protocollo richiede (cioè didUpdateLocation bla bla che lo troviamo nella extension in fondo alla classe)
        locationManager.delegate = self
        // poi posso chiedere la LOCALIZZAZIONE
        locationManager.requestLocation()

    }
    

}

//MARK:  - UITextFieldDelegate
// we put the code that manage all the textfield here
extension WeatherViewController : UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        // get the user input
        print(searchTextField.text!)
        // dismiss the keyboard whne search button is pressed
        searchTextField.endEditing(true)
    }
    
    // ask the delegate if the textfield should process the text inserted after the return button gets pressed
    // return true or false
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        // dismiss the keyboard when return is pressed
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use the searchTextField.text to get the city with the unwrap
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        // Reset to empty string
        searchTextField.text = "Search a city "
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != " " {
            return true
        }
        else
        {   searchTextField.placeholder = "Search a city"
            return false
        }
    }
    
    
}

//MARK: - WeatherManager
extension WeatherViewController:WeatherManagerDelegate {
    
    // metodo che prende in ingresso oggetto weatherModel e fa update della UI in base ai dati letti dal weatheModel
    // n.b. per convenzione , per primo paramewtro metto chi chiasma
    func didUpdateWeather (_ weatherManager: WeatherManager, weather : WeatherModel) {
        // update della label della temperatura
        //print(weather.temperature)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

//MARK: - LocationManager delegate : creaimo questa estensione dove adottiamo il protocollo CLLocationManager e diciamo al nostro delegato (che è la classe stessa) cosa fare con i metodi del protocollo
extension WeatherViewController:CLLocationManagerDelegate {
    // implementiamo metodo che dice cosa deve fare il delegato quando viene aggiornata la location chiamando metodo requestLocation() che non returna niente, ma manda una notifica al delegato che noi abbiamo impostato come la classe stessa nella viewDidLoad -> qui diciamo al delegato cosa deve fare quando quel metodo manda notifica
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        print("Got Location :)")
        // facciamo  wrap così se c'è location bene  sennò lanciamo errore  o altro
        //  prendiamo  ultimo elemento dell'array delle locations con locations.last
        if let location = locations.last
        {
            // stopLocation manager così se viene richiamatodalbottone, anche se location non ècambiata viene chiamato
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: long)
            
        }
        
    }
    
    // dobbiamo dire cosa fare se ci sono errori per adottare protocollo
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("No Location data")
    }
    
}


