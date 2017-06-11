//
//  ChooseCurrenciesTableViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit

protocol ChosenCurrency {
    func passChosen(_ currencies: [String]) -> [Currency]
}

class ChooseCurrenciesTableViewController: UITableViewController {
    
    let store = CurrencyDataStore.sharedInstance
    var chooseCurrency: [ChooseCurrencyItem] = []
    var delegate: ChosenCurrency?
    var convertCurrencies: [Currency] { return store.convertCurrencies }
    var selectedIndices: [Int] = []
    var selectedFromOtherVC: [String] = [] //just get base
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OperationQueue.main.addOperation {
            self.store.getListOfAvailableCurrencies{ data in
                self.chooseCurrency = data
                self.chooseCurrency = self.checkDisplayed(self.chooseCurrency).sorted{ $0.base < $1.base }
                self.tableView.reloadData()
            }
        }
        self.tableView.allowsMultipleSelection = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chooseCurrency.count
    }
    
    //TODO: Fix row selection checkmark
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chooseCell", for: indexPath)
        cell.textLabel?.text = chooseCurrency[indexPath.row].base
        guard chooseCurrency[indexPath.row].countryName != nil else { return cell }
        cell.detailTextLabel?.text = chooseCurrency[indexPath.row].countryName
        cell.tintColor = UIColor.orange
        
        if chooseCurrency[indexPath.row].selected {
           cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = chooseCurrency[indexPath.row]
        
        chooseCurrency[indexPath.row].selected = !item.selected
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if chooseCurrency[indexPath.row].selected {
            cell.accessoryType = .checkmark
            } else {
            cell.accessoryType = .none
            }
        }
        
        
    }
    
    func checkDisplayed(_ currencies: [ChooseCurrencyItem]) -> [ChooseCurrencyItem] {
        var updated = currencies
        
        //TODO: Improve this loop. Currently O(2N)
        for (index, currency) in updated.enumerated() {
            self.selectedFromOtherVC.forEach{
                if $0 == currency.base {
                   updated[index].selected = true
                }
            }
        }
    
        return updated
    }
}

//extension ChooseCurrenciesTableViewController: ChosenCurrency {
//    func passChosen(_ currencies: [String]) {
//        
//    }
//    
//}
