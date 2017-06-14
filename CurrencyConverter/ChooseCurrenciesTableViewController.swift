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
    var selectedCurrencies: Set<String> = []
    let currencyFlagsAndSigns = CurrencyFlagAndSignsDictionary()
    var searchedCurrencies = [ChooseCurrencyItem]()
    let searchController = UISearchController(searchResultsController: nil)
    
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
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.clipsToBounds = true
        tableView.delegate = self
        tableView.tableHeaderView = searchController.searchBar
        
        //        tableView.tableHeaderView?.addSubview(searchController.searchBar)
        
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
        if searchController.isActive &&
            searchController.searchBar.text != "" {
            return searchedCurrencies.count
        }
        return chooseCurrency.count
    }
    
    //TODO: Fix row selection checkmark
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chooseCell", for: indexPath)
        
        cell.tintColor = UIColor.orange
        
        guard chooseCurrency[indexPath.row].countryName != nil else { return cell }
        if searchController.isActive &&
            searchController.searchBar.text != "" {
            cell.textLabel?.text = searchedCurrencies[indexPath.row].base
            cell.detailTextLabel?.text = searchedCurrencies[indexPath.row].countryName
            if searchedCurrencies[indexPath.row].selected {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        } else {
            cell.textLabel?.text = chooseCurrency[indexPath.row].base
            cell.detailTextLabel?.text = chooseCurrency[indexPath.row].countryName
            
            if chooseCurrency[indexPath.row].selected {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        var item = chooseCurrency[indexPath.row]
        
        if searchController.isActive &&
            searchController.searchBar.text != nil {
            if self.selectedCurrencies.count < 10 {
                 item = searchedCurrencies[indexPath.row]
                searchedCurrencies[indexPath.row].selected = !item.selected
                if let cell = tableView.cellForRow(at: indexPath) {
                    if searchedCurrencies[indexPath.row].selected {
                        selectedCurrencies.insert(item.base)
//                        selectedCurrencies.append(item.base)
                        print(selectedCurrencies)
                        cell.accessoryType = .checkmark
                    } else {
                        selectedCurrencies.remove(item.base)
                        cell.accessoryType = .none
                    }
                }
            } else {
                //Alert you can only choose 10 
            }
        } else {
            if self.selectedCurrencies.count < 10 {
                chooseCurrency[indexPath.row].selected = !item.selected
//                selectedCurrencies.append(item.base)
                if let cell = tableView.cellForRow(at: indexPath) {
                    if chooseCurrency[indexPath.row].selected {
                        selectedCurrencies.insert(item.base)
                        cell.accessoryType = .checkmark
                    } else {
                        selectedCurrencies.remove(item.base)
                        cell.accessoryType = .none
                    }
                }
            }
        }
        
        
//        
//        if self.selectedCurrencies.count < 10 {
//            chooseCurrency[indexPath.row].selected = !item.selected
//            selectedCurrencies.append(item.base)
//            if let cell = tableView.cellForRow(at: indexPath) {
//                if chooseCurrency[indexPath.row].selected {
//                    cell.accessoryType = .checkmark
//                } else {
//                    cell.accessoryType = .none
//                }
//            }
//        } else{
//            print("More than 10 working")
//        }
        //        else {
        //            let titleForHeader = tableView.headerView(forSection: indexPath.section)
        //            titleForHeader?.tintColor = UIColor.white
        //            titleForHeader?.textLabel?.adjustsFontSizeToFitWidth = true
        //            titleForHeader?.textLabel?.text = "You can only choose 10 currencies at a time."
        //            titleForHeader?.contentView.backgroundColor = UIColor.orange
        //        }
    }
    
    //    Header Text
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Select More Currencies"
    //    }
    
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //
    //        if selectedCurrencies.count == 10 {
    //            let headerView = view as! UITableViewHeaderFooterView
    //            headerView.contentView.backgroundColor = UIColor.orange
    //            headerView.textLabel?.text = "You can only choose 10 currencies at a time."
    //            return headerView
    //        }
    
    
    //        return tableView.tableHeaderView
    //    }
    
    
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
    
    
    //Search Controller helper functions
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
    
    
    func filterContentForBase(searchText: String, scope: String = "All"){
        searchedCurrencies = self.chooseCurrency.filter{ currency -> Bool in
            return currency.base.lowercased().contains(searchText.lowercased())
        }
        self.tableView.reloadData()
    }
    
    func filterContentForCountry(searchText: String, scope: String = "All") {
        searchedCurrencies = self.chooseCurrency.filter{ currency -> Bool in
            guard let countryName = currency.countryName else { return false }
            return countryName.lowercased().contains(searchText.lowercased())
        }
        self.tableView.reloadData()
    }
    
    
}

extension ChooseCurrenciesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForCountry(searchText: searchController.searchBar.text!)
    }
}

