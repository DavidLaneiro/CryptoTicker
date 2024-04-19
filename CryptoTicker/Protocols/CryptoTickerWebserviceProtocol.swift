//
//  CryptoTickerWebserviceProtocol.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

protocol CryptoTickerWebserviceProtocol{
    
    func getCoins(completionHandler: @escaping (CryptoTickerCoins?, CryptoTickerErrorModel?) ->  Void)
    
}
