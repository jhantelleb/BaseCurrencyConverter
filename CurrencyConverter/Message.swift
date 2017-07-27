//
//  Message.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

enum MessageType: String {
    case error = "Error"
    case success = "Success"
}

protocol Message {
    var messageType: String { get set }
    var message: String { get set }
}
