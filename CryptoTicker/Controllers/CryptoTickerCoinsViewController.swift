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
    
    var cryptoCoins : CryptoTickerCoins?
    
    // MARK: TableView
    let cryptoTableView : UITableView = {
        
        let tableView = UITableView()
        
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    // MARK: StackViews
    let cryptoVerticalStackView : UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    // MARK: Labels
    let cryptoTitleLabel : UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        
        // For now just for testing purposes
        label.text = CryptoTickerConstants.coinsTitle
        
        return label
        
    }()
    
    
    
    
    // MARK: Activity Indicator
    
    let cryptoActivityIndicator : CryptoTickerActivityIndicator = {
        
        let activityIndicator = CryptoTickerActivityIndicator()
        activityIndicator.color = .black
        return activityIndicator
        
    }()
    
    // MARK: Initial Setup
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // TableView Delegate and Data Source
        self.cryptoTableView.dataSource = self
        self.cryptoTableView.delegate = self
        
        // Register the custom cell
        self.cryptoTableView.register(CoinCell.self, forCellReuseIdentifier: CryptoTickerConstants.cryptoCoinCell)
    
        
        // Add UI in order
        self.addStackView()
        self.addActivityIndicator()
        self.addTitle()
        self.addTableView()
        
        // Add Gesture recognizer to title label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(titleTouchUpInside))
        
        self.cryptoTitleLabel.addGestureRecognizer(tapGesture)
        
        
        // In case we do not have a Presenter
        if cryptoPresenter == nil {
            
            let cryptoWebService = CryptoTickerWebService(urlString: CryptoTickerConstants.cryptoUrlString)
            
            cryptoPresenter = CryptoTickerCoinsPresenter(cryptoWebService: cryptoWebService, delegate: self)
            
        }
        
        // Get coins on load of this viewController
        self.cryptoPresenter?.processGetCoins()
        
        // Hide the Title Label
        self.hideTitleLabel()
        
        // Animate the activity indicator while the response does not arrive
        self.showActivityIndicator()
        
        
    }
    
    // MARK: Title Label Functions
    
    fileprivate func showTitleLabel() {
            // Show the title label
            self.cryptoTitleLabel.isHidden = false
    }
    
    fileprivate func hideTitleLabel() {
            // Hide the title label
            self.cryptoTitleLabel.isHidden = true
    }
    
    @objc fileprivate func titleTouchUpInside(){
        
        self.dismiss(animated: true)
        
    }
    
    // MARK: Activity Indicator Functions
    
    fileprivate func showActivityIndicator() {
        // Show the activity indicator
        self.cryptoActivityIndicator.isHidden = false
        self.cryptoActivityIndicator.startAnimating()
    }
    
    fileprivate func hideActivityIndicator() {
        // Hide the activity indicator
        self.cryptoActivityIndicator.isHidden = true
        self.cryptoActivityIndicator.stopAnimating()
    }
    
    // MARK: Show alert
    fileprivate func showAlert(cryptoError : CryptoTickerErrorModel){
        
        // Show the alert and when OK is Tapped
        // View controller is dismissed
        let alertController = UIAlertController(title: "Alert" , message: cryptoError.errorDescription , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
            self.dismiss(animated: true)
            
        })
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
        
    }
    
    // MARK: Add layout
    fileprivate func addStackView(){
        
        self.view.addSubview(cryptoVerticalStackView)
        
        NSLayoutConstraint.activate([
            self.cryptoVerticalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.cryptoVerticalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.cryptoVerticalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.cryptoVerticalStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
    }
    
    fileprivate func addActivityIndicator(){
        self.view.addSubview(cryptoActivityIndicator)
        self.cryptoActivityIndicator.center = self.view.center
    }
    
    fileprivate func addTitle(){
        
        self.cryptoVerticalStackView.addArrangedSubview(self.cryptoTitleLabel)
        
    }
    
    
    fileprivate func addTableView(){
        self.cryptoVerticalStackView.addArrangedSubview(self.cryptoTableView)
    }
}


// MARK: Extensions

// CryptoTickerViewDelegateProtocol

extension CryptoTickerCoinsViewController : CryptoTickerViewDelegateProtocol {
    func successfullCoinsRetrieving(retrievedCoins: CryptoTickerCoins) {
        
        self.cryptoCoins = retrievedCoins
        
        DispatchQueue.main.async{
            self.hideActivityIndicator()
            self.showTitleLabel()
            self.cryptoTableView.reloadData()
        }
        
        
    }
    
    
    func errorHandler(error: CryptoTickerErrorModel) {
        
        // Hide the activity indicator
        
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.hideTitleLabel()
            self.showAlert(cryptoError: error)
        }
        
    }
    
}

// UITableViewDataSource & UITableViewDelegate

extension CryptoTickerCoinsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // If there is any coins data return that count value
        let numberOfRows = self.cryptoCoins?.data.count ?? 0
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTickerConstants.cryptoCoinCell, for: indexPath) as! CoinCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.cryptoTickerCoin = self.cryptoCoins?.data[indexPath.row]
        
        return cell
        
    }
    
}
