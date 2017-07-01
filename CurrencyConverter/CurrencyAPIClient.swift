//
//  CurrencyAPIClient.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner

class CurrencyAPIClient {
    
    let baseCurrencyURL = Secrets.currencyURL
    let accessKey = Secrets.accessKey
    
    var message = ""
    
    func getFilteredCurrenciesFromAPIUsing(_ filter: [String], completion: @escaping ([String:Any], String) -> Void) {
        var currencies = [String:Any]()
        let filterFetch = filter.joined(separator: ",")
        
        let url = "\(baseCurrencyURL)/live?\(accessKey)&currencies=\(filterFetch)&format=1"
        
        Alamofire.request(url).responseJSON{ (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                let json = JSON(value)
                guard let quotes = json["quotes"].dictionaryObject else { return }
                currencies = quotes
                self.message = "Success"
            case .failure(let error):
                self.message = error.localizedDescription
            }
            completion(currencies, self.message)
        }
    }
    
    func getListOfAvailableCurrenciesFromAPI(_ completion: @escaping ([String:Any], String) -> Void) {
        var listOfAvailable = [String:Any]()
        
        let url = "\(baseCurrencyURL)list?\(accessKey)&format=1"
        
        Alamofire.request(url).responseJSON{ (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                let json = JSON(value)
                guard let list = json["currencies"].dictionaryObject else { return }
                listOfAvailable = list
                self.message = "Success"
            case .failure(let error):
                self.message = error.localizedDescription
            }
            completion(listOfAvailable, self.message)
        }
    }
    
    func changeBase(newBase: String, filter: [String], completion: @escaping ([String:Any], String) -> Void )
    {
        var currencies = [String:Any]()
        let filterFetch = filter.joined(separator: ",")
        
        let url = "\(baseCurrencyURL)live?\(accessKey)&source=\(newBase)&currencies=\(filterFetch)&format=1"
        
        Alamofire.request(url).responseJSON{ (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                let json = JSON(value)
                guard let quotes = json["quotes"].dictionaryObject else { return }
                currencies = quotes
                self.message = "Success"
            case .failure(let error):
                self.message = error.localizedDescription
            }
            completion(currencies, self.message)
        }
    }
}
