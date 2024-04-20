//
//  CryptoTickerHomePagePresenterMock.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation
@testable import CryptoTicker

// MARK: Mock Version for Test Purposes
class CryptoTickerHomePagePresenterMock : CryptoTickerHomePagePresenterProtocol{
    
    var processGetCoinsCalled: Bool = false
    
    required init(cryptoWebService: CryptoTicker.CryptoTickerWebserviceProtocol, delegate: CryptoTicker.CryptoTickerViewDelegateProtocol) {
    
        // Do nothing in the mock version
        
    }

    func processGetCoins() {
        self.processGetCoinsCalled = true
    }

}
