//
//  CryptoTickerMockURLProtocol.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 20/04/2024.
//

import Foundation

// MARK: This serves the purpose of giving my custom implementation
// of URL Protocol
class CryptoTickerMockURLProtocol: URLProtocol{
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let error = CryptoTickerMockURLProtocol.error{
            
            let stubError = NSError(domain: "StubNSError", code: -99, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            
            self.client?.urlProtocol(self, didFailWithError: stubError)
            
        }else{
            
            self.client?.urlProtocol(self, didLoad: CryptoTickerMockURLProtocol.stubResponseData ?? Data())
            
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
    
}
