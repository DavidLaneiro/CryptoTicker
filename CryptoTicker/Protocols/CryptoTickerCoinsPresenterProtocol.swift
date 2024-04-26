//
//  CryptoTickerHomePagePresenterProtocol.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Data flow
protocol CryptoTickerCoinsPresenterProtocol {
    
    init(cryptoWebService: CryptoTickerWebserviceProtocol, delegate: CryptoTickerViewDelegateProtocol)
    
    func processGetCoins()
    
}
