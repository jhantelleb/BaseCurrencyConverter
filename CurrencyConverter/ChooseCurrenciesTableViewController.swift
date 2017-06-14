//
//  ChooseCurrenciesTableViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit

protocol ChosenCurrencyDelegate: class {
    func passChosen(_ currencies: [String])
}

class ChooseCurrenciesTableViewController: UITableViewController {
    
    let store = CurrencyDataStore.sharedInstance
    var chooseCurrency: [ChooseCurrencyItem] = []
    var selectedCurrencies: [String] = []
    let currencyFlagsAndSigns = CurrencyFlagAndSignsDictionary()
    
    weak var delegate: ChosenCurrencyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OperationQueue.main.addOperation {
            self.store.getListOfAvailableCurrencies{ data in
                let filtered = self.filterDisplay(data)
                self.chooseCurrency = self.checkDisplayed(filtered).sorted{ $0.base < $1.base }
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
    
    
    //IB Actions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func chooseButtonPressed(_ sender: Any) {
        var chosenCurrencies: [String] = []
        chooseCurrency.forEach { (chosen) in
            if chosen.selected {
                chosenCurrencies.append(chosen.base)
            }
        }
        
        self.dismiss(animated: true, completion: {
            self.delegate?.passChosen(chosenCurrencies)
        })
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
        
        if self.selectedCurrencies.count < 10 {
            chooseCurrency[indexPath.row].selected = !item.selected
            selectedCurrencies.append(item.base)
            if let cell = tableView.cellForRow(at: indexPath) {
                if chooseCurrency[indexPath.row].selected {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            }
        } else {
            let titleForHeader = tableView.headerView(forSection: indexPath.section)
            titleForHeader?.tintColor = UIColor.white
            titleForHeader?.textLabel?.adjustsFontSizeToFitWidth = true
            titleForHeader?.textLabel?.text = "You can only choose 10 currencies at a time."
            titleForHeader?.contentView.backgroundColor = UIColor.orange
        }
    }
    
    //Header Text
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select More Currencies"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if selectedCurrencies.count == 10 {
            let headerView = view as! UITableViewHeaderFooterView
            headerView.contentView.backgroundColor = UIColor.orange
            headerView.textLabel?.text = "You can only choose 10 currencies at a time."
            return headerView
        }
        return tableView.tableHeaderView
    }
    
    
    func checkDisplayed(_ currencies: [ChooseCurrencyItem]) -> [ChooseCurrencyItem] {
        var updated = currencies
        
        let selected = Set(self.selectedCurrencies)
        print(selected.intersection(currencies.map{ $0.base }))
        
        //Get the indices, store them in an array then use the indices to modify the selectedCurrencies array
        
        //TODO: Improve this loop. Currently O(N^2)
        for (index, currency) in updated.enumerated() {
            //selected
            self.selectedCurrencies.forEach{
                if $0 == currency.base {
                    updated[index].selected = true
                }
            }
        }
        return updated
    }
    
    func filterDisplay(_ currencies: [ChooseCurrencyItem]) -> [ChooseCurrencyItem] {
        
        let currencyDisplay = self.currencyFlagsAndSigns.listOfAvailableCurrencies
        var currencyReturn: [ChooseCurrencyItem] = []
        
        
        //TODO: Improve again :(
        currencyDisplay.forEach ({ display in
            currencies.forEach{
                if $0.base.lowercased() == display.key {
                    let displayValue = display.value as! CurrencyFlagandSign
                    var currencyItem = ChooseCurrencyItem(base: display.key)
                    currencyItem.currencyName = displayValue.currencyName
                    currencyItem.countryName = $0.countryName
                    currencyItem.flagImage = UIImage(named: displayValue.flagImageName)
                    currencyItem.selected = $0.selected
                    currencyItem.base = currencyItem.base.uppercased()
                    currencyReturn.append(currencyItem)
                }
            }
        })
      return currencyReturn
    }
    
    
}

