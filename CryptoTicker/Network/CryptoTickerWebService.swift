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
        
        guard let url = URL(string: urlString) else{
            completionHandler(nil, CryptoTickerErrorModel.invalidCryptoURLString)
            return
        }
        
        var cryptoRequest = URLRequest(url: url)
        cryptoRequest.httpMethod = "GET"
        cryptoRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        cryptoRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let _ = urlSession.dataTask(with: cryptoRequest){ (data, response, error) in
            
            if let cryptoRequestError = error{
                completionHandler(nil, CryptoTickerErrorModel.failedRequest(description: cryptoRequestError.localizedDescription))
                return
            }
            
            if let data = data, let cryptoResponseModel = try? JSONDecoder().decode(CryptoTickerCoins.self, from: data){
                
                completionHandler(cryptoResponseModel, nil)
                
            }else{
                
                completionHandler(nil, CryptoTickerErrorModel.invalidCryptoResponseModel)
                
            }
            
            
        }
        
        
    }
    
    
    
}
