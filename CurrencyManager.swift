//
//  CurrencyManager.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/28/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

class CurrencyManager {
    
    var baseCurrency = BaseCurrency()
    var currenciesToConvert: [Currency] = []
    let store = CurrencyDataStore.sharedInstance
    
    init() {
        Constants.defaultCurrenciesToDisplay.forEach {
            let currency = Currency(base: $0)
            self.currenciesToConvert.append(currency)
        }
        
        OperationQueue.main.addOperation {
            self.store.getAllDataFromAPI { data in
                self.currenciesToConvert = self.store.filterDataToBeDisplayed(Constants.defaultCurrenciesToDisplay)
//                self.conversionsTableView.reloadData()
            }
        }
    }
    
    func addCurrency(currency: Currency) {
        //Add currency to CtoC array
        
    }
    
    func changeBaseCurrency() { }
    
    
    
    //    func showChart() { } //
    
}
