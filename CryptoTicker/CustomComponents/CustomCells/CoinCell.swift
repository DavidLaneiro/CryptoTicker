//
//  CoinCell.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 29/04/2024.
//

import Foundation
import UIKit

class CoinCell : UITableViewCell {
    
    // Set this variable to populate the cell
    var cryptoTickerCoin : CryptoTickerCoin?{
        didSet{
            idLabel.text = "\(cryptoTickerCoin?.id.capitalized ?? "") \(cryptoTickerCoin?.currencySymbol ?? "") (\(cryptoTickerCoin?.symbol ?? ""))"
            
            typeLabelContent.text = cryptoTickerCoin?.type.capitalized ?? ""
            
            rateUSDLabelContent.text = "\(cryptoTickerCoin?.rateUsd ?? "") \(cryptoTickerCoin?.currencySymbol ?? cryptoTickerCoin?.symbol ?? "")"
            
        }
    }
    
    // StackViews
    let coinCellVerticalStackView : UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
        
    }()
    
    let coinCellHorizontalStackView : UIStackView = {
       
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .top
        
        return stackView
        
        
    }()
    
    let typeContentStackView : UIStackView = {
       
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
        
        
    }()
    
    let rateUSDStackView : UIStackView = {
       
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
        
        
    }()

    // Labels
    
    let idLabel : UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        
        
        return label
    
    }()
    
    let typeLabel : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = CryptoTickerConstants.coinCellType
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
        
    }()
    
    let typeLabelContent : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
        
    }()
    
    let rateUSDLabel : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = CryptoTickerConstants.coinCellRateUSD
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
        
    }()
    
    let rateUSDLabelContent : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addCoinCellVerticalStackView()
        self.addTitleLabel()
        self.addCoinCellHorizontalStackView()
        self.addContentStackViewsToHorizontalStackView()
        self.addContentLabelsToContentStackViews()
        
    }
    
    // In order
    
    fileprivate func addCoinCellVerticalStackView(){
        
        self.contentView.addSubview(coinCellVerticalStackView)
        
        NSLayoutConstraint.activate([
            self.coinCellVerticalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.coinCellVerticalStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.coinCellVerticalStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.coinCellVerticalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            
        ])
        
    }
    
    fileprivate func addTitleLabel(){
        
        self.coinCellVerticalStackView.addArrangedSubview(self.idLabel)
        
    }
    
    fileprivate func addCoinCellHorizontalStackView(){
        
        self.coinCellVerticalStackView.addArrangedSubview(coinCellHorizontalStackView)
        
    }
    
    fileprivate func addContentStackViewsToHorizontalStackView(){
        
        self.coinCellHorizontalStackView.addArrangedSubview(self.typeContentStackView)
        self.coinCellHorizontalStackView.addArrangedSubview(self.rateUSDStackView)

    }
    
    fileprivate func addContentLabelsToContentStackViews(){
        
        self.typeContentStackView.addArrangedSubview(self.typeLabel)
        self.typeContentStackView.addArrangedSubview(self.typeLabelContent)
        self.rateUSDStackView.addArrangedSubview(self.rateUSDLabel)
        self.rateUSDStackView.addArrangedSubview(self.rateUSDLabelContent)
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
