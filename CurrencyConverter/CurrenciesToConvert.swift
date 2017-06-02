//
//  CurrenciesToConvert.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/2/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

struct CurrenciesToConvert {
    var currencies: [Currency] = []
    
    func convertAmountFromBase(baseAmount: Double ) {
        
    }
    
    mutating func addCurrency(currency: Currency) {
        self.currencies.append(currency)
    }
    
}
