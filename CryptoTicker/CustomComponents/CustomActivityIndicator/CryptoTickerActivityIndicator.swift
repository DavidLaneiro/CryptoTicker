//
//  CryptoTickerActivityIndicator.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 30/04/2024.
//

import Foundation
import UIKit

class CryptoTickerActivityIndicator: UIActivityIndicatorView{
    
    let activityIndicatorLabel : UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        label.text = CryptoTickerConstants.coinActivityIndicator
        return label
        
        
    }()
    
    
    override init(style: UIActivityIndicatorView.Style = .large) {
        super.init(style: style)
        self.addActivityIndicatorLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addActivityIndicatorLabel(){
        
        self.addSubview(activityIndicatorLabel)
        
        NSLayoutConstraint.activate([
            self.activityIndicatorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicatorLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10)
        
        ])
        
    }
    
}
