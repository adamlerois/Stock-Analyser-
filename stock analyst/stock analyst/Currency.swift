//
//  Currency.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/29/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import UIKit
class Currency {
    private let KBase = "base"
    private let KRates = "rates"
    private let KAud = "AUD"
    private let KBgn = "BGN"
    private let KBrl = "BRL"
    private let KCad = "CAD"
    private let KChf = "CHF"
    private let KCny = "CNY"
    private let KCzk = "CZK"
    private let KDkk = "DKK"
    private let KGbp = "GBP"
    private let KHkd = "HKD"
    private let KHrk = "HRK"
    private let KHuf = "HUF"
    private let KIdr = "IDR"
    private let KIls = "ILS"
    private let KInr = "INR"
    private let KJpy = "JPY"
    private let KKrw = "KRW"
    private let KMxn = "MXN"
    private let KMyr = "MYR"
    private let KNok = "NOK"
    private let KNsd = "NSD"
    private let KPhp = "PHP"
    private let KPln = "PLN"
    private let KRon = "RON"
    private let KRub = "RUB"
    private let KSek = "SEK"
    private let KSgd = "SGD"
    private let KThb = "THB"
    private let KTRy = "TRY"
    private let KZar = "ZAR"
    private let KEur = "EUR"
 
    
    var base: String
    var aud: Double
    var bgn: Double
    var brl: Double
    var cad: Double
    var chf: Double
    var cny: Double
    var czk: Double
    var dkk: Double
    var gbp: Double
    var hkd: Double
    var hrk: Double
    var huf: Double
    var idr: Double
    var ils: Double
    var inr: Double
    var jpy: Double
    var krw: Double
    var mxn: Double
    var myr: Double
    var nok: Double
    var nsd: Double
    var php: Double
    var pln: Double
    var ron: Double
    var rub: Double
    var sek: Double
    var sgd: Double
    var thb: Double
    var tRy: Double
    var zar: Double
    var eur: Double
    
    
    init(base: String, date: NSDate, aud: Double, bgn: Double, brl: Double, cad: Double, chf: Double, cny: Double, czk: Double, dkk: Double, gbp: Double, hkd: Double, hrk: Double, huf: Double, idr :Double, ils: Double, inr: Double, jpy: Double, krw: Double, mxn: Double, myr: Double, nok: Double, nsd: Double, php: Double, pln: Double, ron: Double, rub: Double, sek: Double, sgd: Double, thb: Double, tRy: Double, zar: Double, eur: Double) {
        self.base = base
        self.aud = aud
        self.bgn = bgn
        self.brl = brl
        self.cad = cad
        self.chf = chf
        self.cny = cny
        self.czk = czk
        self.dkk = dkk
        self.gbp = gbp
        self.hkd = hkd
        self.hrk = hrk
        self.huf = huf
        self.idr = idr
        self.ils = ils
        self.inr = inr
        self.jpy = jpy
        self.krw = krw
        self.mxn = mxn
        self.myr = myr
        self.nok = nok
        self.nsd = nsd
        self.php = php
        self.pln = pln
        self.ron = ron
        self.rub = rub
        self.sek = sek
        self.sgd = sgd
        self.thb = thb
        self.tRy = tRy
        self.zar = zar
        self.eur = zar
    }
    
    
    init?(jsonDictionary: [String:AnyObject]) {
        
        guard let rates = jsonDictionary[KRates] as? [String: AnyObject] else { return nil }
            
            self.aud = jsonDictionary[KAud] as? Double ?? 0.0
            self.bgn = jsonDictionary[KBgn] as? Double ?? 0.0
            self.brl = jsonDictionary[KBrl] as? Double ?? 0.0
            self.cad = jsonDictionary[KCad] as? Double ?? 0.0
            self.chf = jsonDictionary[KChf] as? Double ?? 0.0
            self.cny = jsonDictionary[KCny] as? Double ?? 0.0
            self.czk = jsonDictionary[KCzk] as? Double ?? 0.0
            self.dkk = jsonDictionary[KDkk] as? Double ?? 0.0
            self.gbp = jsonDictionary[KGbp] as? Double ?? 0.0
            self.hkd = jsonDictionary[KHkd] as? Double ?? 0.0
            self.hrk = jsonDictionary[KHrk] as? Double ?? 0.0
            self.huf = jsonDictionary[KHuf] as? Double ?? 0.0
            self.idr = jsonDictionary[KIdr] as? Double ?? 0.0
            self.ils = jsonDictionary[KIls] as? Double ?? 0.0
            self.inr = jsonDictionary[KInr] as? Double ?? 0.0
            self.jpy = jsonDictionary[KJpy] as? Double ?? 0.0
            self.krw = jsonDictionary[KKrw] as? Double ?? 0.0
            self.mxn = jsonDictionary[KMxn] as? Double ?? 0.0
            self.myr = jsonDictionary[KMyr] as? Double ?? 0.0
            self.nok = jsonDictionary[KNok] as? Double ?? 0.0
            self.nsd = jsonDictionary[KNsd] as? Double ?? 0.0
            self.php = jsonDictionary[KPhp] as? Double ?? 0.0
            self.pln = jsonDictionary[KPln] as? Double ?? 0.0
            self.ron = jsonDictionary[KRon] as? Double ?? 0.0
            self.rub = jsonDictionary[KRub] as? Double ?? 0.0
            self.sek = jsonDictionary[KSek] as? Double ?? 0.0
            self.sgd = jsonDictionary[KSgd] as? Double ?? 0.0
            self.thb = jsonDictionary[KThb] as? Double ?? 0.0
            self.tRy = jsonDictionary[KTRy] as? Double ?? 0.0
            self.zar = jsonDictionary[KZar] as? Double ?? 0.0
            self.eur = jsonDictionary[KEur] as? Double ?? 0.0
        
        
        guard let base = jsonDictionary[KBase] as? String else{ return nil }
            self.base = base
        
    }
    
    
    
    
    
}