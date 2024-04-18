//
//  CoinData.swift
//  ByteCoin
//
//  Created by Cristina Andolfatto on 24/03/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

// CoinData model, describe JSON data response
struct CoinData: Decodable {
//    timestamp of the current rate
    let time :  String
//    base currency
    let asset_id_base : String
//    quote currency (the one we  want to know the conversion rate)
    let asset_id_quote : String
//    rate of conversion between base currency and quote currency
    let rate : Double
    
}
