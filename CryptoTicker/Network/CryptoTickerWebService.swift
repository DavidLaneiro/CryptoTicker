//
//  CryptoTickerWebService.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Real Version
class CryptoTickerWebService : CryptoTickerWebserviceProtocol{

    private var urlSession : URLSession
    private var urlString : String
    
    init(urlSession: URLSession = .shared, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func getCoins(completionHandler: @escaping (CryptoTickerCoins?, CryptoTickerErrorModel?) -> Void) {
        // Do something later
    }
    
    
    
}
