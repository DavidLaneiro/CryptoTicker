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
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func setImage(_ image: UIImage){
        
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        
        self.cryptoImageView.image = tintedImage
        self.cryptoImageView.tintColor = .systemGray
        
        self.addSubview(cryptoImageView)
        
        NSLayoutConstraint.activate([
            self.cryptoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.cryptoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.cryptoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.cryptoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    func setText(_ text: String){
        
        self.cryptoErrorLabel.text = text
        self.addSubview(cryptoErrorLabel)
        
        NSLayoutConstraint.activate([
            self.cryptoErrorLabel.topAnchor.constraint(equalTo: self.cryptoImageView.bottomAnchor, constant: 10),
            self.cryptoErrorLabel.widthAnchor.constraint(equalToConstant: 200),
            self.cryptoErrorLabel.centerXAnchor.constraint(equalTo: self.cryptoImageView.centerXAnchor)

        ])
        
        
    }

  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
