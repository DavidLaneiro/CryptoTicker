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
            
            idLabel.text = cryptoTickerCoin?.id
            
        }
        
    }
    
    let idLabel : UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addLayout()
        
    }
    
    
    fileprivate func addLayout(){
        
        self.contentView.addSubview(idLabel)

        NSLayoutConstraint.activate([
            self.idLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.idLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.idLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.idLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
