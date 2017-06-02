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
        self.base = "USD"
        self.amount = 1.00
    }
    
    override init(base: String) {
        super.init()
        self.base = base
    }
    
    
    func changeBase(base: String) {
        //add base currency to currenciesToDisplay
        
    }
}
