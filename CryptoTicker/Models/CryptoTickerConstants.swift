//
//  CryptoTickerConstants.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 20/04/2024.
//

import Foundation

// MARK: Constants for the app
struct CryptoTickerConstants {
    
    
    static let cryptoUrlString = "https://api.coincap.io/v2/rates"
    
    // Only english language simple app, no need for localization
    static let cryptoAppTitle = "CryptoTicker"
    static let cryptoDescription = "Explore up-to-date cryptocurrency rates effortlessly. Stay informed about the latest trends in the digital currency market"
    static let cryptoButtonTitle = "Show coins"
    static let cryptoCoinCell = "CoinCell"
    static let coinsTitle = "Coins:"
    static let coinCellType = "Type"
    static let coinCellRateUSD = "Rate USD"
    static let coinActivityIndicator = "Retrieving coins..."
    static let noCoinsToShowError = "No coins to be found. Try again later."
    static let unknownError = "An unknown error ocurred. Try again later."
    static let dollarSymbol = "$"
    
}
