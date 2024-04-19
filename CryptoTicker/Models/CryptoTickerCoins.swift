//
//  CryptoTickerCoins.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Model of multiple coins
struct CryptoTickerCoins : Decodable{
    
    let data : [CryptoTickerCoin]
    
}

