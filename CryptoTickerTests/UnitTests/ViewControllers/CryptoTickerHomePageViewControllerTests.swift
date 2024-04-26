//
//  CryptoTickerHomePageViewControllerTests.swift
//  CryptoTickerTests
//
//  Created by David  Lourenço on 23/04/2024.
//

import XCTest
@testable import CryptoTicker

final class CryptoTickerHomePageViewControllerTests: XCTestCase {

    var sut : CryptoTickerHomePageViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = CryptoTickerHomePageViewController()
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    
    func testCryptoTickerHomePageViewController_WhenUIExists_ShouldReturnNotNil(){
        
        // Arrange
        
        // Act
        let titleLabel = sut.cryptoTitle
        let subtitleLabel = sut.cryptoSubtitle
        let cryptoButton = sut.cryptoButton
        let cryptoStackView = sut.cryptoStackView
        
        // Assert
        XCTAssertNotNil(titleLabel, "The title label should not be nil.")
        XCTAssertNotNil(subtitleLabel, "The subtitle label should not be nil.")
        XCTAssertNotNil(cryptoButton, "The cryptoButton should not be nil.")
        XCTAssertNotNil(cryptoStackView, "The cryptoStackView should not be nil.")
        
        
    }
    
    func testCryptoTickerHomePageViewController_WhenLabelsTextsAreCorrect_ReturnsSuccess(){
        
        // Arrange
        let titleLabel = sut.cryptoTitle
        let subtitleLabel = sut.cryptoSubtitle
        
        
        // Act
        let titleLabelText = titleLabel.text
        let subtitleLabelText = subtitleLabel.text
        
        // Assert
        XCTAssertEqual(titleLabelText, CryptoTickerConstants.cryptoAppTitle, "The title label should be equal to the CryptoTickerConstants.cryptoAppTitle.")
        XCTAssertEqual(subtitleLabelText, CryptoTickerConstants.cryptoDescription, "The subtitle label should be equal to the CryptoTickerConstants.cryptoDescription.")
        
        
    }
    
    func testCryptoTickerHomePageViewController_WhenCreated_HasButtonEnabledAndActions() throws{
        
        // Arrange
        let cryptoButton = try XCTUnwrap(sut.cryptoButton, "The Crypto Button is returning nil.")
        
        // Act

        let cryptoButtonActions = try XCTUnwrap(cryptoButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "The Crypto Button has no actions assigned to it.")
        
        // Assert
        XCTAssertEqual(cryptoButtonActions.count, 1, "The Crypto Button should only have 1 action assigned to it.")
        XCTAssertEqual(cryptoButtonActions.first, "getCoinsTapped", "There is no action assigned to the Crypto Button with the name getCoinsTapped.")
        XCTAssertTrue(cryptoButton.isEnabled, "The Crypto Button should be enabled.")
        XCTAssertFalse(cryptoButton.isHidden, "The Crypto Button should not be hidden.")
    }
    
    
//    func testCryptoTickerHomePageViewController_WhenGetCoinsButtonTapped_InvokesGetCoinsProcess(){
//        // Arrange
//        let cryptoWebServiceMock = CryptoTickerWebserviceMock()
//        let cryptoViewDelegateMock = CryptoTickerViewDelegateMock()
//        let cryptoPresenterMock = CryptoTickerCoinsPresenterMock(cryptoWebService: cryptoWebServiceMock, delegate: cryptoViewDelegateMock)
//        
//        // Act
//        
//        sut.cryptoPresenter = cryptoPresenterMock
//        sut.cryptoButton.sendActions(for: .touchUpInside)
//        
//        // Assert
//        XCTAssertTrue(cryptoPresenterMock.processGetCoinsCalled, "The processGetCoins is not being called.")
//        
//        
//    }
    
    func testCryptoTickerHomePageViewController_WhenStackViewCreated_ShouldHaveSpecificNumberOfArrangedSubviews() throws{
        
        // Arrange
        let cryptoVerticalStackView = try XCTUnwrap(sut.cryptoStackView, "The StackView should not be nil.")
        
        // Act
        
        let cryptoArrangedSubViewsCount = cryptoVerticalStackView.arrangedSubviews.count
        
        
        // Assert
        XCTAssertEqual(cryptoArrangedSubViewsCount, 3, "The Crypto StackView should only have 3 arranged subviews.")
        
    }
    
    
    func testCryptoTickerHomePageViewController_WhenStackViewCreated_ShouldReturnCorrectLayoutValues() throws{
        
        // Arrange
        let cryptoVerticalStackView = try XCTUnwrap(sut.cryptoStackView, "The StackView should not be nil.")
        
        // Act
        let stackViewAxis = cryptoVerticalStackView.axis
        let stackViewAlignment = cryptoVerticalStackView.alignment
        let stackViewSpacing = cryptoVerticalStackView.spacing
        
        
        // Assert
        XCTAssertEqual(stackViewAxis, .vertical, "The Crypto StackView axis should be vertical.")
        XCTAssertEqual(stackViewAlignment, .center, "The Crypto StackView alignment should be center.")
        XCTAssertEqual(stackViewSpacing, 20, "The Crypto StackView spacing should be 20.")
        
    }
    
}
