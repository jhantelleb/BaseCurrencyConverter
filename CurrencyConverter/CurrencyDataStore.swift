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
    var baseCurrency = BaseCurrency(base: "USD", amount: 1.00)
    var filter = Constants.defaultCurrenciesToDisplay
    
    
    init() { }
    
    func getAllDataFromAPI(completion: @escaping ([BaseCurrency]) -> ()) {
        CurrencyAPIClient.getCurrenciesDefaultFromAPI { (currenciesFromAPI, message) in
            OperationQueue.main.addOperation {
                self.allCurrencies = self.parse(currenciesFromAPI)
                completion(self.allCurrencies)
            }
        }
    }
    
    func getFilteredData() {
        self.convertCurrencies = filterDataToBeDisplayed(filter)
    }
    
    fileprivate func parse(_ data: [String:Any]) -> [BaseCurrency] {
        var currencies: [BaseCurrency] = []
        data.forEach{ let currency = BaseCurrency(base: $0.key, amount: $0.value as! Double)
            currencies.append(currency)
        }
        return currencies
    }
    
    func setBase() {
//        baseCurrency.base
    }
    
    func filterDataToBeDisplayed(_ filter: [String]) -> [BaseCurrency] {
        var filteredCurrencies = [BaseCurrency]()
        self.allCurrencies.forEach{ (currency) in
             filter.forEach{
                if $0 == currency.base {
                   filteredCurrencies.append(currency)
                }
             }
        }
        return filteredCurrencies
    }
    
    
}
