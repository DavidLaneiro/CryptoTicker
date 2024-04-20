//
//  CryptoTickerWebserviceMock.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Mock version
class CryptoTickerWebserviceMock : CryptoTickerWebserviceProtocol{
    
    var isGetCoinsCalled : Bool = false
    var shouldReturnError : Bool = false
    
    func getCoins(completionHandler: @escaping (CryptoTickerCoins?, CryptoTickerErrorModel?) -> Void) {
        
        isGetCoinsCalled = true
        
        if shouldReturnError{
            
            completionHandler(nil, CryptoTickerErrorModel.failedRequest(description: "The Get Coins request was not successful"))
            
        }else{
            
            // Dummy data
            let cryptoTickerCoinExample = CryptoTickerCoin(id: "barbadian-dollar", symbol: "BBD", currencySymbol: "$", type:  "fiat", rateUsd: "0.5000000000000000")
            
            let successfulResponseModel = CryptoTickerCoins(data: [cryptoTickerCoinExample])
            
            completionHandler(successfulResponseModel, nil)
            
        }
        
    }

    
}
