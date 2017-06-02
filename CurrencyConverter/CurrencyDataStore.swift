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
    
    var allCurrencies = [Currency]()
    var convertCurrencies = [Currency]()
    var baseCurrency = BaseCurrency()
    var filter = Constants.defaultCurrenciesToDisplay
    
    
    init() { }
    
    func getAllDataFromAPI(completion: @escaping ([Currency]) -> ()) {
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
    
    fileprivate func parse(_ data: [String:Any]) -> [Currency] {
        var currencies: [Currency] = []
        data.forEach{ let currency =
            Currency(base: $0.key, amount: $0.value as! Double)
            currencies.append(currency)
        }
        return currencies
    }
    
    func setBase() {
//        baseCurrency.base
    }
    
    func filterDataToBeDisplayed(_ filter: [String]) -> [Currency] {
        var filteredCurrencies = [Currency]()
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
