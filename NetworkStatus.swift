//
//  NetworkStatus.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/14/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import Alamofire

class NetworkStatus {
    static let sharedInstance = NetworkStatus()
    
    fileprivate init() { }
  
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: Secrets.currencyURL)
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.listener = { status in
            
            switch status {
                
            case .notReachable:
                print("The network is not reachable")
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            }
        }
        reachabilityManager?.startListening()
    }
}
