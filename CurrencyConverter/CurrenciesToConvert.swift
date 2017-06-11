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
    
    func convertAmountFromBase(_ baseAmount: Double ) {
        
    }
    
    mutating func addCurrency(_ currency: Currency) {
        self.currencies.append(currency)
    }
    
}
