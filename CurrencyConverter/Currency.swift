//
//  Currecny.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

protocol Currency {
    var base: String { get set }
    var amount: Double { get set }
    var flag: UIImage? { get set }
    var sign: String? { get set }
    
//    func setUpFlag(base: String) { }
//    func setUpSign(base: String) { }
}


struct BaseCurrency: Currency {

    var base: String
    var amount: Double
    var flag: UIImage? = UIImage(named: "")
    var sign: String? = "$"
    
    init(base: String, amount: Double) {
        self.base = base
        self.amount = amount
//        self.setUpFlag
    }
    
//    private func setUpFlag(base: self.base) { }
    
}

struct CurrenciesToConvert {
    var currencies: [Currency] = []
    
    func convertAmountFromBase(baseAmount: Double ) {
        
    }
    
    mutating func addCurrency(currency: Currency) {
        self.currencies.append(currency)
    }
    
}
