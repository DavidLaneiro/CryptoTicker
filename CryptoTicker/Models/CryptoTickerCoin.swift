//
//  CryptoTickerCoin.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Model of a single coin
struct CryptoTickerCoin : Decodable{
    
    let id: String
    let symbol: String
    let currencySymbol: String?
    let type: String
    let rateUsd: String

}
