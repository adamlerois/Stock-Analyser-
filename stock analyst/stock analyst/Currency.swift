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
    
    
   
    var base: String
    var currencyUnit: String
    var currencyPrice: Double
    
    init(base: String, currencyUnit: String, currencyPrice: Double) {
        self.base = base
        self.currencyUnit = currencyUnit
        self.currencyPrice = currencyPrice
    }
//
//    init?(jsonDictionary: [String:AnyObject]) {
//        
//        guard let rates = jsonDictionary[KRates] as? [String: AnyObject] else { return nil }
//   
//        guard let base = jsonDictionary[KBase] as? String else{ return nil }
//            self.base = base
//        
//        self.currencyUnit = jsonDictionary["curencyUnit"] as? String ?? ""
//        self.currencyPrice = jsonDictionary["currencyPrice"] as? Double ?? 0.0
//    }
//    
//    
//    
//    
//    
}