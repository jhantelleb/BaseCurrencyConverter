//
//  CurrencyManager.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

class CurrencyDataStore {
    
    static let sharedInstance = CurrencyDataStore()
    
    var allCurrencies: [Currency] = []
    var convertCurrencies: [Currency] = []
    var baseCurrency = Currency()
    var filter: [String] = Constants.defaultCurrenciesToDisplay
    
    
    //Available currencies based on available flags
    let flagsAndSigns = CurrencyFlagAndSignsDictionary()
    var listOfAvailableCurrencies: [String] {
        return parseFlagAndSigns(flagsAndSigns.listOfAvailableCurrencies) }
    
    var listOfCurrenciesToChooseFrom: [ChooseCurrencyItem] = []
    
    init() { }
    
    
    func getDataFromAPI(_ completion: @escaping ([Currency]) -> ()) {
        CurrencyAPIClient.getFilteredCurrenciesFromAPIUsing(filter) { (currenciesFromAPI, message) in
            OperationQueue.main.addOperation {
                self.convertCurrencies = self.parse(currenciesFromAPI)
                completion(self.convertCurrencies)
            }
        }
    }
    
    func getListOfAvailableCurrencies(_ completion: @escaping ([ChooseCurrencyItem]) -> ()) {
        var chooseItems = [ChooseCurrencyItem]()
        CurrencyAPIClient.getListOfAvailableCurrenciesFromAPI { (list, messge) in
            list.forEach {
                var item = ChooseCurrencyItem(base: $0.key)
                guard let detail = $0.value as? String else { return }
                item.countryName = detail
                chooseItems.append(item)
            }
            self.listOfCurrenciesToChooseFrom = chooseItems
            completion(chooseItems)
        }
    }
    
    func setBase(_ base: String, amount: Double) {
        let currency = Currency(base: base, amount: amount)
        self.baseCurrency = currency
    }
    
    func addCurrency(_ key: [String]) {
        self.filter.append(contentsOf: key)
    }
    
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
    
    
    func parseFlagAndSigns(_ data: [String:Any]) -> [String] {
        var availableList = [String]()
        data.forEach { availableList.append($0.key) }
        return availableList
    }
}
