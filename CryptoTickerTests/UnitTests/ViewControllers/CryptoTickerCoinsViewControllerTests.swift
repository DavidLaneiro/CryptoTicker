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
    var cryptoWebService : CryptoTickerWebserviceMock!
    var cryptoPresenter : CryptoTickerCoinsPresenterMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CryptoTickerCoinsViewController()
        cryptoWebService = CryptoTickerWebserviceMock()
        cryptoPresenter = CryptoTickerCoinsPresenterMock(cryptoWebService: cryptoWebService, delegate: sut)
        sut.cryptoPresenter = cryptoPresenter
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        cryptoWebService = nil
        cryptoPresenter = nil
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
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasTableViewWithCorrectNumberOfCells(){
        
        // Arrange
        let cryptoTableView = sut.cryptoTableView
    
        // Act
        let numberOfRows = cryptoTableView.numberOfRows(inSection: 0)
        
        // Assert
        XCTAssertEqual(numberOfRows, 1, "The table view of coins must only have 1 coin cell based on the dummy data.")
        
    }
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasTableViewWithCorrectCellType(){
        
        // Arrange
        let cryptoTableView = sut.cryptoTableView
    
        // Act
        cryptoTableView.reloadData()
        let cell = cryptoTableView.cellForRow(at: .init(row: 0, section: 0))
        
        
        // Assert
        XCTAssertNotNil(cell, "Cell should not be nil")
        XCTAssertTrue(cell is CoinCell, "The table view cell must be of type CoinCell.")
    }
    
    func testCryptoTickerCoinsViewController_WhenCreated_HasTableViewWithCorrectCellData(){
        
        // Arrange
        let cryptoTableView = sut.cryptoTableView
    
        // Act
        cryptoTableView.reloadData()
        
        let cell = cryptoTableView.cellForRow(at: .init(row: 0, section: 0))
        
        // CryptoTickerCoin(id: "barbadian-dollar", symbol: "BBD", currencySymbol: "$", type:  "fiat", rateUsd: "0.5000000000000000")
    
        guard let cell = cell as? CoinCell else {
            XCTFail("Expected a cell of type CoinCell")
            return
        }
        
        let cellIdTitle = cell.idLabel.text
        let cellTypeTitle = cell.typeLabel.text
        let cellTypeContent = cell.typeLabelContent.text
        let cellRateUSDTitle = cell.rateUSDLabel.text
        let cellRateUSDContent = cell.rateUSDLabelContent.text
        
        // Assert
        XCTAssertEqual(cellIdTitle, "Barbadian-Dollar $ (BBD)", "The cellIdTitle should be Barbadian-dollar $ (BBD)")
        XCTAssertEqual(cellTypeTitle, "Type", "The cellTypeTitle should be Type")
        XCTAssertEqual(cellTypeContent, "Fiat", "The cellTypeContent should be Fiat")
        XCTAssertEqual(cellRateUSDTitle, "Rate USD", "The cellRateUSDTitle should be Rate USD")
        XCTAssertEqual(cellRateUSDContent, "0.5000000000000000$", "The cellRateUSDContent should be 0.5000000000000000$")
        
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
    
    func testCryptoTickerCoinsViewController_WhenCreated_CallsProcessGetCoins(){

        // Assert
        XCTAssertTrue(cryptoPresenter.processGetCoinsCalled, "The current processGetCoinsCalled in the CryptoTickerCoinsPresenterMock should be true when the CryptoTickerCoinsViewController is loaded.")
        
    }
    
    

}
