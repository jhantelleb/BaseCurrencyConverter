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
    
    static let baseCurrencyALLURL = "\(Secrets.currencyURL)live?\(Secrets.accessKey)"
    
    public class func getCurrenciesDefaultFromAPI(completion: @escaping ([String:Any], String) -> Void) {
        var currencies = [String:Any]()
        var message = ""
        
        Alamofire.request(baseCurrencyALLURL).responseJSON{ (dataResponse) in
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
    
//    public func getCurrencyFromAPI(completion: ([String:Any], String) -> Void) {
//        
//        Alamofire.request(base)
//        
//    }
    
}
