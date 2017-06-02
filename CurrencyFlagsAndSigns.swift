//
//  CurrencyFlagsAndSigns.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/28/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

struct CurrencyFlagandSign {
    var currencyName: String
    var iso4217: String
    var flagImageName: String
    var signSymbol: String
    
}

struct CurrencyFlagAndSignsDictionary {
    
    var isDictionaryCreated: Bool { return self.dictionaryInitialized() }
    
    init() {
//        self.createDictionaries()
    }
    
    var flagAndSignsDictionary: [String: CurrencyFlagandSign] = [:]

    
    func createDictionaries() {
        
        let flagsAndSigns: [[String:Any]] = [["all" : ["currencyName" : "Lek", "iso" : "ALL", "flagImage" : "all.png", "signSymbol" : "Lek"]],
        ["afn" : ["currencyName" : "Afghani", "iso" : "AFN", "flagImage" : "afn.png", "signSymbol" : "؋"]],
        ["ars" : ["currencyName" : "Peso", "iso" : "ARS", "flagImage" : "ars.png", "signSymbol" : "$"]],
        ["awg" : ["currencyName" : "Guilder", "iso" : "AWG", "flagImage" : "awg.png", "signSymbol" : "ƒ"]],
        ["aud" : ["currencyName" : "Dollar", "iso" : "AUD", "flagImage" : "aud.png", "signSymbol" : "$"]],
        ["azn" : ["currencyName" : "Manat", "iso" : "AZN", "flagImage" : "azn.png", "signSymbol" : "₼"]],
        ["bsd" : ["currencyName" : "Dollar", "iso" : "BSD", "flagImage" : "bsd.png", "signSymbol" : "$"]],
        ["bbd" : ["currencyName" : "Dollar", "iso" : "BBD", "flagImage" : "bbd.png", "signSymbol" : "$"]],
        ["byr" : ["currencyName" : "Ruble", "iso" : "BYR", "flagImage" : "byr.png", "signSymbol" : "p."]],
        ["bzd" : ["currencyName" : "Dollar", "iso" : "BZD", "flagImage" : "bzd.png", "signSymbol" : "BZ$"]],
        ["bmd" : ["currencyName" : "Dollar", "iso" : "BMD", "flagImage" : "bmd.png", "signSymbol" : "$"]],
        ["bob" : ["currencyName" : "Boliviano", "iso" : "BOB", "flagImage" : "bob.png", "signSymbol" : "$b"]],
        ["bam" : ["currencyName" : "Convertible Marka", "iso" : "BAM", "flagImage" : "bam.png", "signSymbol" : "KM"]],
        ["bwp" : ["currencyName" : "Pula", "iso" : "BWP", "flagImage" : "bwp.png", "signSymbol" : "P"]],
        ["bgn" : ["currencyName" : "Lev", "iso" : "BGN", "flagImage" : "bgn.png", "signSymbol" : "лв"]],
        ["brl" : ["currencyName" : "Real", "iso" : "BRL", "flagImage" : "brl.png", "signSymbol" : "R$"]],
        ["bnd" : ["currencyName" : "Darussalam Dollar", "iso" : "BND", "flagImage" : "bnd.png", "signSymbol" : "$"]],
        ["khr" : ["currencyName" : "Riel", "iso" : "KHR", "flagImage" : "khr.png", "signSymbol" : "៛"]],
        ["cad" : ["currencyName" : "Dollar", "iso" : "CAD", "flagImage" : "cad.png", "signSymbol" : "$"]],
        ["kyd" : ["currencyName" : "Dollar", "iso" : "KYD", "flagImage" : "kyd.png", "signSymbol" : "$"]],
        ["clp" : ["currencyName" : "Peso", "iso" : "CLP", "flagImage" : "clp.png", "signSymbol" : "$"]],
        ["cny" : ["currencyName" : "Yuan Renminbi", "iso" : "CNY", "flagImage" : "cny.png", "signSymbol" : "¥"]],
        ["cop" : ["currencyName" : "Peso", "iso" : "COP", "flagImage" : "cop.png", "signSymbol" : "$"]],
        ["crc" : ["currencyName" : "Colon", "iso" : "CRC", "flagImage" : "crc.png", "signSymbol" : "₡"]],
        ["hrk" : ["currencyName" : "Kuna", "iso" : "HRK", "flagImage" : "hrk.png", "signSymbol" : "kn"]],
        ["cup" : ["currencyName" : "Peso", "iso" : "CUP", "flagImage" : "cup.png", "signSymbol" : "₱"]],
        ["czk" : ["currencyName" : "Koruna", "iso" : "CZK", "flagImage" : "czk.png", "signSymbol" : "Kč"]],
        ["dkk" : ["currencyName" : "Krone", "iso" : "DKK", "flagImage" : "dkk.png", "signSymbol" : "kr"]],
        ["dop" : ["currencyName" : "Peso", "iso" : "DOP", "flagImage" : "dop.png", "signSymbol" : "RD$"]],
        ["xcd" : ["currencyName" : "Dollar", "iso" : "XCD", "flagImage" : "xcd.png", "signSymbol" : "$"]],
        ["egp" : ["currencyName" : "Pound", "iso" : "EGP", "flagImage" : "egp.png", "signSymbol" : "£"]],
        ["svc" : ["currencyName" : "Colon", "iso" : "SVC", "flagImage" : "svc.png", "signSymbol" : "$"]],
        ["eek" : ["currencyName" : "Kroon", "iso" : "EEK", "flagImage" : "eek.png", "signSymbol" : "kr"]],
        ["eur" : ["currencyName" : "Euro", "iso" : "EUR", "flagImage" : "eur.png", "signSymbol" : "€"]],
        ["fkp" : ["currencyName" : "Pound", "iso" : "FKP", "flagImage" : "fkp.png", "signSymbol" : "£"]],
        ["fjd" : ["currencyName" : "Dollar", "iso" : "FJD", "flagImage" : "fjd.png", "signSymbol" : "$"]],
        ["gel" : ["currencyName" : "Lari", "iso" : "GEL", "flagImage" : "gel.png", "signSymbol" : "₾"]],
        ["ghc" : ["currencyName" : "Cedis", "iso" : "GHC", "flagImage" : "ghc.png", "signSymbol" : "¢"]],
        ["gip" : ["currencyName" : "Pound", "iso" : "GIP", "flagImage" : "gip.png", "signSymbol" : "£"]],
        ["gtq" : ["currencyName" : "Quetzal", "iso" : "GTQ", "flagImage" : "gtq.png", "signSymbol" : "Q"]],
        ["ggp" : ["currencyName" : "Pound", "iso" : "GGP", "flagImage" : "ggp.png", "signSymbol" : "£"]],
        ["gyd" : ["currencyName" : "Dollar", "iso" : "GYD", "flagImage" : "gyd.png", "signSymbol" : "$"]],
        ["hnl" : ["currencyName" : "Lempira", "iso" : "HNL", "flagImage" : "hnl.png", "signSymbol" : "L"]],
        ["hkd" : ["currencyName" : "Dollar", "iso" : "HKD", "flagImage" : "hkd.png", "signSymbol" : "$"]],
        ["huf" : ["currencyName" : "Forint", "iso" : "HUF", "flagImage" : "huf.png", "signSymbol" : "Ft"]],
        ["isk" : ["currencyName" : "Krona", "iso" : "ISK", "flagImage" : "isk.png", "signSymbol" : "kr"]],
        ["inr" : ["currencyName" : "Rupee", "iso" : "INR", "flagImage" : "inr.png", "signSymbol" : "₹"]],
        ["idr" : ["currencyName" : "Rupiah", "iso" : "IDR", "flagImage" : "idr.png", "signSymbol" : "Rp"]],
        ["irr" : ["currencyName" : "Rial", "iso" : "IRR", "flagImage" : "irr.png", "signSymbol" : "﷼"]],
        ["imp" : ["currencyName" : "Pound", "iso" : "IMP", "flagImage" : "imp.png", "signSymbol" : "£"]],
        ["ils" : ["currencyName" : "Shekel", "iso" : "ILS", "flagImage" : "ils.png", "signSymbol" : "₪"]],
        ["jmd" : ["currencyName" : "Dollar", "iso" : "JMD", "flagImage" : "jmd.png", "signSymbol" : "J$"]],
        ["jpy" : ["currencyName" : "Yen", "iso" : "JPY", "flagImage" : "jpy", "signSymbol" : "¥"]],
        ["jep" : ["currencyName" : "Pound", "iso" : "JEP", "flagImage" : "jep.png", "signSymbol" : "£"]],
        ["kzt" : ["currencyName" : "Tenge", "iso" : "KZT", "flagImage" : "kzt.png", "signSymbol" : "лв"]],
        ["kpw" : ["currencyName" : "Won", "iso" : "KPW", "flagImage" : "kpw.png", "signSymbol" : "₩"]],
        ["krw" : ["currencyName" : "Won", "iso" : "KRW", "flagImage" : "krw.png", "signSymbol" : "₩"]],
        ["kgs" : ["currencyName" : "Som", "iso" : "KGS", "flagImage" : "kgs.png", "signSymbol" : "лв"]],
        ["lak" : ["currencyName" : "Kip", "iso" : "LAK", "flagImage" : "lak.png", "signSymbol" : "₭"]],
        ["lvl" : ["currencyName" : "Lat", "iso" : "LVL", "flagImage" : "lvl.png", "signSymbol" : "Ls"]],
        ["lbp" : ["currencyName" : "Pound", "iso" : "LBP", "flagImage" : "lbp.png", "signSymbol" : "£"]],
        ["lrd" : ["currencyName" : "Dollar", "iso" : "LRD", "flagImage" : "lrd.png", "signSymbol" : "$"]],
        ["ltl" : ["currencyName" : "Litas", "iso" : "LTL", "flagImage" : "ltl.png", "signSymbol" : "Lt"]],
        ["mkd" : ["currencyName" : "Denar", "iso" : "MKD", "flagImage" : "mkd.png", "signSymbol" : "ден"]],
        ["myr" : ["currencyName" : "Ringgit", "iso" : "MYR", "flagImage" : "myr.png", "signSymbol" : "RM"]],
        ["mur" : ["currencyName" : "Rupee", "iso" : "MUR", "flagImage" : "mur.png", "signSymbol" : "₨"]],
        ["mxn" : ["currencyName" : "Peso", "iso" : "MXN", "flagImage" : "mxn.png", "signSymbol" : "$"]],
        ["mnt" : ["currencyName" : "Tughrik", "iso" : "MNT", "flagImage" : "mnt.png", "signSymbol" : "₮"]],
        ["mzn" : ["currencyName" : "Metical", "iso" : "MZN", "flagImage" : "mzn.png", "signSymbol" : "MT"]],
        ["nad" : ["currencyName" : "Dollar", "iso" : "NAD", "flagImage" : "nad.png", "signSymbol" : "$"]],
        ["npr" : ["currencyName" : "Rupee", "iso" : "NPR", "flagImage" : "npr.png", "signSymbol" : "₨"]],
        ["ang" : ["currencyName" : "Antilles Guilder", "iso" : "ANG", "flagImage" : "ang.png", "signSymbol" : "ƒ"]],
        ["nzd" : ["currencyName" : "Dollar", "iso" : "NZD", "flagImage" : "nzd.png", "signSymbol" : "$"]],
        ["nio" : ["currencyName" : "Cordoba", "iso" : "NIO", "flagImage" : "nio.png", "signSymbol" : "C$"]],
        ["ngn" : ["currencyName" : "Naira", "iso" : "NGN", "flagImage" : "ngn.png", "signSymbol" : "₦"]],
        ["nok" : ["currencyName" : "Krone", "iso" : "NOK", "flagImage" : "nok.png", "signSymbol" : "kr"]],
        ["omr" : ["currencyName" : "Rial", "iso" : "OMR", "flagImage" : "omr.png", "signSymbol" : "﷼"]],
        ["pkr" : ["currencyName" : "Rupee", "iso" : "PKR", "flagImage" : "pkr.png", "signSymbol" : "₨"]],
        ["pab" : ["currencyName" : "Balboa", "iso" : "PAB", "flagImage" : "pab.png", "signSymbol" : "B/."]],
        ["pyg" : ["currencyName" : "Guarani", "iso" : "PYG", "flagImage" : "pyg.png", "signSymbol" : "Gs"]],
        ["pen" : ["currencyName" : "Nuevo Sol", "iso" : "PEN", "flagImage" : "pen.png", "signSymbol" : "S/."]],
        ["php" : ["currencyName" : "Peso", "iso" : "PHP", "flagImage" : "php.png", "signSymbol" : "₱"]],
        ["pln" : ["currencyName" : "Zloty", "iso" : "PLN", "flagImage" : "pln.png", "signSymbol" : "zł"]],
        ["qar" : ["currencyName" : "Riyal", "iso" : "QAR", "flagImage" : "qar.png", "signSymbol" : "﷼"]],
        ["ron" : ["currencyName" : "New Leu", "iso" : "RON", "flagImage" : "ron.png", "signSymbol" : "lei"]],
        ["rub" : ["currencyName" : "Ruble", "iso" : "RUB", "flagImage" : "rub.png", "signSymbol" : "₽"]],
        ["shp" : ["currencyName" : "Pound", "iso" : "SHP", "flagImage" : "shp.png", "signSymbol" : "£"]],
        ["sar" : ["currencyName" : "Riyal", "iso" : "SAR", "flagImage" : "sar.png", "signSymbol" : "﷼"]],
        ["rsd" : ["currencyName" : "Dinar", "iso" : "RSD", "flagImage" : "rsd.png", "signSymbol" : "Дин."]],
        ["scr" : ["currencyName" : "Rupee", "iso" : "SCR", "flagImage" : "scr.png", "signSymbol" : "₨"]],
        ["sgd" : ["currencyName" : "Dollar", "iso" : "SGD", "flagImage" : "sgd.png", "signSymbol" : "$"]],
        ["sbd" : ["currencyName" : "Dollar", "iso" : "SBD", "flagImage" : "sbd.png", "signSymbol" : "$"]],
        ["sos" : ["currencyName" : "Shilling", "iso" : "SOS", "flagImage" : "sos.png", "signSymbol" : "S"]],
        ["zar" : ["currencyName" : "Rand", "iso" : "ZAR", "flagImage" : "zar.png", "signSymbol" : "R"]],
        ["lkr" : ["currencyName" : "Rupee", "iso" : "LKR", "flagImage" : "lkr.png", "signSymbol" : "₨"]],
        ["sek" : ["currencyName" : "Krona", "iso" : "SEK", "flagImage" : "sek.png", "signSymbol" : "kr"]],
        ["chf" : ["currencyName" : "Franc", "iso" : "CHF", "flagImage" : "chf.png", "signSymbol" : "CHF"]],
        ["srd" : ["currencyName" : "Dollar", "iso" : "SRD", "flagImage" : "srd.png", "signSymbol" : "$"]],
        ["syp" : ["currencyName" : "Pound", "iso" : "SYP", "flagImage" : "syp.png", "signSymbol" : "£"]],
        ["twd" : ["currencyName" : "New Dollar", "iso" : "TWD", "flagImage" : "twd.png", "signSymbol" : "NT$"]],
        ["thb" : ["currencyName" : "Baht", "iso" : "THB", "flagImage" : "thb.png", "signSymbol" : "฿"]],
        ["ttd" : ["currencyName" : "Dollar", "iso" : "TTD", "flagImage" : "ttd.png", "signSymbol" : "TT$"]],
        ["try" : ["currencyName" : "Lira", "iso" : "TRY", "flagImage" : "trl.png", "signSymbol" : "₺"]],
        ["tvd" : ["currencyName" : "Dollar", "iso" : "TVD", "flagImage" : "tvd.png", "signSymbol" : "$"]],
        ["uah" : ["currencyName" : "Hryvna", "iso" : "UAH", "flagImage" : "uah.png", "signSymbol" : "₴"]],
        ["gbp" : ["currencyName" : "Pound", "iso" : "GBP", "flagImage" : "gbp", "signSymbol" : "£"]],
        ["usd" : ["currencyName" : "Dollar", "iso" : "USD", "flagImage" : "usd", "signSymbol" : "$"]],  
        ["uyu" : ["currencyName" : "Peso", "iso" : "UYU", "flagImage" : "uyu.png", "signSymbol" : "$U"]],  
        ["uzs" : ["currencyName" : "Som", "iso" : "UZS", "flagImage" : "uzs.png", "signSymbol" : "лв"]],  
        ["vef" : ["currencyName" : "Bolivar Fuerte", "iso" : "VEF", "flagImage" : "vef.png", "signSymbol" : "Bs"]],  
        ["vnd" : ["currencyName" : "Dong", "iso" : "VND", "flagImage" : "vnd.png", "signSymbol" : "₫"]],  
        ["yer" : ["currencyName" : "Rial", "iso" : "YER", "flagImage" : "yer.png", "signSymbol" : "﷼"]],  
        ["zwd" : ["currencyName" : "Dollar", "iso" : "ZWD", "flagImage" : "zwd.png", "signSymbol" : "Z$"]]]
 //Albania]
        
        
        UserDefaults.standard.set(flagsAndSigns, forKey: "flagsAndSigns")
//        print(UserDefaults.standard.array(forKey: "flagsAndSigns")!)
    }
    
    fileprivate func dictionaryInitialized() -> Bool {
        if let flagsAndSigns = UserDefaults.standard.array(forKey: "flagsAndSigns") as? [[String:Any]] {
            print(flagsAndSigns)
            return true
        }
        return false
    }
    
}
