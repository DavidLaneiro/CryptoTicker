//
//  CryptoTickerHomePagePresenterMock.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation
@testable import CryptoTicker

// MARK: Mock Version for Test Purposes
class CryptoTickerCoinsPresenterMock : CryptoTickerCoinsPresenterProtocol{
    
    var processGetCoinsCalled: Bool = false
    private var cryptoWebService : CryptoTickerWebserviceProtocol
    private var delegate : CryptoTickerViewDelegateProtocol
    
    required init(cryptoWebService: CryptoTickerWebserviceProtocol, delegate: CryptoTickerViewDelegateProtocol) {
        
        self.cryptoWebService = cryptoWebService
        self.delegate = delegate
        
    }
    
    
    func processGetCoins() {
        
        // Same implementation
        // But only for the VC table view testing purposes

        self.processGetCoinsCalled = true
        
        cryptoWebService.getCoins(){ [weak self] (responseModel, error) in
            
            if let error = error{
                
                self?.delegate.errorHandler(error: error)
                return
            }
                
            if let retrievedCoins = responseModel{
                    
                self?.delegate.successfullCoinsRetrieving(retrievedCoins: retrievedCoins)
                
            }
        }
        
    }

}
