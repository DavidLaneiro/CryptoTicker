//
//  CryptoTickerErrorModel.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation

// MARK: Errors enum
enum CryptoTickerErrorModel : Equatable, LocalizedError {
    
    case invalidCryptoURLString
    case failedRequest(description: String)
    case invalidCryptoResponseModel
    
    var errorDescription: String? {
        
        switch self{
            
        case .failedRequest(let description):
            return description
           
        case .invalidCryptoURLString, .invalidCryptoResponseModel:
            return ""
        }
        
    }
    
}
