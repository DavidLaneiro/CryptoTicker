//
//  CryptoTickerCoinsViewControllerTests.swift
//  CryptoTickerTests
//
//  Created by David  Lourenço on 23/05/2024.
//

import XCTest
@testable import CryptoTicker

final class CryptoTickerCoinsViewControllerTests: XCTestCase {
    
    var sut : CryptoTickerCoinsViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CryptoTickerCoinsViewController()
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testCryptoTickerCoinsViewController_WhenUIExists_ShouldReturnNotNil(){
        
        // Arrange
        let crytoTableView = sut.cryptoTableView
        let cryptoVerticalStackView = sut.cryptoVerticalStackView
        let cryptoTitleLabel = sut.cryptoTitleLabel
        let cryptoActivityIndicator = sut.cryptoActivityIndicator
        let cryptoCloseButton = sut.cryptoCloseButton
        let cryptoErrorView = sut.cryptoErrorView
        
        // Assert
        XCTAssertNotNil(crytoTableView, "The crytoTableView on CryptoTickerCoinsViewController should not be nil.")
        XCTAssertNotNil(cryptoVerticalStackView, "The cryptoVerticalStackView on CryptoTickerCoinsViewController should not be nil.")
        XCTAssertNotNil(cryptoTitleLabel, "The cryptoTitleLabel on CryptoTickerCoinsViewController should not be nil.")
        XCTAssertNotNil(cryptoActivityIndicator, "The cryptoActivityIndicator on CryptoTickerCoinsViewController should not be nil.")
        XCTAssertNotNil(cryptoCloseButton, "The cryptoCloseButton on CryptoTickerCoinsViewController should not be nil.")
        XCTAssertNotNil(cryptoErrorView, "The cryptoErrorView on CryptoTickerCoinsViewController should not be nil.")
        
        
    }
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasTableViewWithCorrectProperties(){
        
        // Arrange
        let cryptoTableView = sut.cryptoTableView
        
        // Act
        let currentSeparatorStyle = cryptoTableView.separatorStyle
        let currentAllowsSelection = cryptoTableView.allowsSelection
        let currentIsScrollIndicatorVisible = cryptoTableView.showsVerticalScrollIndicator
        
        // Assert
        XCTAssertEqual(currentSeparatorStyle, .singleLine, "The current separator style for the crytoTableView in CryptoTickerCoinsViewController should be Single Line.")
        XCTAssertFalse(currentAllowsSelection, "The current value for the allowsSelection flag of the crytoTableView in CryptoTickerCoinsViewController should be False.")
        XCTAssertFalse(currentIsScrollIndicatorVisible, "The current value for the showsVerticalScrollIndicator flag of the crytoTableView in CryptoTickerCoinsViewController should be False.")
        
    }
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasStackViewWithCorrectProperties(){
        
        // Arrange
        let cryptoStackView = sut.cryptoVerticalStackView
        
        // Act
        let stackViewAxis = cryptoStackView.axis
        let stackViewSpacing = cryptoStackView.spacing
        
        
        // Assert
        XCTAssertEqual(stackViewAxis, .vertical, "The current axis for the cryptoStackView in CryptoTickerCoinsViewController should be vertical.")
        XCTAssertEqual(stackViewSpacing, 10, "The current spacing for the cryptoStackView in CryptoTickerCoinsViewController should be 10.")
        
    }
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasTitleLabelWithCorrectProperties(){
        
        // Arrange
        let cryptoTitleLabel = sut.cryptoTitleLabel
        
        // Act
        let textFont = cryptoTitleLabel.font
        let textColor = cryptoTitleLabel.textColor
        let textAlignment = cryptoTitleLabel.textAlignment
        let text = cryptoTitleLabel.text
        
        // Assert
        XCTAssertEqual(textFont, .systemFont(ofSize: 30, weight: .bold) , "The current text font for the cryptoTitleLabel in CryptoTickerCoinsViewController should be .systemFont bold of size 30.")
        XCTAssertEqual(textColor,  .black, "The current text color for the cryptoTitleLabel in CryptoTickerCoinsViewController should be black.")
        XCTAssertEqual(textAlignment, .left, "The current text alignment for the cryptoTitleLabel in CryptoTickerCoinsViewController should be left.")
        XCTAssertEqual(text, "Coins:", "The current text for the cryptoTitleLabel in CryptoTickerCoinsViewController should be Coins:.")
    }
    
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasActivityIndicatorWithCorrectProperties(){
        
        // Arrange
        let cryptoActivityIndicator = sut.cryptoActivityIndicator
        
        // Act
        let activityIndicatorColor = cryptoActivityIndicator.color
        
        // Assert
        XCTAssertEqual(activityIndicatorColor, .black , "The current color for the cryptoActivityIndicator in CryptoTickerCoinsViewController should be black.")
        
    }

}
