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
             "aed" : ["currencyName": "United Arab Emirates Dirham", "iso": "aed", "flagImageName": "ae.pdf", "signSymbol": "د.إ"],
             "afn" : ["currencyName": "Afghani", "iso": "afn", "flagImageName": "af.pdf", "signSymbol": "؋"],
             "ars" : ["currencyName": "Peso", "iso": "ars", "flagImageName": "ar.pdf", "signSymbol": "$"],
             "awg" : ["currencyName": "Guilder", "iso": "awg", "flagImageName": "aw.pdf", "signSymbol": "ƒ"],
             "aud" : ["currencyName": "Australian Dollar", "iso": "aud", "flagImageName": "au.pdf", "signSymbol": "$"],
             "azn" : ["currencyName": "Manat", "iso": "azn", "flagImageName": "az.pdf", "signSymbol": "₼"],
             "bsd" : ["currencyName": "Bahamian Dollar", "iso": "bsd", "flagImageName": "bs.pdf", "signSymbol": "$"],
             "bbd" : ["currencyName": "Barbadian Dollar", "iso": "bbd", "flagImageName": "bb.pdf", "signSymbol": "$"],
             "byr" : ["currencyName": "Ruble", "iso": "byr", "flagImageName": "by.pdf", "signSymbol": "p."],
             "bzd" : ["currencyName": "Dollar", "iso": "bzd", "flagImageName": "bz.pdf", "signSymbol": "BZ$"],
             "bmd" : ["currencyName": "Dollar", "iso": "bmd", "flagImageName": "bm.pdf", "signSymbol": "$"],
             "bob" : ["currencyName": "Boliviano", "iso": "bob", "flagImageName": "bo.pdf", "signSymbol": "$b"],
             "bam" : ["currencyName": "Convertible Marka", "iso": "bam", "flagImageName": "ba.pdf", "signSymbol": "KM"],
             "bwp" : ["currencyName": "Pula", "iso": "bwp", "flagImageName": "bw.pdf", "signSymbol": "P"],
             "bgn" : ["currencyName": "Lev", "iso": "bgn", "flagImageName": "bg.pdf", "signSymbol": "лв"],
             "brl" : ["currencyName": "Real", "iso": "brl", "flagImageName": "br.pdf", "signSymbol": "R$"],
             "bnd" : ["currencyName": "Darussalam Dollar", "iso": "bnd", "flagImageName": "bn.pdf", "signSymbol": "$"],
             "khr" : ["currencyName": "Riel", "iso": "khr", "flagImageName": "kh.pdf", "signSymbol": "៛"],
             "cad" : ["currencyName": "Dollar", "iso": "cad", "flagImageName": "ca.pdf", "signSymbol": "$"],
             "kyd" : ["currencyName": "Dollar", "iso": "kyd", "flagImageName": "ky.pdf", "signSymbol": "$"],
             "clp" : ["currencyName": "Peso", "iso": "clp", "flagImageName": "cl.pdf", "signSymbol": "$"],
             "cny" : ["currencyName": "Yuan Renminbi", "iso": "cny", "flagImageName": "cn.pdf", "signSymbol": "¥"],
             "cop" : ["currencyName": "Peso", "iso": "cop", "flagImageName": "co.pdf", "signSymbol": "$"],
             "crc" : ["currencyName": "Colon", "iso": "crc", "flagImageName": "cr.pdf", "signSymbol": "₡"],
             "hrk" : ["currencyName": "Kuna", "iso": "hrk", "flagImageName": "hr.pdf", "signSymbol": "kn"],
             "cup" : ["currencyName": "Peso", "iso": "cup", "flagImageName": "cu.pdf", "signSymbol": "₱"],
             "czk" : ["currencyName": "Koruna", "iso": "czk", "flagImageName": "cz.pdf", "signSymbol": "Kč"],
             "dkk" : ["currencyName": "Krone", "iso": "dkk", "flagImageName": "dk.pdf", "signSymbol": "kr"],
             "dop" : ["currencyName": "Peso", "iso": "dop", "flagImageName": "do.pdf", "signSymbol": "RD$"],
             "xcd" : ["currencyName": "Dollar", "iso": "xcd", "flagImageName": "xc.pdf", "signSymbol": "$"],
             "egp" : ["currencyName": "Pound", "iso": "egp", "flagImageName": "eg.pdf", "signSymbol": "£"],
             "svc" : ["currencyName": "Colon", "iso": "svc", "flagImageName": "sv.pdf", "signSymbol": "$"],
             "eek" : ["currencyName": "Kroon", "iso": "eek", "flagImageName": "ee.pdf", "signSymbol": "kr"],
             "eur" : ["currencyName": "Euro", "iso": "eur", "flagImageName": "eu.pdf", "signSymbol": "€"],
             "fkp" : ["currencyName": "Pound", "iso": "fkp", "flagImageName": "fk.pdf", "signSymbol": "£"],
             "fjd" : ["currencyName": "Dollar", "iso": "fjd", "flagImageName": "fj.pdf", "signSymbol": "$"],
             "gel" : ["currencyName": "Lari", "iso": "gel", "flagImageName": "ge.pdf", "signSymbol": "₾"],
             "ghc" : ["currencyName": "Cedis", "iso": "ghc", "flagImageName": "gh.pdf", "signSymbol": "¢"],
             "gip" : ["currencyName": "Pound", "iso": "gip", "flagImageName": "gi.pdf", "signSymbol": "£"],
             "gtq" : ["currencyName": "Quetzal", "iso": "gtq", "flagImageName": "gt.pdf", "signSymbol": "Q"],
             "ggp" : ["currencyName": "Pound", "iso": "ggp", "flagImageName": "gg.pdf", "signSymbol": "£"],
             "gyd" : ["currencyName": "Dollar", "iso": "gyd", "flagImageName": "gy.pdf", "signSymbol": "$"],
             "hnl" : ["currencyName": "Lempira", "iso": "hnl", "flagImageName": "hn.pdf", "signSymbol": "L"],
             "hkd" : ["currencyName": "Dollar", "iso": "hkd", "flagImageName": "hk.pdf", "signSymbol": "$"],
             "huf" : ["currencyName": "Forint", "iso": "huf", "flagImageName": "hu.pdf", "signSymbol": "Ft"],
             "isk" : ["currencyName": "Krona", "iso": "isk", "flagImageName": "is.pdf", "signSymbol": "kr"],
             "inr" : ["currencyName": "Rupee", "iso": "inr", "flagImageName": "in.pdf", "signSymbol": "₹"],
             "idr" : ["currencyName": "Rupiah", "iso": "idr", "flagImageName": "id.pdf", "signSymbol": "Rp"],
             "irr" : ["currencyName": "Rial", "iso": "irr", "flagImageName": "ir.pdf", "signSymbol": "﷼"],
             "imp" : ["currencyName": "Pound", "iso": "imp", "flagImageName": "im.pdf", "signSymbol": "£"],
             "ils" : ["currencyName": "Shekel", "iso": "ils", "flagImageName": "il.pdf", "signSymbol": "₪"],
             "jmd" : ["currencyName": "Dollar", "iso": "jmd", "flagImageName": "jm.pdf", "signSymbol": "J$"],
             "jpy" : ["currencyName": "Yen", "iso": "jpy", "flagImageName": "jp.pdf", "signSymbol": "¥"],
             "jep" : ["currencyName": "Pound", "iso": "jep", "flagImageName": "je.pdf", "signSymbol": "£"],
             "kzt" : ["currencyName": "Tenge", "iso": "kzt", "flagImageName": "kz.pdf", "signSymbol": "лв"],
             "kpw" : ["currencyName": "Won", "iso": "kpw", "flagImageName": "kp.pdf", "signSymbol": "₩"],
             "krw" : ["currencyName": "Won", "iso": "krw", "flagImageName": "kr.pdf", "signSymbol": "₩"],
             "kgs" : ["currencyName": "Som", "iso": "kgs", "flagImageName": "kg.pdf", "signSymbol": "лв"],
             "lak" : ["currencyName": "Kip", "iso": "lak", "flagImageName": "la.pdf", "signSymbol": "₭"],
             "lvl" : ["currencyName": "Lat", "iso": "lvl", "flagImageName": "lv.pdf", "signSymbol": "Ls"],
             "lbp" : ["currencyName": "Pound", "iso": "lbp", "flagImageName": "lb.pdf", "signSymbol": "£"],
             "lrd" : ["currencyName": "Dollar", "iso": "lrd", "flagImageName": "lr.pdf", "signSymbol": "$"],
             "ltl" : ["currencyName": "Litas", "iso": "ltl", "flagImageName": "lt.pdf", "signSymbol": "Lt"],
             "mkd" : ["currencyName": "Denar", "iso": "mkd", "flagImageName": "mk.pdf", "signSymbol": "ден"],
             "myr" : ["currencyName": "Ringgit", "iso": "myr", "flagImageName": "my.pdf", "signSymbol": "RM"],
             "mur" : ["currencyName": "Rupee", "iso": "mur", "flagImageName": "mu.pdf", "signSymbol": "₨"],
             "mxn" : ["currencyName": "Peso", "iso": "mxn", "flagImageName": "mx.pdf", "signSymbol": "$"],
             "mnt" : ["currencyName": "Tughrik", "iso": "mnt", "flagImageName": "mn.pdf", "signSymbol": "₮"],
             "mzn" : ["currencyName": "Metical", "iso": "mzn", "flagImageName": "mz.pdf", "signSymbol": "MT"],
             "nad" : ["currencyName": "Dollar", "iso": "nad", "flagImageName": "na.pdf", "signSymbol": "$"],
             "npr" : ["currencyName": "Rupee", "iso": "npr", "flagImageName": "np.pdf", "signSymbol": "₨"],
             "ang" : ["currencyName": "Antilles Guilder", "iso": "ang", "flagImageName": "an.pdf", "signSymbol": "ƒ"],
             "nzd" : ["currencyName": "Dollar", "iso": "nzd", "flagImageName": "nz.pdf", "signSymbol": "$"],
             "nio" : ["currencyName": "Cordoba", "iso": "nio", "flagImageName": "ni.pdf", "signSymbol": "C$"],
             "ngn" : ["currencyName": "Naira", "iso": "ngn", "flagImageName": "ng.pdf", "signSymbol": "₦"],
             "nok" : ["currencyName": "Krone", "iso": "nok", "flagImageName": "no.pdf", "signSymbol": "kr"],
             "omr" : ["currencyName": "Rial", "iso": "omr", "flagImageName": "om.pdf", "signSymbol": "﷼"],
             "pkr" : ["currencyName": "Rupee", "iso": "pkr", "flagImageName": "pk.pdf", "signSymbol": "₨"],
             "pab" : ["currencyName": "Balboa", "iso": "pab", "flagImageName": "pa.pdf", "signSymbol": "B/."],
             "pyg" : ["currencyName": "Guarani", "iso": "pyg", "flagImageName": "py.pdf", "signSymbol": "Gs"],
             "pen" : ["currencyName": "Nuevo Sol", "iso": "pen", "flagImageName": "pe.pdf", "signSymbol": "S/."],
             "php" : ["currencyName": "Peso", "iso": "php", "flagImageName": "ph.pdf", "signSymbol": "₱"],
             "pln" : ["currencyName": "Zloty", "iso": "pln", "flagImageName": "pl.pdf", "signSymbol": "zł"],
             "qar" : ["currencyName": "Riyal", "iso": "qar", "flagImageName": "qa.pdf", "signSymbol": "﷼"],
             "ron" : ["currencyName": "New Leu", "iso": "ron", "flagImageName": "ro.pdf", "signSymbol": "lei"],
             "rub" : ["currencyName": "Ruble", "iso": "rub", "flagImageName": "ru.pdf", "signSymbol": "₽"],
             "shp" : ["currencyName": "Pound", "iso": "shp", "flagImageName": "sh.pdf", "signSymbol": "£"],
             "sar" : ["currencyName": "Riyal", "iso": "sar", "flagImageName": "sa.pdf", "signSymbol": "﷼"],
             "rsd" : ["currencyName": "Dinar", "iso": "rsd", "flagImageName": "rs.pdf", "signSymbol": "Дин."],
             "scr" : ["currencyName": "Rupee", "iso": "scr", "flagImageName": "sc.pdf", "signSymbol": "₨"],
             "sgd" : ["currencyName": "Dollar", "iso": "sgd", "flagImageName": "sg.pdf", "signSymbol": "$"],
             "sbd" : ["currencyName": "Dollar", "iso": "sbd", "flagImageName": "sb.pdf", "signSymbol": "$"],
             "sos" : ["currencyName": "Shilling", "iso": "sos", "flagImageName": "so.pdf", "signSymbol": "S"],
             "zar" : ["currencyName": "Rand", "iso": "zar", "flagImageName": "za.pdf", "signSymbol": "R"],
             "lkr" : ["currencyName": "Rupee", "iso": "lkr", "flagImageName": "lk.pdf", "signSymbol": "₨"],
             "sek" : ["currencyName": "Krona", "iso": "sek", "flagImageName": "se.pdf", "signSymbol": "kr"],
             "chf" : ["currencyName": "Franc", "iso": "chf", "flagImageName": "ch.pdf", "signSymbol": "CHF"],
             "srd" : ["currencyName": "Dollar", "iso": "srd", "flagImageName": "sr.pdf", "signSymbol": "$"],
             "syp" : ["currencyName": "Pound", "iso": "syp", "flagImageName": "sy.pdf", "signSymbol": "£"],
             "twd" : ["currencyName": "New Dollar", "iso": "twd", "flagImageName": "tw.pdf", "signSymbol": "NT$"],
             "thb" : ["currencyName": "Baht", "iso": "thb", "flagImageName": "th.pdf", "signSymbol": "฿"],
             "ttd" : ["currencyName": "Dollar", "iso": "ttd", "flagImageName": "tt.pdf", "signSymbol": "TT$"],
             "trl" : ["currencyName": "Lira", "iso": "trl", "flagImageName": "tr.pdf", "signSymbol": "₺"],
             "tvd" : ["currencyName": "Dollar", "iso": "tvd", "flagImageName": "tv.pdf", "signSymbol": "$"],
             "uah" : ["currencyName": "Hryvna", "iso": "uah", "flagImageName": "ua.pdf", "signSymbol": "₴"],
             "gbp" : ["currencyName": "Pound", "iso": "gbp", "flagImageName": "gb.pdf", "signSymbol": "£"],
             "usd" : ["currencyName": "Dollar", "iso": "usd", "flagImageName": "us.pdf", "signSymbol": "$"],
             "uyu" : ["currencyName": "Peso", "iso": "uyu", "flagImageName": "uy.pdf", "signSymbol": "$U"],
             "uzs" : ["currencyName": "Som", "iso": "uzs", "flagImageName": "uz.pdf", "signSymbol": "лв"],
             "vef" : ["currencyName": "Bolivar Fuerte", "iso": "vef", "flagImageName": "ve.pdf", "signSymbol": "Bs"],
             "vnd" : ["currencyName": "Dong", "iso": "vnd", "flagImageName": "vn.pdf", "signSymbol": "₫"],
             "yer" : ["currencyName": "Rial", "iso": "yer", "flagImageName": "ye.pdf", "signSymbol": "﷼"],
             "zwd" : ["currencyName": "Dollar", "iso": "zwd", "flagImageName": "zw.pdf", "signSymbol": "Z$"],
             "amd" : ["currencyName": "Armenian Dram", "iso": "amd", "flagImageName": "am.pdf", "signSymbol": "֏"],
             "aoa" : ["currencyName": "Angolan Kwanza", "iso": "aoa", "flagImageName": "ao.pdf", "signSymbol": "Kz"],
             "bdt" : ["currencyName": "Bangladeshi Taka", "iso": "bdt", "flagImageName": "bd.pdf", "signSymbol": "৳"],
             "bhd" : ["currencyName": "Bahraini Dinar", "iso": "bhd", "flagImageName": "bh.pdf", "signSymbol": ".د.ب"],
             "bif" : ["currencyName": "Burundian Franc", "iso": "bif", "flagImageName": "bi.pdf", "signSymbol": "FBu"],
             "btn" : ["currencyName": "Bhutanese Ngultrum", "iso": "btn", "flagImageName": "bt.pdf", "signSymbol": "Nu."],
             "byn" : ["currencyName": "New Belarusian Ruble", "iso": "byn", "flagImageName": "by.pdf", "signSymbol": ""],
             "cdf" : ["currencyName": "Congolese Franc", "iso": "cdf", "flagImageName": "cd.pdf", "signSymbol": "Fr."],
             "cve" : ["currencyName": "Cape Verdean Escudo", "iso": "cve", "flagImageName": "cv.pdf", "signSymbol": "Esc"],
             "djf" : ["currencyName": "Djiboutian Franc", "iso": "djf", "flagImageName": "dj.pdf", "signSymbol": "Fdj"],
             "dzd" : ["currencyName": "Algerian Dinar", "iso": "dzd", "flagImageName": "dz.pdf", "signSymbol": "د.ج"],
             "ern" : ["currencyName": "Eritrean Nakfa", "iso": "ern", "flagImageName": "er.pdf", "signSymbol": "Nfk"],
             "etb" : ["currencyName": "Ethiopian Birr", "iso": "etb", "flagImageName": "et.pdf", "signSymbol": "Br."],
             "ghs" : ["currencyName": "Ghanaian Cedi", "iso": "ghs", "flagImageName": "gh.pdf", "signSymbol": "₵"],
             "gmd" : ["currencyName": "Gambian Dalasi", "iso": "gmd", "flagImageName": "gm.pdf", "signSymbol": "D"],
             "gnf" : ["currencyName": "Guinean Franc", "iso": "gnf", "flagImageName": "gn.pdf", "signSymbol": "GFr"],
             "htg" : ["currencyName": "Haitian Gourde", "iso": "htg", "flagImageName": "ht.pdf", "signSymbol": "G"],
             "iqd" : ["currencyName": "Iraqi Dinar", "iso": "iqd", "flagImageName": "iq.pdf", "signSymbol": "ع.د"],
             "jod" : ["currencyName": "Jordanian Dinar", "iso": "jod", "flagImageName": "jo.pdf", "signSymbol": "د.ا"],
             "kes" : ["currencyName": "Kenyan Shilling", "iso": "kes", "flagImageName": "ke.pdf", "signSymbol": "Sh"],
             "kmf" : ["currencyName": "Comorian Franc", "iso": "kmf", "flagImageName": "km.pdf", "signSymbol": "CF"],
             "kwd" : ["currencyName": "Kuwaiti Dinar", "iso": "kwd", "flagImageName": "kw.pdf", "signSymbol": "د.ك"],
             "lsl" : ["currencyName": "Lesotho Loti", "iso": "lsl", "flagImageName": "ls.pdf", "signSymbol": "L"],
             "lyd" : ["currencyName": "Libyan Dinar", "iso": "lyd", "flagImageName": "ly.pdf", "signSymbol": "ل.د"],
             "mad" : ["currencyName": "Moroccan Dirham", "iso": "mad", "flagImageName": "ma.pdf", "signSymbol": "د.م."],
             "mdl" : ["currencyName": "Moldovan Leu", "iso": "mdl", "flagImageName": "md.pdf", "signSymbol": "L"],
             "mga" : ["currencyName": "Malagasy Ariary", "iso": "mga", "flagImageName": "mg.pdf", "signSymbol": "Ar"],
             "mmk" : ["currencyName": "Myanma Kyat", "iso": "mmk", "flagImageName": "mm.pdf", "signSymbol": "Ks"],
             "mop" : ["currencyName": "Macanese Pataca", "iso": "mop", "flagImageName": "mo.pdf", "signSymbol": "P"],
             "mro" : ["currencyName": "Mauritanian Ouguiya", "iso": "mro", "flagImageName": "mr.pdf", "signSymbol": "UM"],
             "mvr" : ["currencyName": "Maldivian Rufiyaa", "iso": "mvr", "flagImageName": "mv.pdf", "signSymbol": ".ރ"],
             "mwk" : ["currencyName": "Malawian Kwacha", "iso": "mwk", "flagImageName": "mw.pdf", "signSymbol": "MK"],
             "pgk" : ["currencyName": "Papua New Guinean Kina", "iso": "pgk", "flagImageName": "pg.pdf", "signSymbol": "K"],
             "rwf" : ["currencyName": "Rwandan Franc", "iso": "rwf", "flagImageName": "rw.pdf", "signSymbol": "R₣"],
             "sdg" : ["currencyName": "Sudanese Pound", "iso": "sdg", "flagImageName": "sd.pdf", "signSymbol": "£"],
             "sll" : ["currencyName": "Sierra Leonean Leone", "iso": "sll", "flagImageName": "sl.pdf", "signSymbol": "Le"],
             "std" : ["currencyName": "São Tomé and Príncipe Dobra", "iso": "std", "flagImageName": "st.pdf", "signSymbol": "Db"],
             "szl" : ["currencyName": "Swazi Lilangeni", "iso": "szl", "flagImageName": "sz.pdf", "signSymbol": "L"],
             "tjs" : ["currencyName": "Tajikistani Somoni", "iso": "tjs", "flagImageName": "tj.pdf", "signSymbol": "SM"],
             "tmt" : ["currencyName": "Turkmenistani Manat", "iso": "tmt", "flagImageName": "tm.pdf", "signSymbol": "m"],
             "tnd" : ["currencyName": "Tunisian Dinar", "iso": "tnd", "flagImageName": "tn.pdf", "signSymbol": "د.ت"],
             "top" : ["currencyName": "Tongan Paʻanga", "iso": "top", "flagImageName": "to.pdf", "signSymbol": "T$"],
             "try" : ["currencyName": "Turkish Lira", "iso": "try", "flagImageName": "tr.pdf", "signSymbol": "₺"],
             "tzs" : ["currencyName": "Tanzanian Shilling", "iso": "tzs", "flagImageName": "tz.pdf", "signSymbol": "Sh"],
             "ugx" : ["currencyName": "Ugandan Shilling", "iso": "ugx", "flagImageName": "ug.pdf", "signSymbol": "Sh"],
             "vuv" : ["currencyName": "Vanuatu Vatu", "iso": "vuv", "flagImageName": "vu.pdf", "signSymbol": "Vt"],
             "wst" : ["currencyName": "Samoan Tala", "iso": "wst", "flagImageName": "ws.pdf", "signSymbol": "T"],
             "xaf" : ["currencyName": "CFA Franc BEAC", "iso": "xaf", "flagImageName": "xa.pdf", "signSymbol": ""],
             "xag" : ["currencyName": "Silver (troy ounce)", "iso": "xag", "flagImageName": "xa.pdf", "signSymbol": ""],
             "xau" : ["currencyName": "Gold (troy ounce)", "iso": "xau", "flagImageName": "xa.pdf", "signSymbol": ""],
             "xdr" : ["currencyName": "Special Drawing Rights", "iso": "xdr", "flagImageName": "xd.pdf", "signSymbol": ""],
             "xof" : ["currencyName": "CFA Franc BCEAO", "iso": "xof", "flagImageName": "xo.pdf", "signSymbol": ""],
             "xpf" : ["currencyName": "CFP Franc", "iso": "xpf", "flagImageName": "xp.pdf", "signSymbol": ""],
             "zmk" : ["currencyName": "Zambian Kwacha (pre-2013)", "iso": "zmk", "flagImageName": "zm.pdf", "signSymbol": ""],
             "zmw" : ["currencyName": "Zambian Kwacha", "iso": "zmw", "flagImageName": "zm.pdf", "signSymbol": ""],
             "zwl" : ["currencyName": "Zimbabwean Dollar", "iso": "zwl", "flagImageName": "zw.pdf", "signSymbol": ""]]
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

