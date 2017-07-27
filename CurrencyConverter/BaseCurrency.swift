//
//  BaseCurrency.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/2/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

class BaseCurrency: Currency {
    
    override init() {
        super.init()
    }
    
    override init(base: String) {
        super.init()
        self.base = base
    }
    
    override init(base: String, amount: Double) {
        super.init(base: base, amount: amount)
    }
    
    func changeBase(base: String) {
        //add base currency to currenciesToDisplay
        
    }
}
