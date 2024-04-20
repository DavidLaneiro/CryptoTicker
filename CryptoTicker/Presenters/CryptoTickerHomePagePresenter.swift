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
        
        // Weak self to avoid a memory leak
        
        cryptoWebService.getCoins(){ [weak self] (responseModel, error) in
            
            if let error = error{
                
                self?.delegate.errorHandler(error: error)
                return
            }
                
            if let _ = responseModel{
                    
                self?.delegate.successfullCoinsRetrieving()
                    
            }
        }
        
    }
    
}
