//
//  CurrencyFlagsAndSigns.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/28/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation

struct CurrencyFlagandSign {
    var currencyName: String = ""
    var iso : String = ""
    var flagImageName : String = ""
    var signSymbol : String = ""
    var countryName: String = ""
    
    init() { }
}

struct CurrencyFlagAndSignsDictionary {
    
    var isDictionaryCreated: Bool { return self.dictionaryInitialized() }
    var listOfAvailableCurrencies: [String: Any] {
        return self.getListOfAvailableCurrencies() }
    
    init() {
    }
    
    var flagAndSignsDictionary: [String: CurrencyFlagandSign] = [:]
    
    
    func createDictionaries() {
        
        let flagsAndSigns: [String:Any] =
            ["all" : ["currencyName": "Lek", "iso": "all", "flagImageName": "al.pdf", "signSymbol": "Lek"],
             "aed" : ["currencyName": "United Arab Emirates Dirham", "iso": "aed", "flagImageName": "ae.png", "signSymbol": "د.إ"],
             "afn" : ["currencyName": "Afghani", "iso": "afn", "flagImageName": "af.png", "signSymbol": "؋"],
             "ars" : ["currencyName": "Peso", "iso": "ars", "flagImageName": "ar.png", "signSymbol": "$"],
             "awg" : ["currencyName": "Guilder", "iso": "awg", "flagImageName": "aw.png", "signSymbol": "ƒ"],
             "aud" : ["currencyName": "Australian Dollar", "iso": "aud", "flagImageName": "au.png", "signSymbol": "$"],
             "azn" : ["currencyName": "Manat", "iso": "azn", "flagImageName": "az.png", "signSymbol": "₼"],
             "bsd" : ["currencyName": "Bahamian Dollar", "iso": "bsd", "flagImageName": "bs.png", "signSymbol": "$"],
             "bbd" : ["currencyName": "Barbadian Dollar", "iso": "bbd", "flagImageName": "bb.png", "signSymbol": "$"],
             "byr" : ["currencyName": "Ruble", "iso": "byr", "flagImageName": "by.png", "signSymbol": "p."],
             "bzd" : ["currencyName": "Dollar", "iso": "bzd", "flagImageName": "bz.png", "signSymbol": "BZ$"],
             "bmd" : ["currencyName": "Dollar", "iso": "bmd", "flagImageName": "bm.png", "signSymbol": "$"],
             "bob" : ["currencyName": "Boliviano", "iso": "bob", "flagImageName": "bo.png", "signSymbol": "$b"],
             "bam" : ["currencyName": "Convertible Marka", "iso": "bam", "flagImageName": "ba.png", "signSymbol": "KM"],
             "bwp" : ["currencyName": "Pula", "iso": "bwp", "flagImageName": "bw.png", "signSymbol": "P"],
             "bgn" : ["currencyName": "Lev", "iso": "bgn", "flagImageName": "bg.png", "signSymbol": "лв"],
             "brl" : ["currencyName": "Real", "iso": "brl", "flagImageName": "br.png", "signSymbol": "R$"],
             "bnd" : ["currencyName": "Darussalam Dollar", "iso": "bnd", "flagImageName": "bn.png", "signSymbol": "$"],
             "khr" : ["currencyName": "Riel", "iso": "khr", "flagImageName": "kh.png", "signSymbol": "៛"],
             "cad" : ["currencyName": "Dollar", "iso": "cad", "flagImageName": "ca.png", "signSymbol": "$"],
             "kyd" : ["currencyName": "Dollar", "iso": "kyd", "flagImageName": "ky.png", "signSymbol": "$"],
             "clp" : ["currencyName": "Peso", "iso": "clp", "flagImageName": "cl.png", "signSymbol": "$"],
             "cny" : ["currencyName": "Yuan Renminbi", "iso": "cny", "flagImageName": "cn.png", "signSymbol": "¥"],
             "cop" : ["currencyName": "Peso", "iso": "cop", "flagImageName": "co.png", "signSymbol": "$"],
             "crc" : ["currencyName": "Colon", "iso": "crc", "flagImageName": "cr.png", "signSymbol": "₡"],
             "hrk" : ["currencyName": "Kuna", "iso": "hrk", "flagImageName": "hr.png", "signSymbol": "kn"],
             "cup" : ["currencyName": "Peso", "iso": "cup", "flagImageName": "cu.png", "signSymbol": "₱"],
             "czk" : ["currencyName": "Koruna", "iso": "czk", "flagImageName": "cz.png", "signSymbol": "Kč"],
             "dkk" : ["currencyName": "Krone", "iso": "dkk", "flagImageName": "dk.png", "signSymbol": "kr"],
             "dop" : ["currencyName": "Peso", "iso": "dop", "flagImageName": "do.png", "signSymbol": "RD$"],
             "xcd" : ["currencyName": "Dollar", "iso": "xcd", "flagImageName": "xc.png", "signSymbol": "$"],
             "egp" : ["currencyName": "Pound", "iso": "egp", "flagImageName": "eg.png", "signSymbol": "£"],
             "svc" : ["currencyName": "Colon", "iso": "svc", "flagImageName": "sv.png", "signSymbol": "$"],
             "eek" : ["currencyName": "Kroon", "iso": "eek", "flagImageName": "ee.png", "signSymbol": "kr"],
             "eur" : ["currencyName": "Euro", "iso": "eur", "flagImageName": "eu.png", "signSymbol": "€"],
             "fkp" : ["currencyName": "Pound", "iso": "fkp", "flagImageName": "fk.png", "signSymbol": "£"],
             "fjd" : ["currencyName": "Dollar", "iso": "fjd", "flagImageName": "fj.png", "signSymbol": "$"],
             "gel" : ["currencyName": "Lari", "iso": "gel", "flagImageName": "ge.png", "signSymbol": "₾"],
             "ghc" : ["currencyName": "Cedis", "iso": "ghc", "flagImageName": "gh.png", "signSymbol": "¢"],
             "gip" : ["currencyName": "Pound", "iso": "gip", "flagImageName": "gi.png", "signSymbol": "£"],
             "gtq" : ["currencyName": "Quetzal", "iso": "gtq", "flagImageName": "gt.png", "signSymbol": "Q"],
             "ggp" : ["currencyName": "Pound", "iso": "ggp", "flagImageName": "gg.png", "signSymbol": "£"],
             "gyd" : ["currencyName": "Dollar", "iso": "gyd", "flagImageName": "gy.png", "signSymbol": "$"],
             "hnl" : ["currencyName": "Lempira", "iso": "hnl", "flagImageName": "hn.png", "signSymbol": "L"],
             "hkd" : ["currencyName": "Dollar", "iso": "hkd", "flagImageName": "hk.png", "signSymbol": "$"],
             "huf" : ["currencyName": "Forint", "iso": "huf", "flagImageName": "hu.png", "signSymbol": "Ft"],
             "isk" : ["currencyName": "Krona", "iso": "isk", "flagImageName": "is.png", "signSymbol": "kr"],
             "inr" : ["currencyName": "Rupee", "iso": "inr", "flagImageName": "in.png", "signSymbol": "₹"],
             "idr" : ["currencyName": "Rupiah", "iso": "idr", "flagImageName": "id.png", "signSymbol": "Rp"],
             "irr" : ["currencyName": "Rial", "iso": "irr", "flagImageName": "ir.png", "signSymbol": "﷼"],
             "imp" : ["currencyName": "Pound", "iso": "imp", "flagImageName": "im.png", "signSymbol": "£"],
             "ils" : ["currencyName": "Shekel", "iso": "ils", "flagImageName": "il.png", "signSymbol": "₪"],
             "jmd" : ["currencyName": "Dollar", "iso": "jmd", "flagImageName": "jm.png", "signSymbol": "J$"],
             "jpy" : ["currencyName": "Yen", "iso": "jpy", "flagImageName": "jp.png", "signSymbol": "¥"],
             "jep" : ["currencyName": "Pound", "iso": "jep", "flagImageName": "je.png", "signSymbol": "£"],
             "kzt" : ["currencyName": "Tenge", "iso": "kzt", "flagImageName": "kz.png", "signSymbol": "лв"],
             "kpw" : ["currencyName": "Won", "iso": "kpw", "flagImageName": "kp.png", "signSymbol": "₩"],
             "krw" : ["currencyName": "Won", "iso": "krw", "flagImageName": "kr.png", "signSymbol": "₩"],
             "kgs" : ["currencyName": "Som", "iso": "kgs", "flagImageName": "kg.png", "signSymbol": "лв"],
             "lak" : ["currencyName": "Kip", "iso": "lak", "flagImageName": "la.png", "signSymbol": "₭"],
             "lvl" : ["currencyName": "Lat", "iso": "lvl", "flagImageName": "lv.png", "signSymbol": "Ls"],
             "lbp" : ["currencyName": "Pound", "iso": "lbp", "flagImageName": "lb.png", "signSymbol": "£"],
             "lrd" : ["currencyName": "Dollar", "iso": "lrd", "flagImageName": "lr.png", "signSymbol": "$"],
             "ltl" : ["currencyName": "Litas", "iso": "ltl", "flagImageName": "lt.png", "signSymbol": "Lt"],
             "mkd" : ["currencyName": "Denar", "iso": "mkd", "flagImageName": "mk.png", "signSymbol": "ден"],
             "myr" : ["currencyName": "Ringgit", "iso": "myr", "flagImageName": "my.png", "signSymbol": "RM"],
             "mur" : ["currencyName": "Rupee", "iso": "mur", "flagImageName": "mu.png", "signSymbol": "₨"],
             "mxn" : ["currencyName": "Peso", "iso": "mxn", "flagImageName": "mx.png", "signSymbol": "$"],
             "mnt" : ["currencyName": "Tughrik", "iso": "mnt", "flagImageName": "mn.png", "signSymbol": "₮"],
             "mzn" : ["currencyName": "Metical", "iso": "mzn", "flagImageName": "mz.png", "signSymbol": "MT"],
             "nad" : ["currencyName": "Dollar", "iso": "nad", "flagImageName": "na.png", "signSymbol": "$"],
             "npr" : ["currencyName": "Rupee", "iso": "npr", "flagImageName": "np.png", "signSymbol": "₨"],
             "ang" : ["currencyName": "Antilles Guilder", "iso": "ang", "flagImageName": "an.png", "signSymbol": "ƒ"],
             "nzd" : ["currencyName": "Dollar", "iso": "nzd", "flagImageName": "nz.png", "signSymbol": "$"],
             "nio" : ["currencyName": "Cordoba", "iso": "nio", "flagImageName": "ni.png", "signSymbol": "C$"],
             "ngn" : ["currencyName": "Naira", "iso": "ngn", "flagImageName": "ng.png", "signSymbol": "₦"],
             "nok" : ["currencyName": "Krone", "iso": "nok", "flagImageName": "no.png", "signSymbol": "kr"],
             "omr" : ["currencyName": "Rial", "iso": "omr", "flagImageName": "om.png", "signSymbol": "﷼"],
             "pkr" : ["currencyName": "Rupee", "iso": "pkr", "flagImageName": "pk.png", "signSymbol": "₨"],
             "pab" : ["currencyName": "Balboa", "iso": "pab", "flagImageName": "pa.png", "signSymbol": "B/."],
             "pyg" : ["currencyName": "Guarani", "iso": "pyg", "flagImageName": "py.png", "signSymbol": "Gs"],
             "pen" : ["currencyName": "Nuevo Sol", "iso": "pen", "flagImageName": "pe.png", "signSymbol": "S/."],
             "php" : ["currencyName": "Peso", "iso": "php", "flagImageName": "ph.png", "signSymbol": "₱"],
             "pln" : ["currencyName": "Zloty", "iso": "pln", "flagImageName": "pl.png", "signSymbol": "zł"],
             "qar" : ["currencyName": "Riyal", "iso": "qar", "flagImageName": "qa.png", "signSymbol": "﷼"],
             "ron" : ["currencyName": "New Leu", "iso": "ron", "flagImageName": "ro.png", "signSymbol": "lei"],
             "rub" : ["currencyName": "Ruble", "iso": "rub", "flagImageName": "ru.png", "signSymbol": "₽"],
             "shp" : ["currencyName": "Pound", "iso": "shp", "flagImageName": "sh.png", "signSymbol": "£"],
             "sar" : ["currencyName": "Riyal", "iso": "sar", "flagImageName": "sa.png", "signSymbol": "﷼"],
             "rsd" : ["currencyName": "Dinar", "iso": "rsd", "flagImageName": "rs.png", "signSymbol": "Дин."],
             "scr" : ["currencyName": "Rupee", "iso": "scr", "flagImageName": "sc.png", "signSymbol": "₨"],
             "sgd" : ["currencyName": "Dollar", "iso": "sgd", "flagImageName": "sg.png", "signSymbol": "$"],
             "sbd" : ["currencyName": "Dollar", "iso": "sbd", "flagImageName": "sb.png", "signSymbol": "$"],
             "sos" : ["currencyName": "Shilling", "iso": "sos", "flagImageName": "so.png", "signSymbol": "S"],
             "zar" : ["currencyName": "Rand", "iso": "zar", "flagImageName": "za.png", "signSymbol": "R"],
             "lkr" : ["currencyName": "Rupee", "iso": "lkr", "flagImageName": "lk.png", "signSymbol": "₨"],
             "sek" : ["currencyName": "Krona", "iso": "sek", "flagImageName": "se.png", "signSymbol": "kr"],
             "chf" : ["currencyName": "Franc", "iso": "chf", "flagImageName": "ch.png", "signSymbol": "CHF"],
             "srd" : ["currencyName": "Dollar", "iso": "srd", "flagImageName": "sr.png", "signSymbol": "$"],
             "syp" : ["currencyName": "Pound", "iso": "syp", "flagImageName": "sy.png", "signSymbol": "£"],
             "twd" : ["currencyName": "New Dollar", "iso": "twd", "flagImageName": "tw.png", "signSymbol": "NT$"],
             "thb" : ["currencyName": "Baht", "iso": "thb", "flagImageName": "th.png", "signSymbol": "฿"],
             "ttd" : ["currencyName": "Dollar", "iso": "ttd", "flagImageName": "tt.png", "signSymbol": "TT$"],
             "trl" : ["currencyName": "Lira", "iso": "trl", "flagImageName": "tr.png", "signSymbol": "₺"],
             "tvd" : ["currencyName": "Dollar", "iso": "tvd", "flagImageName": "tv.png", "signSymbol": "$"],
             "uah" : ["currencyName": "Hryvna", "iso": "uah", "flagImageName": "ua.png", "signSymbol": "₴"],
             "gbp" : ["currencyName": "Pound", "iso": "gbp", "flagImageName": "gb.png", "signSymbol": "£"],
             "usd" : ["currencyName": "Dollar", "iso": "usd", "flagImageName": "us.png", "signSymbol": "$"],
             "uyu" : ["currencyName": "Peso", "iso": "uyu", "flagImageName": "uy.png", "signSymbol": "$U"],
             "uzs" : ["currencyName": "Som", "iso": "uzs", "flagImageName": "uz.png", "signSymbol": "лв"],
             "vef" : ["currencyName": "Bolivar Fuerte", "iso": "vef", "flagImageName": "ve.png", "signSymbol": "Bs"],
             "vnd" : ["currencyName": "Dong", "iso": "vnd", "flagImageName": "vn.png", "signSymbol": "₫"],
             "yer" : ["currencyName": "Rial", "iso": "yer", "flagImageName": "ye.png", "signSymbol": "﷼"],
             "zwd" : ["currencyName": "Dollar", "iso": "zwd", "flagImageName": "zw.png", "signSymbol": "Z$"],
             "amd" : ["currencyName": "Armenian Dram", "iso": "amd", "flagImageName": "am.png", "signSymbol": "֏"],
             "aoa" : ["currencyName": "Angolan Kwanza", "iso": "aoa", "flagImageName": "ao.png", "signSymbol": "Kz"],
             "bdt" : ["currencyName": "Bangladeshi Taka", "iso": "bdt", "flagImageName": "bd.png", "signSymbol": "৳"],
             "bhd" : ["currencyName": "Bahraini Dinar", "iso": "bhd", "flagImageName": "bh.png", "signSymbol": ".د.ب"],
             "bif" : ["currencyName": "Burundian Franc", "iso": "bif", "flagImageName": "bi.png", "signSymbol": "FBu"],
             "btn" : ["currencyName": "Bhutanese Ngultrum", "iso": "btn", "flagImageName": "bt.png", "signSymbol": "Nu."],
             "byn" : ["currencyName": "New Belarusian Ruble", "iso": "byn", "flagImageName": "by.png", "signSymbol": ""],
             "cdf" : ["currencyName": "Congolese Franc", "iso": "cdf", "flagImageName": "cd.png", "signSymbol": "Fr."],
             "cve" : ["currencyName": "Cape Verdean Escudo", "iso": "cve", "flagImageName": "cv.png", "signSymbol": "Esc"],
             "djf" : ["currencyName": "Djiboutian Franc", "iso": "djf", "flagImageName": "dj.png", "signSymbol": "Fdj"],
             "dzd" : ["currencyName": "Algerian Dinar", "iso": "dzd", "flagImageName": "dz.png", "signSymbol": "د.ج"],
             "ern" : ["currencyName": "Eritrean Nakfa", "iso": "ern", "flagImageName": "er.png", "signSymbol": "Nfk"],
             "etb" : ["currencyName": "Ethiopian Birr", "iso": "etb", "flagImageName": "et.png", "signSymbol": "Br."],
             "ghs" : ["currencyName": "Ghanaian Cedi", "iso": "ghs", "flagImageName": "gh.png", "signSymbol": "₵"],
             "gmd" : ["currencyName": "Gambian Dalasi", "iso": "gmd", "flagImageName": "gm.png", "signSymbol": "D"],
             "gnf" : ["currencyName": "Guinean Franc", "iso": "gnf", "flagImageName": "gn.png", "signSymbol": "GFr"],
             "htg" : ["currencyName": "Haitian Gourde", "iso": "htg", "flagImageName": "ht.png", "signSymbol": "G"],
             "iqd" : ["currencyName": "Iraqi Dinar", "iso": "iqd", "flagImageName": "iq.png", "signSymbol": "ع.د"],
             "jod" : ["currencyName": "Jordanian Dinar", "iso": "jod", "flagImageName": "jo.png", "signSymbol": "د.ا"],
             "kes" : ["currencyName": "Kenyan Shilling", "iso": "kes", "flagImageName": "ke.png", "signSymbol": "Sh"],
             "kmf" : ["currencyName": "Comorian Franc", "iso": "kmf", "flagImageName": "km.png", "signSymbol": "CF"],
             "kwd" : ["currencyName": "Kuwaiti Dinar", "iso": "kwd", "flagImageName": "kw.png", "signSymbol": "د.ك"],
             "lsl" : ["currencyName": "Lesotho Loti", "iso": "lsl", "flagImageName": "ls.png", "signSymbol": "L"],
             "lyd" : ["currencyName": "Libyan Dinar", "iso": "lyd", "flagImageName": "ly.png", "signSymbol": "ل.د"],
             "mad" : ["currencyName": "Moroccan Dirham", "iso": "mad", "flagImageName": "ma.png", "signSymbol": "د.م."],
             "mdl" : ["currencyName": "Moldovan Leu", "iso": "mdl", "flagImageName": "md.png", "signSymbol": "L"],
             "mga" : ["currencyName": "Malagasy Ariary", "iso": "mga", "flagImageName": "mg.png", "signSymbol": "Ar"],
             "mmk" : ["currencyName": "Myanma Kyat", "iso": "mmk", "flagImageName": "mm.png", "signSymbol": "Ks"],
             "mop" : ["currencyName": "Macanese Pataca", "iso": "mop", "flagImageName": "mo.png", "signSymbol": "P"],
             "mro" : ["currencyName": "Mauritanian Ouguiya", "iso": "mro", "flagImageName": "mr.png", "signSymbol": "UM"],
             "mvr" : ["currencyName": "Maldivian Rufiyaa", "iso": "mvr", "flagImageName": "mv.png", "signSymbol": ".ރ"],
             "mwk" : ["currencyName": "Malawian Kwacha", "iso": "mwk", "flagImageName": "mw.png", "signSymbol": "MK"],
             "pgk" : ["currencyName": "Papua New Guinean Kina", "iso": "pgk", "flagImageName": "pg.png", "signSymbol": "K"],
             "rwf" : ["currencyName": "Rwandan Franc", "iso": "rwf", "flagImageName": "rw.png", "signSymbol": "R₣"],
             "sdg" : ["currencyName": "Sudanese Pound", "iso": "sdg", "flagImageName": "sd.png", "signSymbol": "£"],
             "sll" : ["currencyName": "Sierra Leonean Leone", "iso": "sll", "flagImageName": "sl.png", "signSymbol": "Le"],
             "std" : ["currencyName": "São Tomé and Príncipe Dobra", "iso": "std", "flagImageName": "st.png", "signSymbol": "Db"],
             "szl" : ["currencyName": "Swazi Lilangeni", "iso": "szl", "flagImageName": "sz.png", "signSymbol": "L"],
             "tjs" : ["currencyName": "Tajikistani Somoni", "iso": "tjs", "flagImageName": "tj.png", "signSymbol": "SM"],
             "tmt" : ["currencyName": "Turkmenistani Manat", "iso": "tmt", "flagImageName": "tm.png", "signSymbol": "m"],
             "tnd" : ["currencyName": "Tunisian Dinar", "iso": "tnd", "flagImageName": "tn.png", "signSymbol": "د.ت"],
             "top" : ["currencyName": "Tongan Paʻanga", "iso": "top", "flagImageName": "to.png", "signSymbol": "T$"],
             "try" : ["currencyName": "Turkish Lira", "iso": "try", "flagImageName": "tr.png", "signSymbol": "₺"],
             "tzs" : ["currencyName": "Tanzanian Shilling", "iso": "tzs", "flagImageName": "tz.png", "signSymbol": "Sh"],
             "ugx" : ["currencyName": "Ugandan Shilling", "iso": "ugx", "flagImageName": "ug.png", "signSymbol": "Sh"],
             "vuv" : ["currencyName": "Vanuatu Vatu", "iso": "vuv", "flagImageName": "vu.png", "signSymbol": "Vt"],
             "wst" : ["currencyName": "Samoan Tala", "iso": "wst", "flagImageName": "ws.png", "signSymbol": "T"],
             "xaf" : ["currencyName": "CFA Franc BEAC", "iso": "xaf", "flagImageName": "xa.png", "signSymbol": ""],
             "xag" : ["currencyName": "Silver (troy ounce)", "iso": "xag", "flagImageName": "xa.png", "signSymbol": ""],
             "xau" : ["currencyName": "Gold (troy ounce)", "iso": "xau", "flagImageName": "xa.png", "signSymbol": ""],
             "xdr" : ["currencyName": "Special Drawing Rights", "iso": "xdr", "flagImageName": "xd.png", "signSymbol": ""],
             "xof" : ["currencyName": "CFA Franc BCEAO", "iso": "xof", "flagImageName": "xo.png", "signSymbol": ""],
             "xpf" : ["currencyName": "CFP Franc", "iso": "xpf", "flagImageName": "xp.png", "signSymbol": ""],
             "zmk" : ["currencyName": "Zambian Kwacha (pre-2013)", "iso": "zmk", "flagImageName": "zm.png", "signSymbol": ""],
             "zmw" : ["currencyName": "Zambian Kwacha", "iso": "zmw", "flagImageName": "zm.png", "signSymbol": ""],
             "zwl" : ["currencyName": "Zimbabwean Dollar", "iso": "zwl", "flagImageName": "zw.png", "signSymbol": ""]]
        UserDefaults.standard.set(flagsAndSigns, forKey: "flagsAndSigns")
        
    }
    
    fileprivate func dictionaryInitialized() -> Bool {
        guard  (UserDefaults.standard.dictionary(forKey: "flagsAndSigns") != nil) else  {
            return false
        }
        return true
    }
    
    fileprivate  func getListOfAvailableCurrencies() -> [String: Any] {
        guard let listOfAvailable = UserDefaults.standard.dictionary(forKey: "flagsAndSigns")            else { return [:] }
        
        var flagAndSign = CurrencyFlagandSign()
        var list: [String:Any] = [:]
        
        listOfAvailable.forEach { (key, value) in
            guard let detail = value as? [String:String] else { return }
            if let flag =  detail["flagImageName"] {
                flagAndSign.flagImageName = flag }
            if let sign = detail["signSymbol"] {
                flagAndSign.signSymbol = sign }
            if let cName = detail["currencyName"] {
                flagAndSign.currencyName = cName
            }
            if let iso = detail["iso"] {
                flagAndSign.iso = iso
            }
            list[key] = flagAndSign
        }
        return list
    }
    
    func resetDictionary() {
        UserDefaults.standard.removeObject(forKey: "flagsAndSigns")
        createDictionaries()
    }
    
}

