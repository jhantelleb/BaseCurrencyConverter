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
    
    var allCurrencies: [Currency] = []
    var convertCurrencies: [Currency] = []
    var baseCurrency = Currency()
    var filter = Constants.defaultCurrenciesToDisplay
        
    
    init() { }
    
    func getAllDataFromAPI(completion: @escaping ([Currency]) -> ()) {
        CurrencyAPIClient.getAllCurrenciesDefaultFromAPI { (currenciesFromAPI, message) in
            OperationQueue.main.addOperation {
                self.allCurrencies = self.parse(currenciesFromAPI)
                completion(self.allCurrencies)
            }
        }
    } //change to convert Currencies
    
    
    func setBase() {
        let currency = Currency(base: "USD", amount: 1.00)
        self.baseCurrency = currency
    }
    
    func setCurrenciesForDisplay() {
        self.convertCurrencies = filterDataToBeDisplayed(filter)
    }
    
    
    func addCurrency(_ key: String) {
//        getCurrencyFromAPI(using: key, completion: )
    }
    
//    func getCurrencyFromAPI(using key: String, completion: [Currency]) {
//        let currency = Currency(
//        completion(currency)
//    }
    
    //MARK: Helper functions
    fileprivate func parse(_ data: [String:Any]) -> [Currency] {
        var currencies: [Currency] = []
        data.forEach{
            let base = String($0.key.characters.dropFirst(3))
            let currency = Currency(base: base, amount: $0.value as! Double)
            currencies.append(currency)
        }
        return currencies
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
    
    func updateAvailableList(_ removing: [Currency]) {
        
    }
}
