//
//  CryptoTickerViewDelegateProtocol.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Data flow
protocol CryptoTickerViewDelegateProtocol {
    
    func successfullCoinsRetrieving()
    func errorHandler(error: CryptoTickerErrorModel)
    
}
