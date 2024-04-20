//
//  CryptoTickerHomePagePresenterProtocol.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation


protocol CryptoTickerHomePagePresenterProtocol {
    
    init(cryptoWebService: CryptoTickerWebserviceProtocol, delegate: CryptoTickerViewDelegateProtocol)
    
    func processGetCoins()
    
}
