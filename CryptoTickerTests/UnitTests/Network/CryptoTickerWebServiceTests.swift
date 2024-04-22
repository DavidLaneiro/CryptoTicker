//
//  CryptoTickerWebServiceTests.swift
//  CryptoTickerTests
//
//  Created by David  Lourenço on 20/04/2024.
//

import XCTest
@testable import CryptoTicker


// MARK: Unit Tests for the WebService
final class CryptoTickerWebServiceTests: XCTestCase {
    
    // MARK: Variables
    var sut : CryptoTickerWebService!
    
    // Setup Variables
    override func setUpWithError() throws {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [CryptoTickerMockURLProtocol.self]
        
        let urlSession = URLSession(configuration: config)
        
        sut = CryptoTickerWebService(urlSession: urlSession, urlString: CryptoTickerConstants.cryptoUrlString)
        
    }
    
    // Clean variables
    override func tearDownWithError() throws {
        
        sut = nil
        CryptoTickerMockURLProtocol.error = nil
        CryptoTickerMockURLProtocol.stubResponseData = nil
        
        
    }
    
    
    // MARK: Unit Tests
    
    func testCryptoTickerWebService_WhenEmptyStringProvided_ShouldReturnError(){
        
        // Arrange
        let expectation = expectation(description: "Expected an invalidCryptoURLString error.")
        
        sut = CryptoTickerWebService(urlString: "")
        
        // Act
        
        sut.getCoins(){ (cryptoResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, CryptoTickerErrorModel.invalidCryptoURLString, "The method getCoins did not return an invalidCryptoURLString error.")
            XCTAssertNil(cryptoResponseModel, "The response model is not nil, it must be nil")
            
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 3)
        
    }
    
    func testCryptoTickerWebService_WhenUrlRequestFails_ShoudReturnError(){
        
        // Arrange
        let expectation = self.expectation(description: "Expected a failed request error")
        let errorDescription = "This is a failed request example."
        
        CryptoTickerMockURLProtocol.error = CryptoTickerErrorModel.failedRequest(description: errorDescription)
        
        // Act
        sut.getCoins(){ (cryptoResponseModel, error) in
            
            XCTAssertEqual(error, CryptoTickerErrorModel.failedRequest(description: errorDescription), "The error presented is not equal to the failedRequest error.")
            
            XCTAssertNil(cryptoResponseModel)
            
            expectation.fulfill()
        }
        
        // Assert
        self.wait(for: [expectation], timeout: 7)
        
    }
    
    func testCryptoTickerWebService_WhenGivenSuccessfulResponse_ShouldReturnSuccess(){
        
        // Arrange
        let expectation = expectation(description: "Expected Success Response with valid data.")
        
        let jsonDataString = """
        {
            "data": [
                {
                    "id": "barbadian-dollar",
                    "symbol": "BBD",
                    "currencySymbol": "$",
                    "type": "fiat",
                    "rateUsd": "0.5000000000000000"
                }
            ]
        }
        """
        
        CryptoTickerMockURLProtocol.stubResponseData = jsonDataString.data(using: .utf8)
        
        
        // Act
        
        sut.getCoins(){ (cryptoResponseModel, error) in
            
            XCTAssertEqual(cryptoResponseModel?.data[0].id, "barbadian-dollar", "The id is not equal, should be equal.")
            XCTAssertEqual(cryptoResponseModel?.data[0].symbol, "BBD", "The symbol is not equal, should be equal.")
            XCTAssertEqual(cryptoResponseModel?.data[0].currencySymbol, "$", "The currencySymbol is not equal, should be equal.")
            XCTAssertEqual(cryptoResponseModel?.data[0].type, "fiat", "The type is not equal, should be equal.")
            XCTAssertEqual(cryptoResponseModel?.data[0].rateUsd, "0.5000000000000000", "The rateUsd is not equal, should be equal.")
            XCTAssertNil(error, "The error is not nil, the error must be nil.")
            
            expectation.fulfill()
            
        }
        
        
        // Assert
        self.wait(for: [expectation], timeout: 3)
    }
    
    func testCryptoTickerWebService_WhenReceivedDifferentJSONResponse_ShouldReturnError(){
        
        // Arrange
        let expectation = expectation(description: "Expected invalidCryptoResponseModel error.")
        
        let jsonString = "{\"error\":\"Internal Server Error\"}"
        CryptoTickerMockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        // Act
        sut.getCoins(){ (cryptoResponseModel, error) in
            
            XCTAssertEqual(error, CryptoTickerErrorModel.invalidCryptoResponseModel, "The error is not equal to the invalidCryptoResponseModel.")
            
            XCTAssertNil(cryptoResponseModel, "The cryptoResponseModel is not nil, it must be nil.")
            
            expectation.fulfill()
            
        }
        
        // Assert
        self.wait(for: [expectation], timeout: 3)
    }
    
    
    func testCryptoTickerWebService_WhenReceivedResponseDataIsNil_ShouldReturnError(){
        
        // Arrange
        let expectation = expectation(description: "Expected invalidCryptoResponseModel when the response data is nil.")
        
        CryptoTickerMockURLProtocol.stubResponseData = nil
        
        // Act
        
        sut.getCoins(){ (cryptoResponseModel, error) in
            
            // Assert
            
            XCTAssertEqual(error, CryptoTickerErrorModel.invalidCryptoResponseModel, "The error is not equal to the invalidCryptoResponseModel.")
            
            XCTAssertNil(cryptoResponseModel, "The cryptoResponseModel is not nil, it must be nil.")
            
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 3)
        
        
    }
    
}
