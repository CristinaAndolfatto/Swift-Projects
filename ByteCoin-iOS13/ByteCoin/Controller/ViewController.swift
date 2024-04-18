//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

// we adopt the protocol UIPickerViewDataSource:in this way, ourview can be a delegate of that protocol and can add data sourceto a picker view
class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    // create a coinManager obj
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set the coinManager as its delegate
        coinManager.delegate = self
        // set the datasource of thepickerViewas our ViewController class
        currencyPicker.dataSource = self
        // set the ViewController class as the delegate for currencyPicker
        currencyPicker.delegate = self
 
    }


}

//MARK: - PickerView manager

extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    // set how many columns we want in our pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // set the number of columns  we want in our pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    //    set the pickerView title for  each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}


//MARK: - CoinManager
extension ViewController : CoinManagerDelegate {
    
    // metodo che prende in ingresso oggetto weatherModel e fa update della UI in base ai dati letti dal weatheModel
    // n.b. per convenzione , per primo paramewtro metto chi chiasma
    func didUpdateData (_ coinManager: CoinManager, coinData : CoinModel) {
        // update della label della temperatura
        // print(coinData.conversionRate)
        let coinRate = coinData.conversionRate
        let coinName = coinData.coinName
        DispatchQueue.main.async {
            self.bitCoinLabel.text = String(format: "%.2f", coinRate)
            self.currencyLabel.text = coinName
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

