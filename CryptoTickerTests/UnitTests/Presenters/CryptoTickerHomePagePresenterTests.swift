//
//  CryptoTickerHomePagePresenterTests.swift
//  CryptoTickerTests
//
//  Created by David  Lourenço on 20/04/2024.
//

import XCTest
@testable import CryptoTicker

// MARK: Unit Tests for the PRESENTER
final class CryptoTickerHomePagePresenterTests: XCTestCase {

    // MARK: Variables needed
    var sut : CryptoTickerHomePagePresenter!
    var cryptoWebService : CryptoTickerWebserviceMock!
    var cryptoViewDelegate : CryptoTickerViewDelegateMock!
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        cryptoWebService = CryptoTickerWebserviceMock()
        
        cryptoViewDelegate = CryptoTickerViewDelegateMock()
        
        sut = CryptoTickerHomePagePresenter(cryptoWebService: cryptoWebService, delegate: cryptoViewDelegate)
    
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        cryptoWebService = nil
        cryptoWebService = nil
        sut = nil
    
    }
    
    func testCryptoTickerHomePagePresenter_WhenGetCoinsIsSuccessful_ShouldCallSuccessOnViewDelegate(){
        
        // Arrange
        
        let myExpectation = expectation(description: "Expected the successfullCoinsRetrieving() to be called")
        cryptoViewDelegate.expectation = myExpectation
        
        // Act
        
        sut.processGetCoins()
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(cryptoViewDelegate.successfulGetCoinsCounter, 1, "The successfullCoinsRetrieving() was called more than one time or not called at all.")
        XCTAssertEqual(cryptoViewDelegate.errorHandlerCounter, 0, "The errorHandler() should not be called.")
        XCTAssertNil(cryptoViewDelegate.coinsError, "The coinsError is not nil, it must be nil.")
        
        
    }
    
    
    func testCryptoTickerHomePagePresenter_WhenGetCoinsIsNotSuccessful_ShouldCallErrorHandlerOnViewDelegate(){
        
        // Arrange
        
        let myExpectation = expectation(description: "Expected the errorHandler to be called.")
        cryptoViewDelegate.expectation = myExpectation
        cryptoWebService.shouldReturnError = true
        
        // Act
        sut.processGetCoins()
        self.wait(for: [myExpectation], timeout: 5)
        
        
        // Assert
        XCTAssertEqual(cryptoViewDelegate.errorHandlerCounter, 1, "The errorHandler() was called more than one time or not called at all.")
        XCTAssertEqual(cryptoViewDelegate.successfulGetCoinsCounter, 0, "The successfullCoinsRetrieving() should not be called.")
        XCTAssertNotNil(cryptoViewDelegate.coinsError, "The coinsError is nil, it must not be nil.")
        
        
    }


}
