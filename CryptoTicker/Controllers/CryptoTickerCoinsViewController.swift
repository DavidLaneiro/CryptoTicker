//
//  CryptoTickerCoinsViewController.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 24/04/2024.
//

import Foundation
import UIKit

class CryptoTickerCoinsViewController : UIViewController{
    
    // MARK: UI and Variables
    var cryptoPresenter : CryptoTickerCoinsPresenterProtocol?
    
    let cryptoTableView : UITableView = {
        
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // TableView Delegate and Data Source
        self.cryptoTableView.dataSource = self
        self.cryptoTableView.delegate = self
        
        // Register the custom cell
        self.cryptoTableView.register(CoinCell.self, forCellReuseIdentifier: CryptoTickerConstants.cryptoCoinCell)
        
        // Add tableView as a subview
        self.addTableView()
        
        if cryptoPresenter == nil {
        
            let cryptoWebService = CryptoTickerWebService(urlString: CryptoTickerConstants.cryptoUrlString)
        
            cryptoPresenter = CryptoTickerCoinsPresenter(cryptoWebService: cryptoWebService, delegate: self)

        }

        
    }
    
    fileprivate func addTableView(){
        
        self.view.addSubview(cryptoTableView)
        
        NSLayoutConstraint.activate([
            self.cryptoTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.cryptoTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.cryptoTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.cryptoTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    
}

extension CryptoTickerCoinsViewController : CryptoTickerViewDelegateProtocol {
    func successfullCoinsRetrieving() {
        // Do something
    }
    
    func errorHandler(error: CryptoTickerErrorModel) {
        // Do something
    }
    
}

extension CryptoTickerCoinsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTickerConstants.cryptoCoinCell, for: indexPath) as! CoinCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
    
}
