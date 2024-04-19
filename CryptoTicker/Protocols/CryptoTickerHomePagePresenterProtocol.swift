//
//  CryptoTickerHomePagePresenterProtocol.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation


protocol CryptoTickerHomePagePresenterProtocol {
    
    init(delegate: CryptoTickerViewDelegateProtocol)
    
    func processGetCoins()
    
}
