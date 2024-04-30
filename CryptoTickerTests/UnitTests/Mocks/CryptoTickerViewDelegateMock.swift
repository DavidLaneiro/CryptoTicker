//
//  CryptoTickerViewDelegateMock.swift
//  CryptoTickerTests
//
//  Created by David  Lourenço on 22/04/2024.
//

import Foundation
import XCTest
@testable import CryptoTicker


class CryptoTickerViewDelegateMock : CryptoTickerViewDelegateProtocol{
  
    var expectation : XCTestExpectation?
    var successfulGetCoinsCounter = 0
    var errorHandlerCounter = 0
    var coinsError : CryptoTickerErrorModel!

    
    func successfullCoinsRetrieving(retrievedCoins: CryptoTicker.CryptoTickerCoins) {
        successfulGetCoinsCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: CryptoTicker.CryptoTickerErrorModel) {
        
        coinsError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
        
    } 
    
}
