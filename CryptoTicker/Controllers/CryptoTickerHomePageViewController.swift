//
//  CryptoTickerViewController.swift
//  CryptoTicker
//
//  Created by David  Lourenço on 19/04/2024.
//

import Foundation
import UIKit

class CryptoTickerHomePageViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension CryptoTickerHomePageViewController : CryptoTickerViewDelegateProtocol{
    
    func successfullCoinsRetrieving() {
         // Do something
    }
    
    func errorHandler(error: CryptoTickerErrorModel) {
        // Do something
    }
    
    
    
    
    
}
