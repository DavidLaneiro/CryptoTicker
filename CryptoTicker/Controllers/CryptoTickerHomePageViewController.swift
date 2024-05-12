//
//  CryptoTickerViewController.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation
import UIKit

class CryptoTickerHomePageViewController : UIViewController{
    
    // MARK: Create UI Programatically
    
    let homePageLogo : UIImageView = {
        
        let image = UIImage(named: "manyCoins") ?? UIImage()
        let imageView = UIImageView(image: image)
        return imageView
        
    }()
    
    let cryptoTitle : UILabel = {
        
        let title = UILabel()
        title.textAlignment = .center
        title.text = CryptoTickerConstants.cryptoAppTitle
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.textColor = .black
        
        return title
        
    }()
    
    let cryptoSubtitle : UILabel = {
       
        let subtitle = UILabel()
        
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 0
        subtitle.text = CryptoTickerConstants.cryptoDescription
        subtitle.font = .systemFont(ofSize: 18, weight: .regular)
        subtitle.textColor = .black
        
        return subtitle
        
    }()
    
    let cryptoButton : UIButton = {
        
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemRed
        button.configuration?.title = CryptoTickerConstants.cryptoButtonTitle
        button.configuration?.image = UIImage(systemName: "bitcoinsign")
        
        
        return button
    }()
    
    let cryptoStackView : UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        
        
        return stackView
    }()


    // MARK: Set the background color and the StackView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
               
        cryptoButton.addTarget(self, action: #selector(getCoinsTapped), for: .touchUpInside)
        
        addStackView()
    

    }

    // MARK: Functions

    // Add subviews in order to the vertical stackview
    // Add constraints
    private func addStackView(){
        
        cryptoStackView.addArrangedSubview(homePageLogo)
        cryptoStackView.addArrangedSubview(cryptoTitle)
        cryptoStackView.addArrangedSubview(cryptoSubtitle)
        cryptoStackView.addArrangedSubview(cryptoButton)
        
        cryptoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cryptoStackView)
        
        NSLayoutConstraint.activate([
            cryptoStackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            cryptoStackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            cryptoStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cryptoStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            cryptoButton.heightAnchor.constraint(equalToConstant: 50),
            cryptoButton.widthAnchor.constraint(equalToConstant: 200),
            homePageLogo.heightAnchor.constraint(equalToConstant: 100),
            homePageLogo.widthAnchor.constraint(equalToConstant: 100),
            cryptoSubtitle.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }

    
    
    @objc func getCoinsTapped(){
        
        DispatchQueue.main.async {
            self.present(CryptoTickerCoinsViewController(), animated: true)
        }
        
    }
    
}

