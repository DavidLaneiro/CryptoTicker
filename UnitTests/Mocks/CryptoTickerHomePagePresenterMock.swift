//
//  CryptoTickerHomePagePresenterMock.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation
@testable import CryptoTicker

// MARK: Mock Version for test purposes
class CryptoTickerHomePagePresenterMock : CryptoTickerHomePagePresenterProtocol{
    
 
    required init(delegate: CryptoTicker.CryptoTickerViewDelegateProtocol) {
        // Do something
    }
    
    func processGetCoins() {
        // Do something
    }

}
