//
//  CryptoTickerHomePagePresenter.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Real Version
class CryptoTickerHomePagePresenter : CryptoTickerHomePagePresenterProtocol{
    
    private var cryptoWebService : CryptoTickerWebserviceProtocol
    private var delegate : CryptoTickerViewDelegateProtocol
    
    required init(cryptoWebService: CryptoTickerWebserviceProtocol, delegate: CryptoTickerViewDelegateProtocol) {
        
        self.cryptoWebService = cryptoWebService
        self.delegate = delegate
        
    }
    
    func processGetCoins() {
        // Do something
        
    }
    
}
