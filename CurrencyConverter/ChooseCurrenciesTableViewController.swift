//
//  ChooseCurrenciesTableViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit

class ChooseCurrenciesTableViewController: UITableViewController {
    
    static let store = CurrencyDataStore.sharedInstance
    
    let flagsAndSigns = CurrencyFlagAndSignsDictionary()
    var listOfAvailableCurrencies: [String: Any] { return flagsAndSigns.listOfAvailableCurrencies }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        print(listOfAvailableCurrencies)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfAvailableCurrencies.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "chooseCell", for: indexPath)
        
//        cell.textLabel?.text =
     return cell
     }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
        
}
