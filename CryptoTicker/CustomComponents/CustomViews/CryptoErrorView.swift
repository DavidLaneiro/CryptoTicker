//
//  CryptoErrorView.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 03/05/2024.
//

import Foundation
import UIKit

class CryptoErrorView : UIView{
    
    private var cryptoImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private var cryptoErrorLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func setImage(_ image: UIImage){
        
        self.cryptoImageView.image = image
        self.addSubview(cryptoImageView)
        
        NSLayoutConstraint.activate([
            self.cryptoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        ])
        
    }
    
    func setText(_ text: String){
        
        self.cryptoErrorLabel.text = text
        self.addSubview(cryptoErrorLabel)
        
        NSLayoutConstraint.activate([
            self.cryptoErrorLabel.topAnchor.constraint(equalTo: self.cryptoImageView.bottomAnchor, constant: 20),
            self.cryptoErrorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.cryptoErrorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),

        ])
        
        
    }

  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
