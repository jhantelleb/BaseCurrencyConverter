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

class CurrencyAPIClient {
    
    static let baseCurrencyURL = Secrets.currencyURL
    static let accessKey = Secrets.accessKey
    
    public class func getFilteredCurrenciesFromAPIUsing(filter: [String], completion: @escaping ([String:Any], String) -> Void) {
        var currencies = [String:Any]()
        var message = ""
        let filterFetch = filter.reduce("") { return $0 + $1 + "," }
        
        let url = "\(baseCurrencyURL)/live?\(accessKey)&currencies=\(filterFetch.dropLast())&format=1"
        
        Alamofire.request(url).responseJSON{ (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                let json = JSON(value)
                guard let quotes = json["quotes"].dictionaryObject else { return }
                currencies = quotes
                message = "Success"
            case .failure(let error):
                message = error.localizedDescription
            }
            completion(currencies, message)
        }
    }
    
    public class func getListOfAvailableCurrenciesFromAPI(completion: @escaping ([String:Any], String) -> Void) {
        var message = ""
        var listOfAvailable = [String:Any]()
        
        let url = "\(baseCurrencyURL)list?\(accessKey)&format=1"
        
        Alamofire.request(url).responseJSON{ (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                let json = JSON(value)
                guard let list = json["currencies"].dictionaryObject else { return }
                listOfAvailable = list
                message = "Success"
            case .failure(let error):
                message = error.localizedDescription
            }
            completion(listOfAvailable, message)
        }
    }
}
