//
//  CurrencyManager.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

class CurrencyDataStore {
    
    static let sharedInstance = CurrencyDataStore()
    
    var allCurrencies = [BaseCurrency]()
    var convertCurrencies = [BaseCurrency]()
    
    init() { }
    
    func getDataFromAPI(completion: @escaping ([BaseCurrency]) -> ()) {
        CurrencyAPIClient.getCurrenciesDefaultFromAPI { (currenciesFromAPI, message) in
            OperationQueue.main.addOperation {
              self.allCurrencies = self.parse(currenciesFromAPI)
//              print(self.allCurrencies)
              completion(self.allCurrencies)
            }
        }
    }
    
    func changeBase() {
        //added feature
    }
    
    fileprivate func parse(_ data: [String:Any]) -> [BaseCurrency] {
        var currencies: [BaseCurrency] = []
        
        
        data.forEach{ let currency = BaseCurrency(base: $0.key, amount: $0.value as! Double)
            currencies.append(currency)
        }
        
        return currencies
    }

    
    
}
