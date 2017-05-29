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
    //Per country
    let allDetails = CurrencyFlagandSign(currencyName: "Lek", iso4217: "ALL", flagImageName: "all.png", signSymbol: "Lek") //Albania
    let afnDetails = CurrencyFlagandSign(currencyName: "Afghani", iso4217: "afn", flagImageName: "afn.png", signSymbol: "؋")
    let arsDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "ars", flagImageName: "ars.png", signSymbol: "$")
    let awgDetails = CurrencyFlagandSign(currencyName: "Guilder", iso4217: "awg", flagImageName: "awg.png", signSymbol: "ƒ")
    let audDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "aud", flagImageName: "aud.png", signSymbol: "$")
    let aznDetails = CurrencyFlagandSign(currencyName: "Manat", iso4217: "azn", flagImageName: "azn.png", signSymbol: "₼")
    let bsdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "bsd", flagImageName: "bsd.png", signSymbol: "$")
    let bbdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "bbd", flagImageName: "bbd.png", signSymbol: "$")
    let byrDetails = CurrencyFlagandSign(currencyName: "Ruble", iso4217: "byr", flagImageName: "byr.png", signSymbol: "p.")
    let bzdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "bzd", flagImageName: "bzd.png", signSymbol: "BZ$")
    let bmdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "bmd", flagImageName: "bmd.png", signSymbol: "$")
    let bobDetails = CurrencyFlagandSign(currencyName: "Boliviano", iso4217: "bob", flagImageName: "bob.png", signSymbol: "$b")
    let bamDetails = CurrencyFlagandSign(currencyName: "Convertible Marka", iso4217: "bam", flagImageName: "bam.png", signSymbol: "KM")
    let bwpDetails = CurrencyFlagandSign(currencyName: "Pula", iso4217: "bwp", flagImageName: "bwp.png", signSymbol: "P")
    let bgnDetails = CurrencyFlagandSign(currencyName: "Lev", iso4217: "bgn", flagImageName: "bgn.png", signSymbol: "лв")
    let brlDetails = CurrencyFlagandSign(currencyName: "Real", iso4217: "brl", flagImageName: "brl.png", signSymbol: "R$")
    let bndDetails = CurrencyFlagandSign(currencyName: "Darussalam Dollar", iso4217: "bnd", flagImageName: "bnd.png", signSymbol: "$")
    let khrDetails = CurrencyFlagandSign(currencyName: "Riel", iso4217: "khr", flagImageName: "khr.png", signSymbol: "៛")
    let cadDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "cad", flagImageName: "cad.png", signSymbol: "$")
    let kydDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "kyd", flagImageName: "kyd.png", signSymbol: "$")
    let clpDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "clp", flagImageName: "clp.png", signSymbol: "$")
    let cnyDetails = CurrencyFlagandSign(currencyName: "Yuan Renminbi", iso4217: "cny", flagImageName: "cny.png", signSymbol: "¥")
    let copDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "cop", flagImageName: "cop.png", signSymbol: "$")
    let crcDetails = CurrencyFlagandSign(currencyName: "Colon", iso4217: "crc", flagImageName: "crc.png", signSymbol: "₡")
    let hrkDetails = CurrencyFlagandSign(currencyName: "Kuna", iso4217: "hrk", flagImageName: "hrk.png", signSymbol: "kn")
    let cupDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "cup", flagImageName: "cup.png", signSymbol: "₱")
    let czkDetails = CurrencyFlagandSign(currencyName: "Koruna", iso4217: "czk", flagImageName: "czk.png", signSymbol: "Kč")
    let dkkDetails = CurrencyFlagandSign(currencyName: "Krone", iso4217: "dkk", flagImageName: "dkk.png", signSymbol: "kr")
    let dopDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "dop", flagImageName: "dop.png", signSymbol: "RD$")
    let xcdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "xcd", flagImageName: "xcd.png", signSymbol: "$")
    let egpDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "egp", flagImageName: "egp.png", signSymbol: "£")
    let svcDetails = CurrencyFlagandSign(currencyName: "Colon", iso4217: "svc", flagImageName: "svc.png", signSymbol: "$")
    let eekDetails = CurrencyFlagandSign(currencyName: "Kroon", iso4217: "eek", flagImageName: "eek.png", signSymbol: "kr")
    let eurDetails = CurrencyFlagandSign(currencyName: "Euro", iso4217: "eur", flagImageName: "eur.png", signSymbol: "€")
    let fkpDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "fkp", flagImageName: "fkp.png", signSymbol: "£")
    let fjdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "fjd", flagImageName: "fjd.png", signSymbol: "$")
    let gelDetails = CurrencyFlagandSign(currencyName: "Lari", iso4217: "gel", flagImageName: "gel.png", signSymbol: "₾")
    let ghcDetails = CurrencyFlagandSign(currencyName: "Cedis", iso4217: "ghc", flagImageName: "ghc.png", signSymbol: "¢")
    let gipDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "gip", flagImageName: "gip.png", signSymbol: "£")
    let gtqDetails = CurrencyFlagandSign(currencyName: "Quetzal", iso4217: "gtq", flagImageName: "gtq.png", signSymbol: "Q")
    let ggpDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "ggp", flagImageName: "ggp.png", signSymbol: "£")
    let gydDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "gyd", flagImageName: "gyd.png", signSymbol: "$")
    let hnlDetails = CurrencyFlagandSign(currencyName: "Lempira", iso4217: "hnl", flagImageName: "hnl.png", signSymbol: "L")
    let hkdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "hkd", flagImageName: "hkd.png", signSymbol: "$")
    let hufDetails = CurrencyFlagandSign(currencyName: "Forint", iso4217: "huf", flagImageName: "huf.png", signSymbol: "Ft")
    let iskDetails = CurrencyFlagandSign(currencyName: "Krona", iso4217: "isk", flagImageName: "isk.png", signSymbol: "kr")
    let inrDetails = CurrencyFlagandSign(currencyName: "Rupee", iso4217: "inr", flagImageName: "inr.png", signSymbol: "₹")
    let idrDetails = CurrencyFlagandSign(currencyName: "Rupiah", iso4217: "idr", flagImageName: "idr.png", signSymbol: "Rp")
    let irrDetails = CurrencyFlagandSign(currencyName: "Rial", iso4217: "irr", flagImageName: "irr.png", signSymbol: "﷼")
    let impDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "imp", flagImageName: "imp.png", signSymbol: "£")
    let ilsDetails = CurrencyFlagandSign(currencyName: "Shekel", iso4217: "ils", flagImageName: "ils.png", signSymbol: "₪")
    let jmdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "jmd", flagImageName: "jmd.png", signSymbol: "J$")
    let jpyDetails = CurrencyFlagandSign(currencyName: "Yen", iso4217: "jpy", flagImageName: "jpy.png", signSymbol: "¥")
    let jepDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "jep", flagImageName: "jep.png", signSymbol: "£")
    let kztDetails = CurrencyFlagandSign(currencyName: "Tenge", iso4217: "kzt", flagImageName: "kzt.png", signSymbol: "лв")
    let kpwDetails = CurrencyFlagandSign(currencyName: "Won", iso4217: "kpw", flagImageName: "kpw.png", signSymbol: "₩")
    let krwDetails = CurrencyFlagandSign(currencyName: "Won", iso4217: "krw", flagImageName: "krw.png", signSymbol: "₩")
    let kgsDetails = CurrencyFlagandSign(currencyName: "Som", iso4217: "kgs", flagImageName: "kgs.png", signSymbol: "лв")
    let lakDetails = CurrencyFlagandSign(currencyName: "Kip", iso4217: "lak", flagImageName: "lak.png", signSymbol: "₭")
    let lvlDetails = CurrencyFlagandSign(currencyName: "Lat", iso4217: "lvl", flagImageName: "lvl.png", signSymbol: "Ls")
    let lbpDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "lbp", flagImageName: "lbp.png", signSymbol: "£")
    let lrdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "lrd", flagImageName: "lrd.png", signSymbol: "$")
    let ltlDetails = CurrencyFlagandSign(currencyName: "Litas", iso4217: "ltl", flagImageName: "ltl.png", signSymbol: "Lt")
    let mkdDetails = CurrencyFlagandSign(currencyName: "Denar", iso4217: "mkd", flagImageName: "mkd.png", signSymbol: "ден")
    let myrDetails = CurrencyFlagandSign(currencyName: "Ringgit", iso4217: "myr", flagImageName: "myr.png", signSymbol: "RM")
    let murDetails = CurrencyFlagandSign(currencyName: "Rupee", iso4217: "mur", flagImageName: "mur.png", signSymbol: "₨")
    let mxnDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "mxn", flagImageName: "mxn.png", signSymbol: "$")
    let mntDetails = CurrencyFlagandSign(currencyName: "Tughrik", iso4217: "mnt", flagImageName: "mnt.png", signSymbol: "₮")
    let mznDetails = CurrencyFlagandSign(currencyName: "Metical", iso4217: "mzn", flagImageName: "mzn.png", signSymbol: "MT")
    let nadDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "nad", flagImageName: "nad.png", signSymbol: "$")
    let nprDetails = CurrencyFlagandSign(currencyName: "Rupee", iso4217: "npr", flagImageName: "npr.png", signSymbol: "₨")
    let angDetails = CurrencyFlagandSign(currencyName: "Antilles Guilder", iso4217: "ang", flagImageName: "ang.png", signSymbol: "ƒ")
    let nzdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "nzd", flagImageName: "nzd.png", signSymbol: "$")
    let nioDetails = CurrencyFlagandSign(currencyName: "Cordoba", iso4217: "nio", flagImageName: "nio.png", signSymbol: "C$")
    let ngnDetails = CurrencyFlagandSign(currencyName: "Naira", iso4217: "ngn", flagImageName: "ngn.png", signSymbol: "₦")
    let nokDetails = CurrencyFlagandSign(currencyName: "Krone", iso4217: "nok", flagImageName: "nok.png", signSymbol: "kr")
    let omrDetails = CurrencyFlagandSign(currencyName: "Rial", iso4217: "omr", flagImageName: "omr.png", signSymbol: "﷼")
    let pkrDetails = CurrencyFlagandSign(currencyName: "Rupee", iso4217: "pkr", flagImageName: "pkr.png", signSymbol: "₨")
    let pabDetails = CurrencyFlagandSign(currencyName: "Balboa", iso4217: "pab", flagImageName: "pab.png", signSymbol: "B/.")
    let pygDetails = CurrencyFlagandSign(currencyName: "Guarani", iso4217: "pyg", flagImageName: "pyg.png", signSymbol: "Gs")
    let penDetails = CurrencyFlagandSign(currencyName: "Nuevo Sol", iso4217: "pen", flagImageName: "pen.png", signSymbol: "S/.")
    let phpDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "php", flagImageName: "php.png", signSymbol: "₱")
    let plnDetails = CurrencyFlagandSign(currencyName: "Zloty", iso4217: "pln", flagImageName: "pln.png", signSymbol: "zł")
    let qarDetails = CurrencyFlagandSign(currencyName: "Riyal", iso4217: "qar", flagImageName: "qar.png", signSymbol: "﷼")
    let ronDetails = CurrencyFlagandSign(currencyName: "New Leu", iso4217: "ron", flagImageName: "ron.png", signSymbol: "lei")
    let rubDetails = CurrencyFlagandSign(currencyName: "Ruble", iso4217: "rub", flagImageName: "rub.png", signSymbol: "₽")
    let shpDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "shp", flagImageName: "shp.png", signSymbol: "£")
    let sarDetails = CurrencyFlagandSign(currencyName: "Riyal", iso4217: "sar", flagImageName: "sar.png", signSymbol: "﷼")
    let rsdDetails = CurrencyFlagandSign(currencyName: "Dinar", iso4217: "rsd", flagImageName: "rsd.png", signSymbol: "Дин.")
    let scrDetails = CurrencyFlagandSign(currencyName: "Rupee", iso4217: "scr", flagImageName: "scr.png", signSymbol: "₨")
    let sgdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "sgd", flagImageName: "sgd.png", signSymbol: "$")
    let sbdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "sbd", flagImageName: "sbd.png", signSymbol: "$")
    let sosDetails = CurrencyFlagandSign(currencyName: "Shilling", iso4217: "sos", flagImageName: "sos.png", signSymbol: "S")
    let zarDetails = CurrencyFlagandSign(currencyName: "Rand", iso4217: "zar", flagImageName: "zar.png", signSymbol: "R")
    let lkrDetails = CurrencyFlagandSign(currencyName: "Rupee", iso4217: "lkr", flagImageName: "lkr.png", signSymbol: "₨")
    let sekDetails = CurrencyFlagandSign(currencyName: "Krona", iso4217: "sek", flagImageName: "sek.png", signSymbol: "kr")
    let chfDetails = CurrencyFlagandSign(currencyName: "Franc", iso4217: "chf", flagImageName: "chf.png", signSymbol: "CHF")
    let srdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "srd", flagImageName: "srd.png", signSymbol: "$")
    let sypDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "syp", flagImageName: "syp.png", signSymbol: "£")
    let twdDetails = CurrencyFlagandSign(currencyName: "New Dollar", iso4217: "twd", flagImageName: "twd.png", signSymbol: "NT$")
    let thbDetails = CurrencyFlagandSign(currencyName: "Baht", iso4217: "thb", flagImageName: "thb.png", signSymbol: "฿")
    let ttdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "ttd", flagImageName: "ttd.png", signSymbol: "TT$")
    let trlDetails = CurrencyFlagandSign(currencyName: "Lira", iso4217: "trl", flagImageName: "trl.png", signSymbol: "₺")
    let tvdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "tvd", flagImageName: "tvd.png", signSymbol: "$")
    let uahDetails = CurrencyFlagandSign(currencyName: "Hryvna", iso4217: "uah", flagImageName: "uah.png", signSymbol: "₴")
    let gbpDetails = CurrencyFlagandSign(currencyName: "Pound", iso4217: "gbp", flagImageName: "gbp.png", signSymbol: "£")
    let usdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "usd", flagImageName: "usd.png", signSymbol: "$")
    let uyuDetails = CurrencyFlagandSign(currencyName: "Peso", iso4217: "uyu", flagImageName: "uyu.png", signSymbol: "$U")
    let uzsDetails = CurrencyFlagandSign(currencyName: "Som", iso4217: "uzs", flagImageName: "uzs.png", signSymbol: "лв")
    let vefDetails = CurrencyFlagandSign(currencyName: "Bolivar Fuerte", iso4217: "vef", flagImageName: "vef.png", signSymbol: "Bs")
    let vndDetails = CurrencyFlagandSign(currencyName: "Dong", iso4217: "vnd", flagImageName: "vnd.png", signSymbol: "₫")
    let yerDetails = CurrencyFlagandSign(currencyName: "Rial", iso4217: "yer", flagImageName: "yer.png", signSymbol: "﷼")
    let zwdDetails = CurrencyFlagandSign(currencyName: "Dollar", iso4217: "zwd", flagImageName: "zwd.png", signSymbol: "Z$")
    
    
    var flagAndSignsDictionary: [String: CurrencyFlagandSign] = [:]
    
    init() {
       self.flagAndSignsDictionary = self.createDictionaries()
    }
    
    func createDictionaries() -> [String: CurrencyFlagandSign] {
        return ["all" : self.allDetails,
                "afn" : self.afnDetails,
                "ars" : self.arsDetails,
                "awg" : self.awgDetails,
                "aud" : self.audDetails,
                "azn" : self.aznDetails,
                "bsd" : self.bsdDetails,
                "bbd" : self.bbdDetails,
                "byr" : self.byrDetails,
                "bzd" : self.bzdDetails,
                "bmd" : self.bmdDetails,
                "bob" : self.bobDetails,
                "bam" : self.bamDetails,
                "bwp" : self.bwpDetails,
                "bgn" : self.bgnDetails,
                "brl" : self.brlDetails,
                "bnd" : self.bndDetails,
                "khr" : self.khrDetails,
                "cad" : self.cadDetails,
                "kyd" : self.kydDetails,
                "clp" : self.clpDetails,
                "cny" : self.cnyDetails,
                "cop" : self.copDetails,
                "crc" : self.crcDetails,
                "hrk" : self.hrkDetails,
                "cup" : self.cupDetails,
                "czk" : self.czkDetails,
                "dkk" : self.dkkDetails,
                "dop" : self.dopDetails,
                "xcd" : self.xcdDetails,
                "egp" : self.egpDetails,
                "svc" : self.svcDetails,
                "eek" : self.eekDetails,
                "eur" : self.eurDetails,
                "fkp" : self.fkpDetails,
                "fjd" : self.fjdDetails,
                "gel" : self.gelDetails,
                "ghc" : self.ghcDetails,
                "gip" : self.gipDetails,
                "gtq" : self.gtqDetails,
                "ggp" : self.ggpDetails,
                "gyd" : self.gydDetails,
                "hnl" : self.hnlDetails,
                "hkd" : self.hkdDetails,
                "huf" : self.hufDetails,
                "isk" : self.iskDetails,
                "inr" : self.inrDetails,
                "idr" : self.idrDetails,
                "irr" : self.irrDetails,
                "imp" : self.impDetails,
                "ils" : self.ilsDetails,
                "jmd" : self.jmdDetails,
                "jpy" : self.jpyDetails,
                "jep" : self.jepDetails,
                "kzt" : self.kztDetails,
                "kpw" : self.kpwDetails,
                "krw" : self.krwDetails,
                "kgs" : self.kgsDetails,
                "lak" : self.lakDetails,
                "lvl" : self.lvlDetails,
                "lbp" : self.lbpDetails,
                "lrd" : self.lrdDetails,
                "ltl" : self.ltlDetails,
                "mkd" : self.mkdDetails,
                "myr" : self.myrDetails,
                "mur" : self.murDetails,
                "mxn" : self.mxnDetails,
                "mnt" : self.mntDetails,
                "mzn" : self.mznDetails,
                "nad" : self.nadDetails,
                "npr" : self.nprDetails,
                "ang" : self.angDetails,
                "nzd" : self.nzdDetails,
                "nio" : self.nioDetails,
                "ngn" : self.ngnDetails,
                "nok" : self.nokDetails,
                "omr" : self.omrDetails,
                "pkr" : self.pkrDetails,
                "pab" : self.pabDetails,
                "pyg" : self.pygDetails,
                "pen" : self.penDetails,
                "php" : self.phpDetails,
                "pln" : self.plnDetails,
                "qar" : self.qarDetails,
                "ron" : self.ronDetails,
                "rub" : self.rubDetails,
                "shp" : self.shpDetails,
                "sar" : self.sarDetails,
                "rsd" : self.rsdDetails,
                "scr" : self.scrDetails,
                "sgd" : self.sgdDetails,
                "sbd" : self.sbdDetails,
                "sos" : self.sosDetails,
                "zar" : self.zarDetails,
                "lkr" : self.lkrDetails,
                "sek" : self.sekDetails,
                "chf" : self.chfDetails,
                "srd" : self.srdDetails,
                "syp" : self.sypDetails,
                "twd" : self.twdDetails,
                "thb" : self.thbDetails,
                "ttd" : self.ttdDetails,
                "trl" : self.trlDetails,
                "tvd" : self.tvdDetails,
                "uah" : self.uahDetails,
                "gbp" : self.gbpDetails,
                "usd" : self.usdDetails,
                "uyu" : self.uyuDetails,
                "uzs" : self.uzsDetails,
                "vef" : self.vefDetails,
                "vnd" : self.vndDetails,
                "yer" : self.yerDetails,
                "zwd" : self.zwdDetails ]
    }
}
