//
//  AppDelegate.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import SwiftSpinner

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let networkStatus = NetworkStatus.sharedInstance
    let store = CurrencyDataStore.sharedInstance

    //Get instance of Base, Amount and Converted Currencies
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let initializeCurrency = CurrencyFlagAndSignsDictionary()
//        initializeCurrency.resetDictionary()
        if !initializeCurrency.isDictionaryCreated {
            initializeCurrency.createDictionaries()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        UserDefaults.standard.setValue(store.baseCurrency.base, forKey: "base")
        UserDefaults.standard.setValue(store.baseCurrency.amount, forKey: "amount")
        UserDefaults.standard.setValue(store.filter, forKey: "filter")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDefaults.standard.setValue(store.baseCurrency.base, forKey: "base")
        UserDefaults.standard.setValue(store.baseCurrency.amount, forKey: "amount")
        UserDefaults.standard.setValue(store.filter, forKey: "filter")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //Check for reachability
        let manager  = networkStatus.reachabilityManager
        guard let reachable = manager?.isReachable else { return }
        if !reachable {
            SwiftSpinner.show("Make sure device is connected to the internet.").addTapHandler({
                SwiftSpinner.hide()
            }, subtitle: "This app requires internet connection. Connect to a wifi or turn on mobile data. Tap to hide.")
        }
        
        // Check if there's an entry for base and converted currencies in the user defaults
        guard let base = UserDefaults.standard.value(forKey: "base") else { return }
        guard let amount =  UserDefaults.standard.value(forKey: "amount") else { return }
        store.baseCurrency = Currency(base: (base as! String), amount: (amount as! Double))
        guard let filterCurrency = UserDefaults.standard.array(forKey: "filter") as? [String] else { return }
        store.filter = filterCurrency
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaults.standard.setValue(store.baseCurrency.base, forKey: "base")
        UserDefaults.standard.setValue(store.baseCurrency.amount, forKey: "amount")
        UserDefaults.standard.setValue(store.filter, forKey: "filter")
    }


}

