//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/25/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import Floaty
import SwiftSpinner

class CurrencyViewController: UIViewController, ChosenCurrencyDelegate {
    
    @IBOutlet weak var baseCurrencyView: BaseCurrencyView!
    @IBOutlet weak var conversionsTableView: UITableView!
    
    let store = CurrencyDataStore.sharedInstance
    let amount = 0.00
    var currenciesToDisplay = [Currency]()
    let floaty = Floaty()
    var filter = Constants.defaultCurrenciesToDisplay
    let chosenCurrency = ChooseCurrenciesTableViewController()
    var oldBase = ""
    let networkStatus = NetworkStatus.sharedInstance
    
    override func viewDidLoad() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.image = UIImage(named: "headerLogoBlue")
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        super.viewDidLoad()
        checkReachability()
        OperationQueue.main.addOperation {
            self.store.getDataFromAPI{ data in
                self.currenciesToDisplay = data
                self.conversionsTableView.reloadData()
                self.stopListening()
            }
        }
        
        //Add Currency
        floaty.addItem("Add Currency", icon: UIImage(named: "addCurrency")) { (item) in
            self.performSegue(withIdentifier: "choose", sender: nil)
        }
        
        //Settings - Feedback etc?
        self.view.addSubview(floaty)
        self.conversionsTableView.allowsMultipleSelectionDuringEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    
    func passChosen(_ currencies: [String]) {
        SwiftSpinner.show("Converting new currencies", animated: true)
        self.store.addCurrencies(currencies)
        checkReachability()
        let base = (self.baseCurrencyView.baseCurrencyLabel.text)!
        DispatchQueue.main.async {
            self.store.getCurrenciesForNewBase(newBase: base) { data in
                self.currenciesToDisplay.removeAll()
                self.currenciesToDisplay = data
                SwiftSpinner.hide()
                self.stopListening()
                self.conversionsTableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //test
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currenciesToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currency = self.currenciesToDisplay[indexPath.row]
        
        let cell = conversionsTableView.dequeueReusableCell(withIdentifier: "othersCell", for: indexPath) as! ConvertTableViewCell
        
        
        if let cName = currency.currencyName {
            cell.currencyLabel?.text = "1 \(baseCurrencyView.baseCurrencyLabel.text!) = \(currency.amount.format2D()) \(cName)"
        }
        //        } else {
        //            cell.currencyLabel?.text = "1 \(baseCurrencyView.baseCurrencyLabel.text!) = \(currency.amount.format2D()) \(currency.base)"
        //        }
        
        if let sign = currency.sign {
            cell.signLabel?.text = sign
        } else {
            cell.signLabel?.text = ""
        }
        
        if let flag = currency.flag {
            cell.flagImage.image = flag
        } else {
            cell.flagImage.image = UIImage(named: "")
        }
        
        guard let baseAmount = baseCurrencyView.baseAmountTextField.text else { return cell }
        
        guard let dAmount = Double(baseAmount) else { return cell }
        if baseAmount.isEmpty ||
            dAmount == 0 {
            cell.convertedAmountLabel?.text = String(currency.amount.format2D())
        } else {
            let computedAmount = currency.amount * dAmount
            cell.convertedAmountLabel?.text = computedAmount.format2D().trimmingCharacters(in: .whitespaces)
        }
        
        OperationQueue.main.addOperation {
            self.conversionsTableView.reloadData()
        }
        return cell
    }
    
    //MARK: Header View configurations
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.contentView.alpha = 0.8
        header.textLabel?.textColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Converted Currencies"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        checkReachability()
        
        if identifier == "choose" {
            if let navBar = segue.destination as? UINavigationController {
                let destination = navBar.topViewController as! ChooseCurrenciesTableViewController
                self.currenciesToDisplay.forEach{
                    // destination.selectedCurrencies.append($0.base)
                    destination.selectedCurrencies.insert($0.base)
                }
                destination.delegate = self
            }
        }
    }
    
    //MARK: Change Currency with Single Tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        oldBase = baseCurrencyView.baseCurrencyLabel.text! //store base then add to tableView
        let newBaseCurrency = self.currenciesToDisplay[indexPath.row]
        
        
        //Add to filter
        self.store.addCurrency(oldBase)
        //Remove from Filter
        self.store.removeFromFilter(newBaseCurrency.base)
        SwiftSpinner.show("Changing base currency", animated: true)
        
        checkReachability()
        DispatchQueue.main.async {
            self.store.getCurrenciesForNewBase(newBase: newBaseCurrency.base) { (currency) in
                
                //Replace Base with new key
                self.baseCurrencyView.baseCurrencyLabel.text = newBaseCurrency.base
                self.baseCurrencyView.baseSignLabel.text = newBaseCurrency.sign
                self.baseCurrencyView.flagImageView.image = newBaseCurrency.flag
                self.baseCurrencyView.baseAmountTextField.text = String(newBaseCurrency.amount)
                self.currenciesToDisplay = currency
                self.conversionsTableView.reloadData()
                SwiftSpinner.hide()
                self.stopListening()
            }
        }
    }
    
    //MARK: Remove Currency from Converted Currencies TV
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        print("DELETE! \(editingStyle)")
    //        if  editingStyle == .delete {
    //            self.currenciesToDisplay.remove(at: indexPath.row)
    //            self.conversionsTableView.deleteRows(at: [indexPath], with: .fade)
    //            self.conversionsTableView.reloadData()
    //        }
    //    }
    
    //Reachability
    fileprivate func checkReachability() {
        let manager  = networkStatus.reachabilityManager
        guard let reachable = manager?.isReachable else { return }
        if !reachable {
            SwiftSpinner.show("Make sure device is connected to the internet.").addTapHandler({
                SwiftSpinner.hide()
            }, subtitle: "This app requires internet connection. Connect to a wifi or turn on mobile data. Tap to hide.")
        } else {
            self.conversionsTableView.reloadData()
        }
    }
    
    fileprivate func stopListening() {
        let manager = networkStatus.reachabilityManager
        manager?.stopListening()
    }
    
}

//MARK: BaseCurrency Delegate
extension CurrencyViewController: BaseCurrencyDelegate {
    func reloadData() {
        OperationQueue.main.addOperation {
            self.conversionsTableView.reloadData()
        }
    }
}


extension Double {
    func format2D() -> String {
        return String(format: "%.4f", self)
    }
}
